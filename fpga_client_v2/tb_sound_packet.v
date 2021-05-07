`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:19:40 05/05/2014
// Design Name:   rx_data_mac
// Module Name:   C:/VHDL/fpga_client_v2/tb_sound_packet.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rx_data_mac
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_sound_packet;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] rx_data;
	reg rx_sof;
	reg rx_eof;
	reg rx_src_rdy;
	reg mac_error;

	// Outputs
	wire sof;
	wire eof;
	wire rx_valid;
	wire [7:0] data_rx;
	wire [15:0] length_rx;
	wire busy;
	wire rx_error;
	wire sound_packet;
	wire screen_packet;
	wire arp;
	wire [47:0] arp_mac;
	wire [31:0] arp_ip;

	// Instantiate the Unit Under Test (UUT)
	rx_data_mac uut (
		.clk(clk), 
		.reset(reset), 
		.rx_data(rx_data), 
		.rx_sof(rx_sof), 
		.rx_eof(rx_eof), 
		.rx_src_rdy(rx_src_rdy), 
		.sof(sof), 
		.eof(eof), 
		.rx_valid(rx_valid), 
		.data_rx(data_rx), 
		.length_rx(length_rx), 
		.busy(busy), 
		.rx_error(rx_error), 
		.sound_packet(sound_packet), 
		.screen_packet(screen_packet), 
		.mac_error(mac_error), 
		.arp(arp), 
		.arp_mac(arp_mac), 
		.arp_ip(arp_ip)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		rx_data = 0;
		rx_sof = 0;
		rx_eof = 0;
		rx_src_rdy = 0;
		mac_error = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		rx_sof = 1;
		rx_eof = 1;
		rx_src_rdy = 1;
		mac_error =0;
		
		#100;
		
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		#20;
		
		@(posedge clk);
		rx_sof =0;
		rx_src_rdy = 0;
		rx_data = 8'h00;
		@(posedge clk);
		rx_sof = 1;
		rx_data = 8'h23;
		@(posedge clk);
		rx_data = 8'h55;
		@(posedge clk);
		rx_data = 8'h1c;
		@(posedge clk);
		rx_data = 8'h35;
		@(posedge clk);
		rx_data = 8'h64;
		

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

