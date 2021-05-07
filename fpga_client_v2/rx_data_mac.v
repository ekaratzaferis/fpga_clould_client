`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:59 05/03/2014 
// Design Name: 
// Module Name:    rx_data_mac 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rx_data_mac(

	input wire clk,
	input wire reset,
	
	input wire [7:0] rx_data,
   input wire rx_sof,
   input wire rx_eof,
   input wire rx_src_rdy,
	
	output reg sof,
	output reg eof,
	output reg rx_valid,
	output reg [7:0] data_rx,
	output reg [15:0] length_rx,
	output reg busy,
	output wire rx_error,
	output reg sound_packet,
	output reg screen_packet,
	
	input wire mac_error,
	output reg arp,
	output wire [47:0] arp_mac,
	output wire [31:0] arp_ip
);

	parameter SRC_MAC = 48'h0023_551c_3565;
	parameter SRC_IP = 32'ha9fe_90E9; //169.254.144.233 IP THS FPGA
	
	reg [8:0] rx_state = 0;
	reg packet_error = 0;
	reg [15:0] length_reg = 0;
	reg [15:0] counter = 16'h01;
	reg [7:0] port = 0;
	reg [47:0] mac_addr = 0;
	reg [31:0] ip_addr = 0;
	reg [31:0] target = 0;
	
	always @(posedge clk) begin
		if (reset) begin
			rx_state <= 9'b000000000;
			rx_valid <= 1'b0;
			data_rx <= 8'h00;
			busy <= 1'b0;
			length_rx <= 16'h0000;
			sof <= 1'b0;
			eof <= 1'b0;
			sound_packet <= 0;
			screen_packet <= 0;
			arp <= 0;
			counter <= 16'h01;
			length_reg <= 0;
		end
		else begin
			case(rx_state)
			
				0: if ( (!rx_sof) && (!rx_src_rdy)) begin
						busy <= 1;
						discard(); //DST_MAC[47:40]
						mac_addr[47:40] <= rx_data;
					end
				1: if ( (rx_sof) && (!rx_src_rdy)) begin
						discard(); //DST_MAC[39:32]
						mac_addr[39:32] <= rx_data;
					end
				2: begin
					discard(); //DST_MAC[31:24]
					mac_addr[31:24] <= rx_data;
					end
				3: begin
					discard(); //DST_MAC[23:16]
					mac_addr[23:16] <= rx_data;
					end
				4: begin
					discard(); //DST_MAC[15:8]
					mac_addr[15:8] <= rx_data;
					end

				5: if ( {mac_addr[47:8], 8'hff} == 48'hffff_ffff_ffff ) begin //ARP
						rx_state <= 9'd45;
					end
					else if ( {mac_addr[47:8], 8'h65} == SRC_MAC ) begin
						discard(); //DST_MAC[7:0]
					end
					else begin
						packet_error <= 1;
						rx_state <= 9'd44;
					end
				
				6: discard(); //SRC_MAC[47:40]
				7: discard(); //SRC_MAC[39:32]
				8: discard(); //SRC_MAC[31:24]
				9: discard(); //SRC_MAC[23:16]
				10: discard(); //SRC_MAC[15:8]
				11: discard(); //SRC_MAC[7:0]
				
				//Check if IP Packet
				12: if (!rx_src_rdy) begin
						if (rx_data == 8'h08) next_rx_state();
						else begin
							packet_error <= 1;
							rx_state <= 9'd44;
						end
					 end
				13: if (!rx_src_rdy) begin
						if (rx_data == 8'h00) next_rx_state();
						else begin
							packet_error <= 1;
							rx_state <= 9'd44;
						end
					 end
				14: if (!rx_src_rdy) begin
						if (rx_data == 8'h45) next_rx_state();
						else begin
							packet_error <= 1;
							rx_state <= 9'd44;
						end
					 end
				15: if (!rx_src_rdy) begin
						if (rx_data == 8'h00) next_rx_state();
						else begin
							packet_error <= 1;
							rx_state <= 9'd44;
						end
					 end
					
				// Packet Length
				16: if (!rx_src_rdy) begin
						length_reg[15:8] <= rx_data;
						next_rx_state();
					 end
				17: if (!rx_src_rdy) begin
						length_rx <= {length_reg[15:8],rx_data} - 16'd28;
						length_reg <= {length_reg[15:8],rx_data} - 16'd28;
						next_rx_state();
					 end
					 
				18: discard(); // Identification
				19: discard();
					 
				//Check if UDP packet
				20: discard();
				21: discard();
				22: discard();
				23: if (!rx_src_rdy) begin
						if (rx_data == 8'h11) begin
							next_rx_state();
						end
						else begin
							packet_error <= 1;
							rx_state <= 9'd44;
						end
					 end
					 
				24: discard(); //Checksum[15:8]
				25: discard(); //Checksum[7:0]
				
				26: discard(); //SRC_IP[31:24]
				27: discard(); //SRC_IP[23:16]
				28: discard(); //SRC_IP[15:8]
				29: discard(); //SRC_IP[7:0]
				
				30: discard(); //DST_IP[31:24]
				31: discard(); //DST_IP[23:16]
				32: discard(); //DST_IP[15:8]
				33: discard(); //DST_IP[7:0]
				
				34: discard(); //SRC_PORT[15:8]
				35: discard(); //SRC_PORT[7:0]
				
				36: begin
						if (!rx_src_rdy) begin
							port <= rx_data;
							next_rx_state();
						end
					 end
				37: begin
						if (!rx_src_rdy) begin
							if ( {port,rx_data} == 16'h11D2 ) begin //OUR SOURCE PORT
								sound_packet <= 1;
							end 
							else if ( {port,rx_data} == 16'h11D3 ) begin //OUR SOURCE PORT + 1
								screen_packet <= 1;
							end
							next_rx_state();
						end
					 end
				
				38: begin
						screen_packet <= 0;
						sound_packet <= 0;
						discard(); //UDP_LTH[15:8]
					 end
				39: discard(); //UDP_LTH[7:0]
				
				40: discard(); //Checksum[15:8]
				41: discard(); //Checksum[7:0]
				
				42: if (!rx_src_rdy) begin
						sof <= 1;
					   rx_valid <= 1;
						data_rx <= rx_data;
						next_rx_state();
						counter <= counter + 1'b1;
					 end
				
				43: begin
						sof <= 0;
						if (counter == length_reg) begin
							eof <= 1;
							data_rx <= rx_data;
							next_rx_state();
						end
						else begin
							if (rx_src_rdy) begin
								rx_valid <= 0;
								data_rx <= 8'h00;
							end
							else begin
								rx_valid <= 1;
								data_rx <= rx_data;
								counter <= counter + 1'b1;
							end
						end
					 end
					 
				44: begin
						eof <= 0;
						sof <= 0;
						rx_valid <= 0;
						data_rx <= 8'h00; 
						busy <= 0;
						packet_error <= 0;
						rx_state <= 0;
						counter <= 16'h01;
						length_rx <= 0;
					 end
					 
				//ARP
					 
				45: discard(); //Source: kincoAut
				46: discard(); //Source: kincoAut
				47: discard(); //Source: kincoAut
				48: discard(); //Source: kincoAut
				49: discard(); //Source: kincoAut
				50: discard(); //Source: kincoAut
				
				51: discard(); //Type: ARP
				52: discard();
				
				53: discard(); // Hardware Type : 1
				54: discard();
				
				55: discard(); //Protocol Type: IP
				56: discard(); 
				
				57: discard(); // Hardware Size : 6
				
				58: discard(); // Protocol Size : 4
				
				59: discard();  // Opcade : 1 Request
				60: discard(); 
					 
				61: if (!rx_src_rdy) begin //Read Sender MAC Address
						mac_addr[47:40] <= rx_data;
						next_rx_state();
					 end
					 
				62: if (!rx_src_rdy) begin
						mac_addr[39:32] <= rx_data;
						next_rx_state();
					 end
					 
				63: if (!rx_src_rdy) begin
						mac_addr[31:24] <= rx_data;
						next_rx_state();
					 end
					 
				64: if (!rx_src_rdy) begin
						mac_addr[23:16] <= rx_data;
						next_rx_state();
					 end
					 
				65: if (!rx_src_rdy) begin
						mac_addr[15:8] <= rx_data;
						next_rx_state();
					 end
					 
				66: if (!rx_src_rdy) begin 
						mac_addr[7:0] <= rx_data;
						next_rx_state();
					 end
					 
				67: if (!rx_src_rdy) begin //Read Sender IP Address
						ip_addr[31:24] <= rx_data;
						next_rx_state();
					 end
					 
				68: if (!rx_src_rdy) begin
						ip_addr[23:16] <= rx_data;
						next_rx_state();
					 end
					 
				69: if (!rx_src_rdy) begin
						ip_addr[15:8] <= rx_data;
						next_rx_state();
					 end
					 
				70: if (!rx_src_rdy) begin
						ip_addr[7:0] <= rx_data;
						next_rx_state();
					 end
					 
				71: discard(); // Target MAC Address (zeros)
				72: discard();
				73: discard();
				74: discard();
				75: discard();
				76: discard();
				 
				77: if (!rx_src_rdy) begin
						target[31:24] <= rx_data; //Read Target IP Address
						next_rx_state();
					 end
					 
				78: if (!rx_src_rdy) begin
						target[23:16] <= rx_data;
						next_rx_state();
					 end
					 
				79: if (!rx_src_rdy) begin
						target[15:8] <= rx_data;
						next_rx_state();
					 end
					 
				80: if (!rx_src_rdy) begin 
						target[7:0] <= rx_data;
						next_rx_state();
					 end
					 
				81: begin
						if (target == SRC_IP) begin
							arp <= 1;
							//debug <= 8'b11111111;
						end
						next_rx_state();
					 end
					 
				82: begin
						arp <= 0;
						eof <= 0;
						sof <= 0;
						rx_valid <= 0;
						data_rx <= 8'h00; 
						busy <= 0;
						packet_error <= 0;
						rx_state <= 0;
						counter <= 16'h01;
					 end
				
				
			endcase
		end
	end
	
	task discard;
	begin
		if (!rx_src_rdy) begin
			next_rx_state();
		end
	end
	endtask
	
	task next_rx_state;
	begin
		rx_state <= rx_state + 1'b1;
	end
	endtask
	
	assign rx_error = (mac_error) || (packet_error);
	assign arp_mac = mac_addr;
	assign arp_ip = ip_addr;

endmodule
