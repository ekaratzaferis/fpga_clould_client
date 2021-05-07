`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:43:17 05/03/2014
// Design Name:   rx_data_mac
// Module Name:   C:/VHDL/fpga_client_v2/tb_rx_data_mac.v
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

module tb_rx_data_mac;

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
		
		/*@(posedge clk)	//ff
		rx_sof =0;
		rx_src_rdy = 0;
		rx_data = 8'hff;
		@(posedge clk); //ff
		rx_sof = 1;
		
		#100; //ff ff ff ff
		
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h23;
		@(posedge clk);
		rx_data = 8'h55;
		@(posedge clk);
		rx_data = 8'h1c;
		@(posedge clk);
		rx_data = 8'h35;
		@(posedge clk);
		rx_data = 8'h63;
		
		@(posedge clk);
		rx_data = 8'h08;
		@(posedge clk);
		rx_data = 8'h06;
		
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h01;
		
		@(posedge clk);
		rx_data = 8'h08;
		@(posedge clk);
		rx_data = 8'h00;
		
		@(posedge clk);
		rx_data = 8'h06;
		@(posedge clk);
		rx_data = 8'h04;
		
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h01;
		
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h23;
		@(posedge clk);
		rx_data = 8'h55;
		@(posedge clk);
		rx_data = 8'h1c;
		@(posedge clk);
		rx_data = 8'h35;
		@(posedge clk);
		rx_data = 8'h63;
		
		
		@(posedge clk);
		rx_data = 8'ha9;
		@(posedge clk);
		rx_data = 8'hfe;
		@(posedge clk);
		rx_data = 8'hf2;
		@(posedge clk);
		rx_data = 8'h98;
		
		@(posedge clk);
		rx_data = 8'h00;
		#120;
		
		@(posedge clk);
		rx_data = 8'ha9;
		@(posedge clk);
		rx_data = 8'hfe;
		@(posedge clk);
		rx_data = 8'hf2;
		@(posedge clk);
		rx_data = 8'h99;*/
		
		/*@(posedge clk)
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
		rx_data = 8'h64;*/
		
		// Dest MAC
		@(posedge clk)
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
		
		// SOURCE MAC
		@(posedge clk);
		rx_data = 8'h24;
		@(posedge clk);
		rx_data = 8'h24;
		@(posedge clk);
		rx_data = 8'h24;
		@(posedge clk);
		rx_data = 8'h24;
		@(posedge clk);
		rx_data = 8'h24;
		@(posedge clk);
		rx_data = 8'h24;
		
		// IP PACKET
		@(posedge clk)
		rx_data = 8'h08;
		@(posedge clk)
		rx_data = 8'h00;
		@(posedge clk)
		rx_data = 8'h45;
		@(posedge clk)
		rx_data = 8'h00;
		
		
		// Length
		@(posedge clk)
		rx_data = 8'h00;
		@(posedge clk)
		rx_data = 8'h22;
		
		// Identification
		@(posedge clk);
		rx_data = 8'hcc;
		@(posedge clk);
		rx_data = 8'hcc;
		
		// UDP Packet
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h00;
		@(posedge clk);
		rx_data = 8'h11;
		
		// Checksum
		@(posedge clk);
		rx_data = 8'h32;
		@(posedge clk);
		rx_data = 8'h32;
		
		//SOURCE IP
		@(posedge clk);
		rx_data = 8'ha3;
		@(posedge clk);
		rx_data = 8'ha3;
		@(posedge clk);
		rx_data = 8'ha3;
		@(posedge clk);
		rx_data = 8'ha3;
		
		// DEST IP
		@(posedge clk);
		rx_data = 8'h67;
		@(posedge clk);
		rx_data = 8'h67;
		@(posedge clk);
		rx_data = 8'h67;
		@(posedge clk);
		rx_data = 8'h67;
		
		// SOURCE PORT
		@(posedge clk);
		rx_data = 8'h12;
		@(posedge clk);
		rx_data = 8'h12;
		
		// DEST PORT
		@(posedge clk);
		rx_data = 8'h11;
		@(posedge clk);
		rx_data = 8'hD2;
		
		//UDP LENGTH
		@(posedge clk);
		rx_data = 8'h86;
		@(posedge clk);
		rx_data = 8'h86;
		
		// CHECKSUM
		@(posedge clk);
		rx_data = 8'h64;
		@(posedge clk);
		rx_data = 8'h64;
		
		//DATA
		@(posedge clk);
		rx_data = 8'hf6;
		@(posedge clk);
		rx_data = 8'hf7;
		@(posedge clk);
		rx_data = 8'hf8;
		@(posedge clk);
		rx_data = 8'hf9;
		@(posedge clk);
		rx_data = 8'hfa;
		@(posedge clk);
		rx_data = 8'hfb;
		rx_eof = 0;
		
		@(posedge clk);
		rx_data = 8'h00;
		rx_eof = 1;
		rx_src_rdy = 1;

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

