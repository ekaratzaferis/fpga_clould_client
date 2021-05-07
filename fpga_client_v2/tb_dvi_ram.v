`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:02:30 01/09/2015
// Design Name:   ram_dvi_sync
// Module Name:   C:/VHDL/fpga_client_v2/tb_dvi_ram.v
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

module tb_dvi_ram;

	// Inputs
	reg clk125;
	reg clk75;
	reg reset;
	reg [6143:0] pixel_data;
	reg [10:0] rows;
	reg [10:0] lines;

	// Outputs
	wire [23:0] rgb;
	wire [7:0] debug;
	wire ram_ask;
	wire new_frame;

	// Instantiate the Unit Under Test (UUT)
	ram_dvi_sync uut (
		.clk125(clk125), 
		.clk75(clk75), 
		.reset(reset), 
		.pixel_data(pixel_data), 
		.rows(rows), 
		.lines(lines),
		.new_frame(new_frame),
		.debug(debug), 
		.ram_ask(ram_ask), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk125 = 0;
		clk75 = 0;
		reset = 0;
		pixel_data = 0;
		rows = 0;
		lines = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clk125);
		reset = 1;
		@(posedge clk125);
		reset = 0;
		
		#100;
		pixel_data = {24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00, 24'h05ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h09ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00,24'h00ff00};

	end
	
	always begin	
		#25;
		clk75 = ~clk75;
	end
	
	always begin	
		#10;
		clk125 = ~clk125;
	end
	
	always @(posedge clk75) begin
		if (rows > 1400) rows <= 0;
		else rows <= rows + 1;
	end
	always @(posedge clk75) begin
		if (rows == 1400) lines <= lines + 1;
		else if (lines == 870) lines <= 0;
	end
      
endmodule

