`timescale 1 ns/1 ps

module tx_data_mac (
	input wire clk,         // Input CLK from TRIMAC Reciever
	input wire reset,         // Synchronous reset signal
		
	output reg [7:0] tx_data,   // Modified output data
	output reg tx_sof,      // Output start of frame
	output reg tx_eof,     // Output end of frame
	output reg tx_src_rdy, // Output source ready
	input wire tx_dest_rdy,  // Input destination ready
	
	input wire arp,
	input wire [47:0] arp_mac,
	input wire [31:0] arp_ip,
	
	//Monitor Interface
	input wire start_tx,
	input wire [7:0] data_tx,
	input wire [7:0] length_tx,
	output reg payload,
	output reg busy
);


	localparam IP_IDENTIFICATION = 16'haabb;
	localparam IP_FRAG = 13'd0;

	// Ports and Addresses
	parameter SRC_PORT = 16'h11d2; //4562
	parameter DST_PORT = 16'h11d8; //4568
	parameter SRC_MAC = 48'h0023_551c_3565; //IP THS FPGA
	parameter DST_MAC = 48'h0023_551c_3563; //MAC TOU LAPTOP
	parameter DST_IP = 32'ha9fe_C8CD; //169.254.144.232 IP TOU LAPTOP
	parameter SRC_IP = 32'ha9fe_90E9; //169.254.144.233 IP THS FPGA
	
	reg [47:0] mac_arp = 0;
	reg [31:0] ip_arp = 0;
	
	// Generate valid IP header checksums
	wire [15:0] header_checksum;
	reg [31:0] header_checksum_input;
	reg header_checksum_reset;
	ip_header_checksum 
		ip_header_checksum ( 
			.clk(clk), 
			.checksum(header_checksum), 
			.header(header_checksum_input), 
			.reset(header_checksum_reset));
	

	// Packet generation FSM
	(* fsm_encoding = "user" *) 
	reg [8:0] state = 0;
	
	// Calculate packet lengths
	wire [15:0] packet_length_udp, packet_length_ip;

	reg [7:0] p_size = 0;
	
	assign packet_length_udp = 8 + p_size; //8 + size
	assign packet_length_ip = 28 + p_size; //udp + 20

// 30 bytes to connect
//	assign packet_length_udp = 38; //8 + size
//	assign packet_length_ip = 58; //udp + 18
			
	reg [7:0] packet_size_count = 8'h00;
	
	// Headers
	wire [31:0] header_1, header_2, header_3, header_4, header_5;
	
	assign header_1 = {16'h4500, packet_length_ip};
	assign header_2 = {IP_IDENTIFICATION[15:0], 3'b000, IP_FRAG[12:0]}; // IP identification, fragment;
	assign header_3 = {16'h4011, 16'h0000}; // TTL, protocol, checksum
	assign header_4 = SRC_IP;
	assign header_5 = DST_IP;
	
	
	// Main TX FSM
	always @(posedge clk) begin
		if (reset) begin
			state <= 0;
			header_checksum_reset <= 1;
			packet_size_count <= 8'h01;
			tx_sof <= 1;
			tx_eof <= 1;
			tx_data <= 8'h00;
			p_size <= 8'h00;
			tx_src_rdy <= 1;
			busy <= 0;
			payload <= 0;
		end
		else begin
			case(state)

			// Wait until we're told to send a packet
			// Calculate packet header
			0: if(start_tx) begin
				p_size <= length_tx;
				packet_size_count <= 8'h01;
				busy <= 1;
				next_state();
				end
				else if (arp) begin
					busy <= 1;
					mac_arp <= arp_mac;
					ip_arp <= arp_ip;
					state <= 9'd50;
				end
				
			1: begin
				header_checksum_reset <= 0;
				header_checksum_input <= header_1;
				next_state();
				end
				
			2: begin
				header_checksum_input <= header_2;
				next_state();
				end
			3: begin
				header_checksum_input <= header_3;
				next_state();
				end
			4: begin
				header_checksum_input <= header_4;
				next_state();
				end
			5: begin
				header_checksum_input <= header_5;
				next_state();
				end
				
			// Start sending the packet
			6: begin
				tx_src_rdy <= 0;
				tx_sof <= 0;
				transmit(DST_MAC[47:40]);
				end
			7: if (!tx_dest_rdy) begin
					tx_sof <= 1;
					transmit(DST_MAC[39:32]);
				end
			8: transmit(DST_MAC[31:24]);
			9: transmit(DST_MAC[23:16]);
			10: transmit(DST_MAC[15:8]);
			11: transmit(DST_MAC[7:0]);
			12: transmit(SRC_MAC[47:40]);
			13: transmit(SRC_MAC[39:32]);
			14: transmit(SRC_MAC[31:24]);
			15: transmit(SRC_MAC[23:16]);
			16: transmit(SRC_MAC[15:8]);
			17: transmit(SRC_MAC[7:0]);
			18: transmit(8'h08); // First 8 bits: hwtype ethernet (4), protocol type ipv4 (1),  header length (1) (*4), dsc (2)
			19: transmit(8'h00);
			20: transmit(header_1[31:24]);
			21: transmit(header_1[23:16]);
			22: transmit(header_1[15:8]);
			23: transmit(header_1[7:0]);
			24: transmit(header_2[31:24]);
			25: transmit(header_2[23:16]);
			26: transmit(header_2[15:8]);
			27: transmit(header_2[7:0]);
			28: transmit(header_3[31:24]);
			29: transmit(header_3[23:16]);
			30: transmit(header_checksum[15:8]);// Inject the calculated header checksum here
			31: transmit(header_checksum[7:0]);
			32: transmit(header_4[31:24]);
			33: transmit(header_4[23:16]);
			34: transmit(header_4[15:8]);
			35: transmit(header_4[7:0]);
			36: transmit(header_5[31:24]);
			37: transmit(header_5[23:16]);
			38: transmit(header_5[15:8]);
			39: transmit(header_5[7:0]);
			40: transmit(SRC_PORT[15:8]);
			41: transmit(SRC_PORT[7:0]);
			42: transmit(DST_PORT[15:8]);
			43: transmit(DST_PORT[7:0]);
			44: transmit(packet_length_udp[15:8]);
			45: transmit(packet_length_udp[7:0]); //payload <= 1; //signal will be delayed one clk cycle at data_tx so we send earlier
			46: begin
					transmit(8'h00);
					payload <= 1;
				 end
			47: transmit(8'h00);
			48: begin
					packet_size_count <= packet_size_count + 1;
					tx_data <= data_tx;
					if (packet_size_count == p_size) begin
						tx_eof <= 0;
						next_state();
					end
				 end
		   49: if(!tx_dest_rdy) begin //end
					tx_eof <= 1;
					tx_src_rdy <= 1;
					tx_data <= 8'h00;
					header_checksum_reset <= 1;
					packet_size_count <= 8'h01;
					state <= 0;
					busy <= 0;
					payload <= 0;
				 end
			
			///////////// ARP //////////
			50: begin
					tx_src_rdy <= 0;
					tx_sof <= 0;
					transmit(8'hff);
				end
			
			51: begin
					tx_sof <= 1;
					transmit(8'hff);
				 end
				
			52: transmit(8'hff);
			53: transmit(8'hff);
			54: transmit(8'hff);
			55: transmit(8'hff);
			
			//MAC
			56: transmit(SRC_MAC[47:40]);
			57: transmit(SRC_MAC[39:32]);
			58: transmit(SRC_MAC[31:24]);
			59: transmit(SRC_MAC[23:16]);
			60: transmit(SRC_MAC[15:8]);
			61: transmit(SRC_MAC[7:0]);
			
			//ARP Type
			62: transmit(8'h08);
			63: transmit(8'h06);
			
			//HW Type
			64: transmit(8'h00);
			65: transmit(8'h01);
			
			//Protocol Type
			66: transmit(8'h08);
			67: transmit(8'h00);
			
			//HW Size
			68: transmit(8'h06);
			
			//Protocol Size
			69: transmit(8'h04);
			
			//OP Code
			70: transmit(8'h00);
			71: transmit(8'h02);
			
			//Sender MAC
			72: transmit(SRC_MAC[47:40]);
			73: transmit(SRC_MAC[39:32]);
			74: transmit(SRC_MAC[31:24]);
			75: transmit(SRC_MAC[23:16]);
			76: transmit(SRC_MAC[15:8]);
			77: transmit(SRC_MAC[7:0]);
			
			//Sender IP
			78: transmit(SRC_IP[31:24]);
			79: transmit(SRC_IP[23:16]);
			80: transmit(SRC_IP[15:8]);
			81: transmit(SRC_IP[7:0]);
			
			//Target MAC
			82: transmit(mac_arp[47:40]);
			83: transmit(mac_arp[39:32]);
			84: transmit(mac_arp[31:24]);
			85: transmit(mac_arp[23:16]);
			86: transmit(mac_arp[15:8]);
			87: transmit(mac_arp[7:0]);
			
			//Target IP
			88: transmit(ip_arp[31:24]);
			89: transmit(ip_arp[23:16]);
			90: transmit(ip_arp[15:8]);
			
			
				
			91: if (!tx_dest_rdy) begin
					tx_eof <= 0;
					transmit(ip_arp[7:0]);
					state <= 9'd49;
				end
			
			endcase

		end // end if
	end // end always
		
		
	// Tasks
		
	task next_state;
	begin
		state <= state + 1'b1;
	end
	endtask
	
	task transmit;
		input [7:0] data_out;
	begin
		if (!tx_dest_rdy) begin
			tx_data <= data_out;
			state <= state + 1'b1;
		end
	end
	endtask
	  
endmodule