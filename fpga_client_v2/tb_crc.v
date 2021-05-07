`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:53:26 04/01/2014
// Design Name:   cross_domain_clock
// Module Name:   C:/VHDL/fpga_client_v2/tb_crc.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cross_domain_clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_crc;

	// Inputs
	reg clk_100;
	reg clk_125;
	reg reset;
	reg trigger_1;
	reg trigger_2;
	reg [7:0] data_in_1;
	reg [7:0] data_in_2;

	// Outputs
	wire action_1;
	wire action_2;
	wire [7:0] data_out_1;
	wire [7:0] data_out_2;

	// Instantiate the Unit Under Test (UUT)
	cross_domain_clock uut (
		.clk_100(clk_100), 
		.clk_125(clk_125), 
		.reset(reset), 
		.trigger_1(trigger_1), 
		.trigger_2(trigger_2), 
		.data_in_1(data_in_1), 
		.data_in_2(data_in_2), 
		.action_1(action_1), 
		.action_2(action_2), 
		.data_out_1(data_out_1), 
		.data_out_2(data_out_2)
	);

	initial begin
		// Initialize Inputs
		clk_100 = 0;
		clk_125 = 0;
		reset = 0;
		trigger_1 = 0;
		trigger_2 = 0;
		data_in_1 = 0;
		data_in_2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clk_100)
		reset = 1;
		@(posedge clk_100)
		reset = 0;
		
		#100;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;
		
		#40;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;
		
		#40;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;
		
		#40;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;
		
		#40;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;
		
		#40;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;
		
		#40;
      @(posedge clk_100)
		trigger_2 <= 1;
		data_in_2 <= 8'he0;
		@(posedge clk_100)
		trigger_2 <= 0;
		data_in_2 <= 0;

	end
	
	always begin	
		#10;
		clk_125 = ~clk_125;
	end
	
	always begin	
		#14;
		clk_100 = ~clk_100;
	end
      
endmodule

