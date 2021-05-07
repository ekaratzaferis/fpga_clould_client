`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:56:06 11/02/2014
// Design Name:   write_burst
// Module Name:   C:/VHDL/fpga_client_v2/tb_write_burst.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_burst
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_write_burst;

	// Inputs
	reg clk;
	reg reset;
	reg write;
	reg [767:0] data;
	reg [30:0] address_in;

	// Outputs
	wire busy;
	wire write_enable;
	wire address_enable;
	wire [2:0] write_command;
	wire [127:0] write_data;
	wire [30:0] address_out;

	// Instantiate the Unit Under Test (UUT)
	write_burst uut (
		.clk(clk), 
		.reset(reset), 
		.write(write), 
		.data(data), 
		.address_in(address_in), 
		.busy(busy), 
		.write_enable(write_enable), 
		.address_enable(address_enable), 
		.write_command(write_command), 
		.write_data(write_data), 
		.address_out(address_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		write = 0;
		data = 0;
		address_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		#100;
		@(posedge clk);
		write = 1;
		data = 768'd1;
		address_in = 31'd1;
		@(posedge clk);
		write = 0;

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

