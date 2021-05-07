`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:00 02/26/2014 
// Design Name: 
// Module Name:    mouse_configuration 
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
module mouse_configuration(
	input clk,
	input reset,
	input busy,
	input read,
	input [7:0] rx_data,
	output write,
	output [7:0] tx_data,
	output debug
);

reg [5:0] reset_fsm = 0;

reg [7:0] device_id = 8'hff;
reg debug_reg = 0;

reg write_data = 1'b0;
reg [7:0] data_out = 8'h00;

always @(posedge clk) begin
	
	if (reset) begin
		reset_fsm <= 6'b000001;
		write_data <= 1'b0;
		data_out <= 8'h00;
	end
	else begin
		case (reset_fsm)
			0:	reset_fsm <= 0;
			1: begin //reset
					write_data <= 1'b1;
					data_out <= 8'hff;
					reset_fsm <= reset_fsm + 1;
				end
			2: begin //receive aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) begin
							reset_fsm <= reset_fsm + 1;
						end
						else begin
							reset_fsm <= reset_fsm - 1;
						end
					end
				end
			3: begin // self test passed
					if (read) begin
						if (rx_data == 8'haa) reset_fsm <= reset_fsm + 1;
					end
				end
			4: begin // read device id
					if (read) begin
						if (rx_data == 8'h00) begin
							device_id <= rx_data;
							reset_fsm <= reset_fsm + 1;
						end
					end
				end
			5: begin //get schroll wheel working - set sample rate
					write_data <= 1'b1;
					data_out <= 8'hf3;
					reset_fsm <= reset_fsm + 1;
				end
			6: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			7: begin
					write_data <= 1'b1;
					data_out <= 8'hc8;
					reset_fsm <= reset_fsm + 1;
				end
			8: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			9: begin // set sample rate
					write_data <= 1'b1;
					data_out <= 8'hf3;
					reset_fsm <= reset_fsm + 1;
				end
			10: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			11: begin
					write_data <= 1'b1;
					data_out <= 8'h64;
					reset_fsm <= reset_fsm + 1;
				end
			12: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			13: begin //set sample rate
					write_data <= 1'b1;
					data_out <= 8'hf3;
					reset_fsm <= reset_fsm + 1;
				end
			14: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			15: begin
					write_data <= 1'b1;
					data_out <= 8'h50;
					reset_fsm <= reset_fsm + 1;
				end
			16: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			17: begin //read device type
					write_data <= 1'b1;
					data_out <= 8'hf2;
					reset_fsm <= reset_fsm + 1;
				end
			18: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			19: begin // read device id
					if (read) begin
						if (rx_data == 8'h03) begin
							device_id <= rx_data;
							reset_fsm <= reset_fsm + 1;
						end
					end
				end
			20: begin // set resolution
					write_data <= 1'b1;
					data_out <= 8'he8;
					reset_fsm <= reset_fsm + 1;
				end
			21: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			22: begin
					write_data <= 1'b1;
					data_out <= 8'h03;
					reset_fsm <= reset_fsm + 1;
				end
			23: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			24: begin //set scaling
					write_data <= 1'b1;
					data_out <= 8'he6;
					reset_fsm <= reset_fsm + 1;
				end
			25: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			26: begin //set sample rate
					write_data <= 1'b1;
					data_out <= 8'hf3;
					reset_fsm <= reset_fsm + 1;
				end
			27: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			28: begin //set scaling
					write_data <= 1'b1;
					data_out <= 8'h28;
					reset_fsm <= reset_fsm + 1;
				end
			29: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) reset_fsm <= reset_fsm + 1;
					end
				end
			30: begin //set scaling
					write_data <= 1'b1;
					data_out <= 8'hf4;
					reset_fsm <= reset_fsm + 1;
				end
			31: begin //aknowledge
					write_data <= 1'b0;
					data_out <= 8'h00;
					if (read) begin
						if (rx_data == 8'hfa) begin
							reset_fsm <= reset_fsm + 1;
							debug_reg <= 1;
						end
					end
				end
		endcase
	end

end

assign write = write_data;
assign tx_data = data_out;
assign debug = debug_reg;

endmodule
