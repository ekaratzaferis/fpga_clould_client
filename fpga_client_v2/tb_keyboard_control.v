`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:10 03/24/2014
// Design Name:   keyboard_controller
// Module Name:   C:/VHDL/fpga_client_v2/tb_keyboard_control.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keyboard_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_keyboard_control;

	// Inputs
	reg clk;
	reg reset;
	reg busy;
	reg read;
	reg [7:0] rx_data;

	// Outputs
	wire write;
	wire [7:0] tx_data;

	// Instantiate the Unit Under Test (UUT)
	keyboard_controller uut (
		.clk(clk), 
		.reset(reset), 
		.busy(busy), 
		.read(read), 
		.rx_data(rx_data), 
		.write(write), 
		.tx_data(tx_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		busy = 0;
		read = 0;
		rx_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		@(posedge clk);
		read = 1;
		rx_data = 8'h3a;
		@(posedge clk);
		read = 0;
		
		#100;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
        
		// Add stimulus here

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

