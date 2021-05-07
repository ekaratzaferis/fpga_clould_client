`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:32:05 03/25/2014
// Design Name:   data_tx
// Module Name:   C:/VHDL/fpga_client_v2/tb_data_tx.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_data_tx;

	// Inputs
	reg tx_payload;
	reg tx_busy;
	reg connect;
	reg mouse_action;
	reg [7:0] mouse_data;
	reg keyboard_action;
	reg [7:0] keyboard_data;
	reg reset;
	reg clk;

	// Outputs
	wire [7:0] tx_data;
	wire [7:0] tx_data_length;
	wire tx_start;
	wire busy;
	wire payload;
	wire online;

	// Instantiate the Unit Under Test (UUT)
	data_tx uut (
		.tx_data(tx_data), 
		.tx_data_length(tx_data_length), 
		.tx_start(tx_start), 
		.tx_payload(tx_payload), 
		.tx_busy(tx_busy), 
		.connect(connect), 
		.mouse_action(mouse_action), 
		.mouse_data(mouse_data), 
		.keyboard_action(keyboard_action), 
		.keyboard_data(keyboard_data), 
		.busy(busy), 
		.payload(payload), 
		.online(online), 
		.reset(reset), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		tx_payload = 0;
		tx_busy = 0;
		connect = 0;
		mouse_action = 0;
		mouse_data = 0;
		keyboard_action = 0;
		keyboard_data = 0;
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		#100;
		@(posedge clk);
		connect = 1;
		@(posedge clk);
		connect = 0;
		
		#100;
      @(posedge clk);
		tx_payload = 1;
		// Add stimulus here
		
		#3000;
		@(posedge clk);
		mouse_action = 1;
		@(posedge clk);
		mouse_action = 0;
		
		#3000;
		@(posedge clk);
		keyboard_action = 1;
		@(posedge clk);
		keyboard_action = 0;

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

