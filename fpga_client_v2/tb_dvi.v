`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:39:37 08/25/2014
// Design Name:   dvi_reset
// Module Name:   C:/VHDL/fpga_client_v2/tb_dvi.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dvi_reset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_dvi;

	// Inputs
	reg clk_100;
	reg reset;
	reg [23:0] pixel_data;
	reg pixel_valid;

	// Outputs
	wire [11:0] DVI_D;
	wire DVI_DE;
	wire DVI_H;
	wire DVI_V;
	wire DVI_RESET_B;
	wire DVI_XCLK_N;
	wire DVI_XCLK_P;
	wire ready;
	wire [7:0] deb;

	// Bidirs
	wire I2C_SCL_DVI;
	wire I2C_SDA_DVI;

	// Instantiate the Unit Under Test (UUT)
	dvi_reset uut (
		.clk_100(clk_100), 
		.reset(reset), 
		.DVI_D(DVI_D), 
		.DVI_DE(DVI_DE), 
		.DVI_H(DVI_H), 
		.DVI_V(DVI_V), 
		.DVI_RESET_B(DVI_RESET_B), 
		.DVI_XCLK_N(DVI_XCLK_N), 
		.DVI_XCLK_P(DVI_XCLK_P), 
		.I2C_SCL_DVI(I2C_SCL_DVI), 
		.I2C_SDA_DVI(I2C_SDA_DVI), 
		.pixel_data(pixel_data), 
		.pixel_valid(pixel_valid), 
		.ready(ready), 
		.deb(deb)
	);

	initial begin
		// Initialize Inputs
		clk_100 = 0;
		reset = 0;
		pixel_data = 0;
		pixel_valid = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk_100);
		reset <= 1;
		@(posedge clk_100);
		reset <= 0;
		

	end
	
	always begin	
		#10;
		clk_100 = ~clk_100;
	end
      
endmodule

