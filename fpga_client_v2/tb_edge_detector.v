`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:41:43 04/01/2014
// Design Name:   edge_detector
// Module Name:   C:/VHDL/fpga_client_v2/tb_edge_detector.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: edge_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_edge_detector;

	// Inputs
	reg clk;
	reg trigger;
	reg [7:0] data;

	// Outputs
	wire trigger_out;
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	edge_detector uut (
		.clk(clk), 
		.trigger(trigger), 
		.data(data), 
		.trigger_out(trigger_out), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		trigger = 0;
		data = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk)
		trigger <= 1;
		data <= 8'hee;
		
		#1000;
		@(posedge clk)
		trigger <= 0;
		data <= 8'h00;
		
		#20;
      @(posedge clk)
		trigger <= 1;
		data <= 8'hee;

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

