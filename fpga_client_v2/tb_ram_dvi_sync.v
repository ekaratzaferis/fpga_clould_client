`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:32 01/08/2015
// Design Name:   ram_dvi_sync
// Module Name:   C:/VHDL/fpga_client_v2/tb_ram_dvi_sync.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram_dvi_sync
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ram_dvi_sync;

	// Inputs
	reg clk125;
	reg reset;
	reg sync_in;

	// Outputs
	wire sync_out;

	// Instantiate the Unit Under Test (UUT)
	ram_dvi_sync uut (
		.clk125(clk125), 
		.reset(reset), 
		.sync_in(sync_in), 
		.sync_out(sync_out)
	);

	initial begin
		// Initialize Inputs
		clk125 = 0;
		reset = 0;
		sync_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk125);
		reset = 1;
		@(posedge clk125);
		reset = 0;
		
		#23;
		sync_in = 1;
		#45;
		sync_in = 0;

	end
	
	always begin	
		#10;
		clk125 = ~clk125;
	end
      
endmodule

