`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:02:29 11/02/2014
// Design Name:   read_burst
// Module Name:   C:/VHDL/fpga_client_v2/tb_read_burst.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: read_burst
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_read_burst;

	// Inputs
	reg clk;
	reg reset;
	reg read;
	reg [30:0] address_in;
	reg valid;
	reg [127:0] read_data_in;

	// Outputs
	wire [767:0] read_data_out;
	wire busy;
	wire read_address_enable;
	wire [2:0] read_command;
	wire [30:0] address_out;

	// Instantiate the Unit Under Test (UUT)
	read_burst uut (
		.clk(clk), 
		.reset(reset), 
		.read(read), 
		.address_in(address_in), 
		.read_data_out(read_data_out), 
		.busy(busy), 
		.valid(valid), 
		.read_data_in(read_data_in), 
		.read_address_enable(read_address_enable), 
		.read_command(read_command), 
		.address_out(address_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		read = 0;
		address_in = 0;
		valid = 0;
		read_data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		#100;
		@(posedge clk);
		read = 1;
		address_in = 31'd1;
		@(posedge clk);
		read = 0;
		
		#100;
      @(posedge clk);
		valid = 1;

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

