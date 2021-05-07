`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:07 11/02/2014 
// Design Name: 
// Module Name:    read_burst 
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
module read_burst(

	input clk,
	input reset,
	
	input app_af_afull,
	input read,
	input [31:0] address_in,
	output reg [767:0] read_data_out,
	output reg busy,
	output reg ready,
	
	//RAM
	input valid,
	input [127:0] read_data_in,
	output reg read_address_enable,
	output reg [2:0] read_command,
	output reg [31:0] address_out

);

reg [4:0] read_fsm = 0;

always @(posedge clk) begin

	if (reset) begin
		read_data_out <= 0;
		read_address_enable <= 0;
		read_command <= 0;
		address_out <= 0;
		busy <= 0;
		read_fsm <= 0;
		ready <= 0;
	end
	else begin
	
		if ( (!busy) & (read) ) begin
			busy <= 1;
			read_fsm <= 4'b0001;
		end
		else if (read_fsm == 4'd13) ready <= 1;
		else if (read_fsm == 4'd0) begin
			busy <= 0;
			ready <= 0;
		end 
		
		// REFRESH SMALL FRAME BUFFER
		case(read_fsm)
			1: if (!app_af_afull) begin
					read_address_enable <= 1;
					read_command <= 3'b001;
					address_out <= address_in;
					read_fsm <= read_fsm + 1;
				end
			2: begin
					read_fsm <= read_fsm + 1;
					address_out <= address_in + 4;
				end
			3: begin
					read_fsm <= read_fsm + 1;
					address_out <= address_in + 8;
				end
			4: begin
					read_fsm <= read_fsm + 1;
					address_out <= address_in + 12;
				end
			5: begin
					read_address_enable <= 0;
					if (valid) begin
						read_data_out[767:640] <= read_data_in;
						read_fsm <= read_fsm + 1;
					end
				end
			6: if (valid) begin
					read_data_out[639:576] <= read_data_in[127:64];
					read_fsm <= read_fsm + 1;
				end
			7: if (valid) begin
					read_data_out[575:448] <= read_data_in;
					read_fsm <= read_fsm + 1;
				end
			8: if (valid) begin
					read_data_out[447:384] <= read_data_in[127:64];
					read_fsm <= read_fsm + 1;
				end
			9: if (valid) begin
					read_data_out[383:256] <= read_data_in;
					read_fsm <= read_fsm + 1;
				end
			10: if (valid) begin
					read_data_out[255:192] <= read_data_in[127:64];
					read_fsm <= read_fsm + 1;
				end
			11: if (valid) begin
					read_data_out[191:64] <= read_data_in;
					read_fsm <= read_fsm + 1;
				end
			12: if (valid) begin
					read_data_out[63:0] <= read_data_in[127:64];
					read_fsm <= read_fsm + 1;
				end
			13: read_fsm <= 0;
				
		endcase
		
	end

end

endmodule
