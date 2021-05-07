`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:12 10/22/2014 
// Design Name: 
// Module Name:    ethernet_to_ram 
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
module ethernet_to_ram(
	output [7:0] debug,
	input clk125,
	input reset,
	input screen_packet,
	input rx_valid,
	input [7:0] rx_data,
	output reg write_ram,
	output reg [767:0] write_data,
	output reg [31:0] write_address
	
);

reg [5:0] storing_state = 0;
reg [7:0] buffer_counter = 0;
reg capturing = 0;

assign debug = 0;

// ETHERNET FSM
always @(posedge clk125) begin

	if (reset) begin
		storing_state <= 0;
		write_ram <= 0;
		write_data <= 0;
		write_address <= 0;
		buffer_counter <= 0;
		capturing <= 0;
	end
	else begin
		
		case(storing_state)
			
			0: if (screen_packet) storing_state <= storing_state + 1;
			1: if (rx_valid) begin
			
					//INDICATES INCOMING PACKET
					capturing <= 1;
					
					if (buffer_counter == 8'd99) begin
						buffer_counter <= 0;
						write_ram <= 1;
					end
					else begin
						buffer_counter <= buffer_counter + 1;
						write_ram <= 0;
					end
					
					case(buffer_counter)
						//CAPTURE ADDRESS
						0: write_address[31:24] <= rx_data;
						1: write_address[23:16] <= rx_data;
						2: write_address[15:8] <= rx_data;
						3: write_address[7:0] <= rx_data;
						//CAPTURE DATA
						4: write_data[767:760] <= rx_data;
						5: write_data[759:752] <= rx_data;
						6: write_data[751:744] <= rx_data;
						7: write_data[743:736] <= rx_data;
						8: write_data[735:728] <= rx_data;
						9: write_data[727:720] <= rx_data;
						10: write_data[719:712] <= rx_data;
						11: write_data[711:704] <= rx_data;
						12: write_data[703:696] <= rx_data;
						13: write_data[695:688] <= rx_data;
						14: write_data[687:680] <= rx_data;
						15: write_data[679:672] <= rx_data;
						16: write_data[671:664] <= rx_data;
						17: write_data[663:656] <= rx_data;
						18: write_data[655:648] <= rx_data;
						19: write_data[647:640] <= rx_data;
						20: write_data[639:632] <= rx_data;
						21: write_data[631:624] <= rx_data;
						22: write_data[623:616] <= rx_data;
						23: write_data[615:608] <= rx_data;
						24: write_data[607:600] <= rx_data;
						25: write_data[599:592] <= rx_data;
						26: write_data[591:584] <= rx_data;
						27: write_data[583:576] <= rx_data;
						28: write_data[575:568] <= rx_data;
						29: write_data[567:560] <= rx_data;
						30: write_data[559:552] <= rx_data;
						31: write_data[551:544] <= rx_data;
						32: write_data[543:536] <= rx_data;
						33: write_data[535:528] <= rx_data;
						34: write_data[527:520] <= rx_data;
						35: write_data[519:512] <= rx_data;
						36: write_data[511:504] <= rx_data;
						37: write_data[503:496] <= rx_data;
						38: write_data[495:488] <= rx_data;
						39: write_data[487:480] <= rx_data;
						40: write_data[479:472] <= rx_data;
						41: write_data[471:464] <= rx_data;
						42: write_data[463:456] <= rx_data;
						43: write_data[455:448] <= rx_data;
						44: write_data[447:440] <= rx_data;
						45: write_data[439:432] <= rx_data;
						46: write_data[431:424] <= rx_data;
						47: write_data[423:416] <= rx_data;
						48: write_data[415:408] <= rx_data;
						49: write_data[407:400] <= rx_data;
						50: write_data[399:392] <= rx_data;
						51: write_data[391:384] <= rx_data;
						52: write_data[383:376] <= rx_data;
						53: write_data[375:368] <= rx_data;
						54: write_data[367:360] <= rx_data;
						55: write_data[359:352] <= rx_data;
						56: write_data[351:344] <= rx_data;
						57: write_data[343:336] <= rx_data;
						58: write_data[335:328] <= rx_data;
						59: write_data[327:320] <= rx_data;
						60: write_data[319:312] <= rx_data;
						61: write_data[311:304] <= rx_data;
						62: write_data[303:296] <= rx_data;
						63: write_data[295:288] <= rx_data;
						64: write_data[287:280] <= rx_data;
						65: write_data[279:272] <= rx_data;
						66: write_data[271:264] <= rx_data;
						67: write_data[263:256] <= rx_data;
						68: write_data[255:248] <= rx_data;
						69: write_data[247:240] <= rx_data;
						70: write_data[239:232] <= rx_data;
						71: write_data[231:224] <= rx_data;
						72: write_data[223:216] <= rx_data;
						73: write_data[215:208] <= rx_data;
						74: write_data[207:200] <= rx_data;
						75: write_data[199:192] <= rx_data;
						76: write_data[191:184] <= rx_data;
						77: write_data[183:176] <= rx_data;
						78: write_data[175:168] <= rx_data;
						79: write_data[167:160] <= rx_data;
						80: write_data[159:152] <= rx_data;
						81: write_data[151:144] <= rx_data;
						82: write_data[143:136] <= rx_data;
						83: write_data[135:128] <= rx_data;
						84: write_data[127:120] <= rx_data;
						85: write_data[119:112] <= rx_data;
						86: write_data[111:104] <= rx_data;
						87: write_data[103:96] <= rx_data;
						88: write_data[95:88] <= rx_data;
						89: write_data[87:80] <= rx_data;
						90: write_data[79:72] <= rx_data;
						91: write_data[71:64] <= rx_data;
						92: write_data[63:56] <= rx_data;
						93: write_data[55:48] <= rx_data;
						94: write_data[47:40] <= rx_data;
						95: write_data[39:32] <= rx_data;
						96: write_data[31:24] <= rx_data;
						97: write_data[23:16] <= rx_data;
						98: write_data[15:8] <= rx_data;
						99: write_data[7:0] <= rx_data;
					endcase
				end	
				//IF RX NOT VALID ANYMORE
				else if (capturing) begin
					storing_state <= 0;
					capturing <= 0;
					write_ram <= 0;
					buffer_counter <= 0;
				end
			
		endcase
	
	end
end

endmodule
