`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:26:44 11/05/2014
// Design Name:   frame_buffer
// Module Name:   C:/VHDL/fpga_client_v2/tb_frame_buffer.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frame_buffer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_frame_buffer;

	// Inputs
	reg clk100;
	reg clk125;
	reg reset;
	reg new_frame;
	reg frame_enable;
	reg pixel_clock;
	reg screen_packet;
	reg rx_valid;
	reg [7:0] rx_data;

	// Outputs
	wire [7:0] R;
	wire [7:0] G;
	wire [7:0] B;
	wire [7:0] debug;
	wire [13:0] ddr2_a;
	wire [2:0] ddr2_ba;
	wire ddr2_ras_n;
	wire ddr2_cas_n;
	wire ddr2_we_n;
	wire [1:0] ddr2_cs_n;
	wire [1:0] ddr2_odt;
	wire [1:0] ddr2_cke;
	wire [1:0] ddr2_ck;
	wire [1:0] ddr2_ck_n;

	// Bidirs
	wire [63:0] ddr2_dq;
	wire [7:0] ddr2_dqs;
	wire [7:0] ddr2_dqs_n;

	// Instantiate the Unit Under Test (UUT)
	frame_buffer uut (
		.clk100(clk100), 
		.clk125(clk125), 
		.reset(reset), 
		.new_frame(new_frame), 
		.frame_enable(frame_enable), 
		.pixel_clock(pixel_clock), 
		.R(R), 
		.G(G), 
		.B(B), 
		.debug(debug), 
		.screen_packet(screen_packet), 
		.rx_valid(rx_valid), 
		.rx_data(rx_data), 
		.ddr2_dq(ddr2_dq), 
		.ddr2_a(ddr2_a), 
		.ddr2_ba(ddr2_ba), 
		.ddr2_ras_n(ddr2_ras_n), 
		.ddr2_cas_n(ddr2_cas_n), 
		.ddr2_we_n(ddr2_we_n), 
		.ddr2_cs_n(ddr2_cs_n), 
		.ddr2_odt(ddr2_odt), 
		.ddr2_cke(ddr2_cke), 
		.ddr2_dqs(ddr2_dqs), 
		.ddr2_dqs_n(ddr2_dqs_n), 
		.ddr2_ck(ddr2_ck), 
		.ddr2_ck_n(ddr2_ck_n)
	);

	initial begin
		// Initialize Inputs
		clk100 = 0;
		clk125 = 0;
		reset = 0;
		new_frame = 0;
		frame_enable = 0;
		pixel_clock = 0;
		screen_packet = 0;
		rx_valid = 0;
		rx_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
     #100;
      @(posedge clk125);
		reset = 0;
		@(posedge clk125);
		reset = 0;

	end
	
	always begin	
		#10;
		clk125 = ~clk125;
	end
	
	always begin	
		#12;
		clk100 = ~clk100;
	end
	
	always begin	
		#20;
		pixel_clock = ~pixel_clock;
	end
      
endmodule

