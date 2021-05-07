`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:12:30 04/01/2014
// Design Name:   peripheral_monitor
// Module Name:   C:/VHDL/fpga_client_v2/tb_peripheral_monitor.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: peripheral_monitor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_peripheral_monitor;

	// Inputs
	reg clk;
	reg reset;
	reg busy;
	reg payload;
	reg online;
	reg keyboard_valid;
	reg keyboard_error;
	reg [7:0] keyboard_data;
	reg mouse_valid;
	reg mouse_error;
	reg [7:0] mouse_data;

	// Outputs
	wire mouse_action;
	wire [7:0] mouse_data_tx;
	wire keyboard_action;
	wire [7:0] keyboard_data_tx;

	// Instantiate the Unit Under Test (UUT)
	peripheral_monitor uut (
		.clk(clk), 
		.reset(reset), 
		.mouse_action(mouse_action), 
		.mouse_data_tx(mouse_data_tx), 
		.keyboard_action(keyboard_action), 
		.keyboard_data_tx(keyboard_data_tx), 
		.busy(busy), 
		.payload(payload), 
		.online(online), 
		.keyboard_valid(keyboard_valid), 
		.keyboard_error(keyboard_error), 
		.keyboard_data(keyboard_data), 
		.mouse_valid(mouse_valid), 
		.mouse_error(mouse_error), 
		.mouse_data(mouse_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		busy = 0;
		payload = 0;
		online = 0;
		keyboard_valid = 0;
		keyboard_error = 0;
		keyboard_data = 0;
		mouse_valid = 0;
		mouse_error = 0;
		mouse_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		online = 1;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'he0;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'h4e;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'he7;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		payload = 1;
		#300;
		@(posedge clk);
		payload = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		#100;
		@(posedge clk);
		mouse_valid = 1;
		mouse_data = 8'hee;
		@(posedge clk);
		mouse_valid = 0;
		mouse_data = 0;
		
		
	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

