`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:53:19 11/03/2014
// Design Name:   arbitrator
// Module Name:   C:/VHDL/fpga_client_v2/tb_arbitrator.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arbitrator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_arbitrator;

	// Inputs
	reg clk;
	reg reset;
	reg phy_init_done;
	reg r_busy;
	reg w_busy;
	reg write_in;
	reg [30:0] w_address_in;
	reg [767:0] w_data_in;
	reg read_in;
	reg [30:0] r_address_in;

	// Outputs
	wire write_out;
	wire [30:0] w_address_out;
	wire [767:0] w_data_out;
	wire read_out;
	wire r_address_out;

	// Instantiate the Unit Under Test (UUT)
	arbitrator uut (
		.clk(clk), 
		.reset(reset), 
		.phy_init_done(phy_init_done), 
		.r_busy(r_busy), 
		.w_busy(w_busy), 
		.write_in(write_in), 
		.w_address_in(w_address_in), 
		.w_data_in(w_data_in), 
		.write_out(write_out), 
		.w_address_out(w_address_out), 
		.w_data_out(w_data_out), 
		.read_in(read_in), 
		.r_address_in(r_address_in), 
		.read_out(read_out), 
		.r_address_out(r_address_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		phy_init_done = 0;
		r_busy = 0;
		w_busy = 0;
		write_in = 0;
		w_address_in = 0;
		w_data_in = 0;
		read_in = 0;
		r_address_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		phy_init_done = 1;
		//r_busy = 1;
		
		#100;
		@(posedge clk);
		write_in = 1;
		read_in = 1;
		@(posedge clk);
		write_in = 0;
		read_in = 0;
		
		#100;
		//r_busy <= 0;

	end
      
	always begin	
		#10;
		clk = ~clk;
	end
	
endmodule

