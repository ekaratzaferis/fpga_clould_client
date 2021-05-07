`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:56 05/07/2014 
// Design Name: 
// Module Name:    sound_buffering 
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
module sound_buffering(

	input wire clk,
	input wire reset,
	
	//AC97
	input wire new_sample,
	output reg [15:0] left_channel,
	output reg [15:0] right_channel,
	
	output reg [7:0] debug,
	
	//RX
	input wire sound_packet,
	input wire rx_valid,
	input wire [7:0] rx_data

);

parameter buffer_size = 16'd47999;

reg [0:0] wea = 0;
reg [15:0] write_counter = 0;
reg [15:0] read_counter = 0;
reg [31:0] data_in = 0;
wire [31:0] data_out;

ram_2940x16 buffer(
	.clka(clk),
	.wea(wea),
	.addra(write_counter),
	.dina(data_in),
	.clkb(clk),
	.addrb(read_counter),
	.doutb(data_out)
);

reg [7:0] store = 0;
reg first = 1;
reg write_pass = 0;
reg waitt = 0;

//STORE FSM
always @(posedge clk) begin

	if (reset) begin
		store <= 0;
		write_counter <= 0;
		data_in <= 0;
		wea <= 0;
		first <= 1;
		write_pass <= 0;
		waitt <= 0;
	end
	else begin
		case(store)
			0: if (sound_packet) begin
					store <= store + 1;
					waitt <= 1;
				end
			1: begin
					if (rx_valid) begin
						data_in[31:24] <= rx_data; //UPPER LEFT
						store <= store + 1;
						waitt <= 0;
					end
					else if (!waitt) store <= 0;
					wea <= 0;
				end
			2: if (rx_valid) begin
					data_in[23:16] <= rx_data; //LEFT
					store <= store + 1;
				end
				else begin
					wea <= 0;
					store <= 0;
				end
			3: if (rx_valid) begin
					data_in[15:8] <= rx_data; // UPPER RIGHT
					store <= store + 1;
				end
				else begin
					wea <= 0;
					store <= 0;
				end
			4: if (rx_valid) begin
					data_in[7:0] <= rx_data; //RIGHT
					store <= 8'h1;
					wea <= 1;
					//CALC ADDRESS
					if (write_counter == buffer_size) begin
						write_pass <= ~write_pass;
						write_counter <= 0;
					end
					else if (first) first <= 0;
					else write_counter <= write_counter + 1;
				end
				else begin
					wea <= 0;
					store <= 0;
				end
		endcase
	end

end

reg [7:0] playback = 0;
reg read_pass = 0;

always @(posedge clk) begin

	if (reset) begin
		playback <= 0;
		read_counter <= 0;
		read_pass <= 0;
	end
	else begin
		case(playback)
			0: begin
					left_channel <= 0;
					right_channel <= 0;
					if ((read_counter != (write_counter+1))&(write_counter!=0)) playback <= 8'h1;
				end
			1: if (new_sample) begin
					left_channel <= data_out[31:16];
					right_channel <= data_out[15:0];
					playback <= playback + 1;
				end
			2: begin
					//CHECK IF WE NEED TO STOP
					if ( (read_pass == write_pass) & (read_counter == write_counter) ) playback <= 0;
					else playback <= 8'h1;
					
					//CALC NEXT ADDRESS ANYWAYS
					if (read_counter == buffer_size) begin
						read_counter <= 0;
						read_pass <= ~read_pass;
					end
					else read_counter <= read_counter + 1;
				end
		endcase
	end

end

endmodule
