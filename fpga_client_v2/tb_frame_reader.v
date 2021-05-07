`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:55:37 11/03/2014
// Design Name:   frame_reader
// Module Name:   C:/VHDL/fpga_client_v2/tb_frame_reader.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frame_reader
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_frame_reader;

	// Inputs
	reg clk;
	reg reset;
	reg ram_init;
	reg phy_init_done;
	reg ask_data;
	reg ready;
	reg [767:0] read_data_in;

	// Outputs
	wire [6143:0] read_data;
	wire ram_ack;
	wire read_out;
	wire [31:0] r_address_out;

	// Instantiate the Unit Under Test (UUT)
	frame_reader uut (
		.clk(clk), 
		.reset(reset), 
		.ram_init(ram_init), 
		.phy_init_done(phy_init_done), 
		.read_data(read_data), 
		.ask_data(ask_data), 
		.ram_ack(ram_ack), 
		.read_out(read_out), 
		.r_address_out(r_address_out), 
		.ready(ready), 
		.read_data_in(read_data_in)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		ram_init = 0;
		phy_init_done = 0;
		ask_data = 0;
		ready = 0;
		read_data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk);
		reset = 1;
		ram_init = 1;
		phy_init_done = 1;
		@(posedge clk);
		reset = 0;
		
		#100;
		@(posedge clk);
		ask_data = 1;
		@(posedge clk);
		ask_data = 0;
		
		#400;
		@(posedge clk);
		read_data_in = 1;
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
		#400;
		@(posedge clk);
		ready = 1;
		@(posedge clk);
		ready = 0;
		
	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

