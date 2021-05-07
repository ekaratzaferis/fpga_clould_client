`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:18 01/16/2015 
// Design Name: 
// Module Name:    ram_ui 
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
module ram_ui(

	input wire clk0_tb,
	input wire rst0_tb,
	
	input wire phy_init_done,
	input wire app_af_afull,
	input wire app_wdf_afull,
	input wire rd_data_valid,
	input wire [127:0] rd_data_fifo_out,
	
	output reg [2:0] cmd,
	output reg [30:0] address,
	output reg af_we,
	output reg wdf_we,
	output reg [127:0] w_data,
	output wire [7:0] debug

);

reg [7:0] state = 0;
assign debug = state;
reg [7:0] delay = 0;

always @(posedge clk0_tb) begin

	if (rst0_tb) begin
		cmd <= 0;
		address <= 0;
		af_we <= 0;
		wdf_we <= 0;
		w_data <= 0;
		state <= 0;
		delay <= 0;
	end
	else if (phy_init_done) begin
	
		case(state)
			0: if ( (!app_af_afull) & (!app_wdf_afull) ) begin
					cmd <= 3'b000;
					address <= 31'd90000;
					af_we <= 1;
					wdf_we <= 1;
					w_data <= 128'd1;
					state <= state + 1;
				end
			1: begin
					af_we <= 0;
					w_data <= 128'd2;
					state <= state + 1;
				end
			2: begin
					address <= 31'd90001;
					af_we <= 1;
					w_data <= 128'd3;
					state <= state + 1;
				end
			3: begin
					af_we <= 0;
					w_data <= 128'd4;
					state <= state + 1;
				end
			4: begin
					address <= 31'd90002;
					af_we <= 1;
					w_data <= 128'd5;
					state <= state + 1;
				end
			5: begin
					af_we <= 0;
					w_data <= 128'd6;
					state <= state + 1;
				end
			6: begin
					address <= 31'd90003;
					af_we <= 1;
					w_data <= 128'd7;
					state <= state + 1;
				end
			7: begin
					af_we <= 0;
					w_data <= 128'd8;
					state <= state + 1;
				end
			8: begin
					cmd <= 0;
					address <= 0;
					af_we <= 0;
					wdf_we <= 0;
					w_data <= 0;
					state <= state + 1;
				end
			9: if (delay != 8'b11111111) begin
					delay <= delay + 1;
				end
				else state <= state + 1;
			10: if (!app_af_afull) begin
					cmd <= 3'b001;
					address <= 31'd90000;
					af_we <= 1;
					state <= state + 1;
				end
			11: begin
					address <= 31'd90001;
					state <= state + 1;
				end
			12: begin
					address <= 31'd90002;
					state <= state + 1;
				end
			13: begin
					address <= 31'd90003;
					state <= state + 1;
				end
			14: begin
					cmd <= 0;
					address <= 0;
					af_we <= 0;
					if (rd_data_valid) begin
						if (rd_data_fifo_out == 128'd1) state <= state + 1;
					end
				end
			15: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd2) state <= state + 1;
				end
			16: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd3) state <= state + 1;
				end
			17: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd4) state <= state + 1;
				end
			18: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd5) state <= state + 1;
				end
			19: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd6) state <= state + 1;
				end
			20: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd7) state <= state + 1;
				end
			21: if (rd_data_valid) begin
					if (rd_data_fifo_out == 128'd8) state <= state + 1;
				end
		endcase
	
	end

end

endmodule
