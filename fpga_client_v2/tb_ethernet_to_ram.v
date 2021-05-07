`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:16 10/23/2014
// Design Name:   ethernet_to_ram
// Module Name:   C:/VHDL/fpga_client_v2/tb_ethernet_to_ram.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ethernet_to_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ethernet_to_ram;

	// Inputs
	reg clk125;
	reg reset;
	reg screen_packet;
	reg rx_valid;
	reg [7:0] rx_data;

	// Outputs
	wire write_ram;
	wire [767:0] write_data;
	wire [7:0] debug;
	wire [31:0] write_address;

	// Instantiate the Unit Under Test (UUT)
	ethernet_to_ram uut (
		.clk125(clk125), 
		.reset(reset), 
		.screen_packet(screen_packet), 
		.rx_valid(rx_valid), 
		.rx_data(rx_data), 
		.write_ram(write_ram), 
		.write_data(write_data),
		.write_address(write_address),
		.debug(debug)
	);

	initial begin
		// Initialize Inputs
		clk125 = 0;
		reset = 0;
		screen_packet = 0;
		rx_valid = 0;
		rx_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk125);
		reset = 1;
		@(posedge clk125);
		reset = 0;
		
		#100;
		@(posedge clk125);
		screen_packet = 1;
		@(posedge clk125);
		screen_packet = 0;
		
		#100;
		@(posedge clk125);
		rx_valid = 1;
		rx_data = 8'hf3;
		#2000;
		@(posedge clk125);
		rx_valid = 0;
		
		#100;
		@(posedge clk125);
		screen_packet = 1;
		@(posedge clk125);
		screen_packet = 0;
		
		#100;
		@(posedge clk125);
		rx_valid = 1;
		rx_data = 8'hf3;
		#2000;
		@(posedge clk125);
		rx_valid = 0;
		
		
	end
      
	always begin	
		#10;
		clk125 = ~clk125;
	end
	
endmodule

