`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:30:47 01/24/2015
// Design Name:   ram_initiator
// Module Name:   C:/VHDL/fpga_client_v2/tb_ram_initiate.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram_initiator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ram_initiate;

	// Inputs
	reg clk;
	reg reset;
	reg e_write_ram;
	reg [767:0] e_write_data;
	reg [31:0] e_write_address;
	reg phy_init_done;

	// Outputs
	wire ram_init;
	wire m_write_ram;
	wire [767:0] m_write_data;
	wire [31:0] m_write_address;

	// Instantiate the Unit Under Test (UUT)
	ram_initiator uut (
		.clk(clk), 
		.reset(reset), 
		.e_write_ram(e_write_ram), 
		.e_write_data(e_write_data), 
		.e_write_address(e_write_address), 
		.ram_init(ram_init), 
		.phy_init_done(phy_init_done), 
		.m_write_ram(m_write_ram), 
		.m_write_data(m_write_data), 
		.m_write_address(m_write_address)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		e_write_ram = 0;
		e_write_data = 0;
		e_write_address = 0;
		phy_init_done = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		phy_init_done = 1;
		

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

