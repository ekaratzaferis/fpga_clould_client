`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:59 03/31/2014
// Design Name:   mouse_configuration
// Module Name:   C:/VHDL/fpga_client_v2/tb_mouse_configure.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mouse_configuration
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_mouse_configure;

	// Inputs
	reg clk;
	reg reset;
	reg busy;
	reg read;
	reg [7:0] rx_data;

	// Outputs
	wire write;
	wire [7:0] tx_data;
	wire [7:0] debug;

	// Instantiate the Unit Under Test (UUT)
	mouse_configuration uut (
		.clk(clk), 
		.reset(reset), 
		.busy(busy), 
		.read(read), 
		.rx_data(rx_data), 
		.write(write), 
		.tx_data(tx_data), 
		.debug(debug)
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
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'haa;
		@(posedge clk);
		read = 0;
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'h00;
		@(posedge clk);
		read = 0;
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'h00;
		@(posedge clk);
		read = 0;
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'h03;
		@(posedge clk);
		read = 0;
		
		
		#200;
		@(posedge clk);
		read = 1;
		rx_data = 8'hfa;
		@(posedge clk);
		read = 0;
		
		

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

