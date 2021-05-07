`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:12:10 05/04/2014
// Design Name:   tx_data_mac
// Module Name:   C:/VHDL/fpga_client_v2/tb_arp.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tx_data_mac
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_arp;

	// Inputs
	reg clk;
	reg reset;
	reg tx_dest_rdy;
	reg arp;
	reg [47:0] arp_mac;
	reg [31:0] arp_ip;
	reg start_tx;
	reg [7:0] data_tx;
	reg [7:0] length_tx;

	// Outputs
	wire [7:0] tx_data;
	wire tx_sof;
	wire tx_eof;
	wire tx_src_rdy;
	wire payload;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	tx_data_mac uut (
		.clk(clk), 
		.reset(reset), 
		.tx_data(tx_data), 
		.tx_sof(tx_sof), 
		.tx_eof(tx_eof), 
		.tx_src_rdy(tx_src_rdy), 
		.tx_dest_rdy(tx_dest_rdy), 
		.arp(arp), 
		.arp_mac(arp_mac), 
		.arp_ip(arp_ip), 
		.start_tx(start_tx), 
		.data_tx(data_tx), 
		.length_tx(length_tx), 
		.payload(payload), 
		.busy(busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		tx_dest_rdy = 1;
		arp = 0;
		arp_mac = 0;
		arp_ip = 0;
		start_tx = 0;
		data_tx = 0;
		length_tx = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		#100;
		@(posedge clk);
		arp = 1;
		arp_mac = 48'h0023_551c_3563;
		arp_ip = 32'ha9fe_f298;
		@(posedge clk);
		arp = 0;
		arp_mac = 0;
		arp_ip = 0;
		
		#200;
		@(posedge clk);
		tx_dest_rdy = 0;
		

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

