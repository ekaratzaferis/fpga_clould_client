`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:44 11/03/2014 
// Design Name: 
// Module Name:    frame_reader 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module frame_reader(
	input clk,
	input reset,
	
	input ram_init,
	input phy_init_done,
	
	output [6143:0] read_data,
	input ask_data,
	input new_frame,
	
	output reg read_out,
	output reg [31:0] r_address_out,
	
	input ready,
	input [767:0] read_data_in
);

reg reading = 0;
reg framing = 0;
reg [2:0] burst_counter = 0;

reg [4:0] fsm = 0;
reg [767:0] burst_data_0 = 0;
reg [767:0] burst_data_1 = 0;
reg [767:0] burst_data_2 = 0;
reg [767:0] burst_data_3 = 0;
reg [767:0] burst_data_4 = 0;
reg [767:0] burst_data_5 = 0;
reg [767:0] burst_data_6 = 0;
reg [767:0] burst_data_7 = 0;


always @(posedge clk) begin

	if (reset) begin
		read_out <= 0;
		r_address_out <= 0;
		reading <= 0;
		framing <= 0;
		burst_counter <= 0;
		fsm <= 0;
	end
	else if ( (ram_init) & (phy_init_done) ) begin
	
		if (reading) begin
			case(fsm)
				1: begin
						read_out <= 0;
						fsm <= fsm + 1;
					end
				2: begin
						if (r_address_out == 32'd393200) r_address_out <= 0;
						else r_address_out <= r_address_out + 16;
						fsm <= fsm + 1;
					end
				3: if (ready) begin
						if(burst_counter == 3'd7) begin
							fsm <= 0;
							reading <= 0;
							burst_counter <= 0;
						end
						else begin
							fsm <= 5'b00001;
							read_out <= 1;
							burst_counter <= burst_counter + 1;
						end
						case(burst_counter)
							0: burst_data_0 <= read_data_in;
							1: burst_data_1 <= read_data_in;
							2: burst_data_2 <= read_data_in;
							3: burst_data_3 <= read_data_in;
							4: burst_data_4 <= read_data_in;
							5: burst_data_5 <= read_data_in;
							6: burst_data_6 <= read_data_in;
							7: burst_data_7 <= read_data_in;
						endcase
					end
			endcase
		end
		else if ( (ask_data) & (framing) )begin
			reading <= 1;
			read_out <= 1;
			fsm <= 5'b00001;
		end
		else if (new_frame & (!framing)) begin
			reading <= 1;
			read_out <= 1;
			fsm <= 5'b00001;
			framing <= 1;
		end
	
	end

end

assign read_data = {burst_data_0,burst_data_1,burst_data_2,burst_data_3,burst_data_4,burst_data_5,burst_data_6,burst_data_7};

endmodule
