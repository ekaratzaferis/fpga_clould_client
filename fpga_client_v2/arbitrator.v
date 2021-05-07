`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:58 11/03/2014 
// Design Name: 
// Module Name:    arbitrator 
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
module arbitrator(
	input clk,
	input reset,
	
	//SYSTEM
	input phy_init_done,
	input r_busy,
	input w_busy,
	
	//ETHERNET
	input write_in,
	input [31:0] w_address_in,
	input [767:0] w_data_in,
	
	//WRITE BURST
	output reg write_out,
	output reg [31:0] w_address_out,
	output reg [767:0] w_data_out,
	
	//DVI
	input read_in,
	input [31:0] r_address_in,
	
	//READ BURST
	output reg read_out,
	output reg [31:0] r_address_out
	
);

reg forward_write = 0;
reg forward_read = 0;
reg [2:0] block = 0;
reg [767:0] temp_write_data_in = 0;
reg [31:0] temp_write_address_in = 0;

reg [31:0] temp_read_address_in = 0;

always @(posedge clk) begin

	if (reset) begin
		forward_write <= 0;
		forward_read <= 0;
		
		temp_write_data_in <= 0;
		temp_write_address_in <= 0;
		temp_read_address_in <= 0;
		
		write_out <= 0;
		w_address_out <= 0;
		w_data_out <= 0;
		
		read_out <= 0;
		r_address_out <= 0;
		block <= 0;
	end
	else if (phy_init_done) begin
	
		//Block component for at least 5 cycles after a command is issued to the RAM
		if (block > 3'd2) block <= block + 1;
		
		//HANDLE INCOMING WRITE
		if (write_in) begin
			read_out <= 0;
			if (!r_busy & (block == 3'd0) ) begin
				block <= 3'd3;
				write_out <= 1;
				w_data_out <= w_data_in;
				w_address_out <= w_address_in;
			end
			else begin
				forward_write <= 1;
				temp_write_data_in <= w_data_in;
				temp_write_address_in <= w_address_in;
			end
			if (read_in) begin
				forward_read <= 1;
				temp_read_address_in <= r_address_in;
			end
		end
		//HANDLE FORWARD
		else if (forward_write) begin
			read_out <= 0;
			if (!r_busy & (block == 3'd0) ) begin
				block <= 3'd3;
				forward_write <= 0;
				write_out <= 1;
				w_data_out <= temp_write_data_in;
				w_address_out <= temp_write_address_in;
			end
			if (read_in) begin
				forward_read <= 1;
				temp_read_address_in <= r_address_in;
			end
		end
		//HANDLE READ
		else if (read_in) begin
			write_out <= 0;
			if (!w_busy & (block == 3'd0) ) begin
				block <= 3'd3;
				read_out <= 1;
				r_address_out <= r_address_in;
			end
			else begin
				forward_read <= 1;
				temp_read_address_in <= r_address_in;
			end
		end
		// HANDLE FORWARD
		else if (forward_read) begin
			write_out <= 0;
			if (!w_busy & (block == 3'd0) ) begin
				block <= 3'd3;
				forward_read <= 0;
				read_out <= 1;
				r_address_out <= temp_read_address_in;
			end
		end
		//ONE CYCLE PULSES
		else begin
			read_out <= 0;
			write_out <= 0;
		end
	end
	
end

endmodule
