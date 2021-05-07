`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:27:52 03/25/2014
// Design Name:   top
// Module Name:   C:/VHDL/fpga_client_v2/tb_top.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top;

	// Inputs
	reg clk_100;
	reg RESET;
	reg connect;
	reg tx_dest_rdy;
	reg keyboard_valid;
	reg mouse_valid;
	reg [7:0] keyboard_data;
	reg [26:0] mouse_data;

	// Outputs
	wire [7:0] data;
	wire eof;
	wire sof;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk_100(clk_100), 
		.RESET(RESET), 
		.connect(connect),
		.tx_dest_rdy(tx_dest_rdy), 
		.data(data), 
		.eof(eof), 
		.sof(sof), 
		.keyboard_valid(keyboard_valid), 
		.mouse_valid(mouse_valid), 
		.keyboard_data(keyboard_data), 
		.mouse_data(mouse_data)
	);

	initial begin
		// Initialize Inputs
		clk_100 = 0;
		RESET = 0;
		connect = 0;
		tx_dest_rdy = 0;
		keyboard_valid = 0;
		mouse_valid = 0;
		keyboard_data = 0;
		mouse_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clk_100);
		RESET = 1;
		@(posedge clk_100);
		RESET = 0;
		
		#100;
		@(posedge clk_100);
		connect = 1;
		@(posedge clk_100);
		connect = 0;
		
		#3000;
		@(posedge clk_100);
		keyboard_valid = 1;
		@(posedge clk_100);
		keyboard_valid = 0;

	end
	
	always begin	
		#10;
		clk_100 = ~clk_100;
	end
	
	
      
endmodule

