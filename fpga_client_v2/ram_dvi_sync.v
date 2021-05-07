`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:51 01/08/2015 
// Design Name: 
// Module Name:    ram_dvi_sync 
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
module ram_dvi_sync(

	input wire clk125,
	input wire clk75,
	input wire reset,
	input wire [6143:0] pixel_data,
	output wire [7:0] debug,
	input wire [10:0] rows,
	input wire [10:0] lines,
	output reg ram_ask,
	output reg new_frame,
	output wire [23:0] rgb

);

reg [23:0] color = 0;
assign rgb = color; // IT'S IN BGR FORMAR, THE TRANSFORMATION TO RGB IS IN HDMI_CONTROLLER

reg [7:0] counter = 0;
reg [6143:0] pixel_bank_1 = 0;
reg [6143:0] pixel_bank_2 = 0;
reg swap = 0;
reg bank = 0;
reg send = 0;
reg send_2 = 0;
reg parse = 0;
reg parse_2 = 0;

reg [7:0] dd = 0;
assign debug = dd;

always @(posedge clk125) begin
	if (reset) begin
		new_frame <= 0;
		ram_ask <= 0;
		parse <= 0;
		parse_2 <= 0;
	end
	else begin
		if (send) parse <= 1;
		else if (parse) begin
			parse <= 0;
			ram_ask <= 1;
		end
		else ram_ask <= 0;
		
		if (send_2) parse_2 <= 1;
		else if (parse_2) begin
			parse_2 <= 0;
			new_frame <= 1;
		end
		else new_frame <= 0;
	end
end

always @(posedge clk75) begin

	if (reset) begin
		send_2 <= 0;
		swap <= 0;
		counter <= 0;
		send <= 0;
		bank <= 0;
		pixel_bank_1 <= 0;
		pixel_bank_2 <= 0;
	end
	else begin
	
		//SIGNAL NEW FRAME
		if ( (rows >= 11'd279) & (rows < 11'd282) & (lines == 11'd34) ) send_2 <= 1;
		else send_2 <= 0;
		
		
		//STORE INCOMING DATA TO THE UNUSED BANK
		if (swap) pixel_bank_2 <= pixel_data;
		else pixel_bank_1 <= pixel_data;
		
		// VALID PIXELS
		if ( (rows >= 11'd279) & (rows < 11'd1303) & (lines >= 11'd35) & (lines < 11'd803) ) begin
			
			case(counter)
				10: send <= 1;
				11: swap <= ~swap; //FILL EMPTY BUFFER
				13: send <= 0; 
				255: bank <= ~bank; //CHANGE COLOR BANK
			endcase
			
			//READ COLOR DATA
			if (bank) begin
				case(counter)
					0: color <= pixel_bank_2[6143:6120];
					1: color <= pixel_bank_2[6119:6096];
					2: color <= pixel_bank_2[6095:6072];
					3: color <= pixel_bank_2[6071:6048];
					4: color <= pixel_bank_2[6047:6024];
					5: color <= pixel_bank_2[6023:6000];
					6: color <= pixel_bank_2[5999:5976];
					7: color <= pixel_bank_2[5975:5952];
					8: color <= pixel_bank_2[5951:5928];
					9: color <= pixel_bank_2[5927:5904];
					10: color <= pixel_bank_2[5903:5880];
					11: color <= pixel_bank_2[5879:5856];
					12: color <= pixel_bank_2[5855:5832];
					13: color <= pixel_bank_2[5831:5808];
					14: color <= pixel_bank_2[5807:5784];
					15: color <= pixel_bank_2[5783:5760];
					16: color <= pixel_bank_2[5759:5736];
					17: color <= pixel_bank_2[5735:5712];
					18: color <= pixel_bank_2[5711:5688];
					19: color <= pixel_bank_2[5687:5664];
					20: color <= pixel_bank_2[5663:5640];
					21: color <= pixel_bank_2[5639:5616];
					22: color <= pixel_bank_2[5615:5592];
					23: color <= pixel_bank_2[5591:5568];
					24: color <= pixel_bank_2[5567:5544];
					25: color <= pixel_bank_2[5543:5520];
					26: color <= pixel_bank_2[5519:5496];
					27: color <= pixel_bank_2[5495:5472];
					28: color <= pixel_bank_2[5471:5448];
					29: color <= pixel_bank_2[5447:5424];
					30: color <= pixel_bank_2[5423:5400];
					31: color <= pixel_bank_2[5399:5376];
					32: color <= pixel_bank_2[5375:5352];
					33: color <= pixel_bank_2[5351:5328];
					34: color <= pixel_bank_2[5327:5304];
					35: color <= pixel_bank_2[5303:5280];
					36: color <= pixel_bank_2[5279:5256];
					37: color <= pixel_bank_2[5255:5232];
					38: color <= pixel_bank_2[5231:5208];
					39: color <= pixel_bank_2[5207:5184];
					40: color <= pixel_bank_2[5183:5160];
					41: color <= pixel_bank_2[5159:5136];
					42: color <= pixel_bank_2[5135:5112];
					43: color <= pixel_bank_2[5111:5088];
					44: color <= pixel_bank_2[5087:5064];
					45: color <= pixel_bank_2[5063:5040];
					46: color <= pixel_bank_2[5039:5016];
					47: color <= pixel_bank_2[5015:4992];
					48: color <= pixel_bank_2[4991:4968];
					49: color <= pixel_bank_2[4967:4944];
					50: color <= pixel_bank_2[4943:4920];
					51: color <= pixel_bank_2[4919:4896];
					52: color <= pixel_bank_2[4895:4872];
					53: color <= pixel_bank_2[4871:4848];
					54: color <= pixel_bank_2[4847:4824];
					55: color <= pixel_bank_2[4823:4800];
					56: color <= pixel_bank_2[4799:4776];
					57: color <= pixel_bank_2[4775:4752];
					58: color <= pixel_bank_2[4751:4728];
					59: color <= pixel_bank_2[4727:4704];
					60: color <= pixel_bank_2[4703:4680];
					61: color <= pixel_bank_2[4679:4656];
					62: color <= pixel_bank_2[4655:4632];
					63: color <= pixel_bank_2[4631:4608];
					64: color <= pixel_bank_2[4607:4584];
					65: color <= pixel_bank_2[4583:4560];
					66: color <= pixel_bank_2[4559:4536];
					67: color <= pixel_bank_2[4535:4512];
					68: color <= pixel_bank_2[4511:4488];
					69: color <= pixel_bank_2[4487:4464];
					70: color <= pixel_bank_2[4463:4440];
					71: color <= pixel_bank_2[4439:4416];
					72: color <= pixel_bank_2[4415:4392];
					73: color <= pixel_bank_2[4391:4368];
					74: color <= pixel_bank_2[4367:4344];
					75: color <= pixel_bank_2[4343:4320];
					76: color <= pixel_bank_2[4319:4296];
					77: color <= pixel_bank_2[4295:4272];
					78: color <= pixel_bank_2[4271:4248];
					79: color <= pixel_bank_2[4247:4224];
					80: color <= pixel_bank_2[4223:4200];
					81: color <= pixel_bank_2[4199:4176];
					82: color <= pixel_bank_2[4175:4152];
					83: color <= pixel_bank_2[4151:4128];
					84: color <= pixel_bank_2[4127:4104];
					85: color <= pixel_bank_2[4103:4080];
					86: color <= pixel_bank_2[4079:4056];
					87: color <= pixel_bank_2[4055:4032];
					88: color <= pixel_bank_2[4031:4008];
					89: color <= pixel_bank_2[4007:3984];
					90: color <= pixel_bank_2[3983:3960];
					91: color <= pixel_bank_2[3959:3936];
					92: color <= pixel_bank_2[3935:3912];
					93: color <= pixel_bank_2[3911:3888];
					94: color <= pixel_bank_2[3887:3864];
					95: color <= pixel_bank_2[3863:3840];
					96: color <= pixel_bank_2[3839:3816];
					97: color <= pixel_bank_2[3815:3792];
					98: color <= pixel_bank_2[3791:3768];
					99: color <= pixel_bank_2[3767:3744];
					100: color <= pixel_bank_2[3743:3720];
					101: color <= pixel_bank_2[3719:3696];
					102: color <= pixel_bank_2[3695:3672];
					103: color <= pixel_bank_2[3671:3648];
					104: color <= pixel_bank_2[3647:3624];
					105: color <= pixel_bank_2[3623:3600];
					106: color <= pixel_bank_2[3599:3576];
					107: color <= pixel_bank_2[3575:3552];
					108: color <= pixel_bank_2[3551:3528];
					109: color <= pixel_bank_2[3527:3504];
					110: color <= pixel_bank_2[3503:3480];
					111: color <= pixel_bank_2[3479:3456];
					112: color <= pixel_bank_2[3455:3432];
					113: color <= pixel_bank_2[3431:3408];
					114: color <= pixel_bank_2[3407:3384];
					115: color <= pixel_bank_2[3383:3360];
					116: color <= pixel_bank_2[3359:3336];
					117: color <= pixel_bank_2[3335:3312];
					118: color <= pixel_bank_2[3311:3288];
					119: color <= pixel_bank_2[3287:3264];
					120: color <= pixel_bank_2[3263:3240];
					121: color <= pixel_bank_2[3239:3216];
					122: color <= pixel_bank_2[3215:3192];
					123: color <= pixel_bank_2[3191:3168];
					124: color <= pixel_bank_2[3167:3144];
					125: color <= pixel_bank_2[3143:3120];
					126: color <= pixel_bank_2[3119:3096];
					127: color <= pixel_bank_2[3095:3072];
					128: color <= pixel_bank_2[3071:3048];
					129: color <= pixel_bank_2[3047:3024];
					130: color <= pixel_bank_2[3023:3000];
					131: color <= pixel_bank_2[2999:2976];
					132: color <= pixel_bank_2[2975:2952];			
					133: color <= pixel_bank_2[2951:2928];
					134: color <= pixel_bank_2[2927:2904];
					135: color <= pixel_bank_2[2903:2880];
					136: color <= pixel_bank_2[2879:2856];
					137: color <= pixel_bank_2[2855:2832];
					138: color <= pixel_bank_2[2831:2808];
					139: color <= pixel_bank_2[2807:2784];
					140: color <= pixel_bank_2[2783:2760];
					141: color <= pixel_bank_2[2759:2736];
					142: color <= pixel_bank_2[2735:2712];
					143: color <= pixel_bank_2[2711:2688];
					144: color <= pixel_bank_2[2687:2664];
					145: color <= pixel_bank_2[2663:2640];
					146: color <= pixel_bank_2[2639:2616];
					147: color <= pixel_bank_2[2615:2592];
					148: color <= pixel_bank_2[2591:2568];
					149: color <= pixel_bank_2[2567:2544];
					150: color <= pixel_bank_2[2543:2520];
					151: color <= pixel_bank_2[2519:2496];
					152: color <= pixel_bank_2[2495:2472];
					153: color <= pixel_bank_2[2471:2448];
					154: color <= pixel_bank_2[2447:2424];
					155: color <= pixel_bank_2[2423:2400];
					156: color <= pixel_bank_2[2399:2376];
					157: color <= pixel_bank_2[2375:2352];
					158: color <= pixel_bank_2[2351:2328];
					159: color <= pixel_bank_2[2327:2304];
					160: color <= pixel_bank_2[2303:2280];
					161: color <= pixel_bank_2[2279:2256];
					162: color <= pixel_bank_2[2255:2232];
					163: color <= pixel_bank_2[2231:2208];
					164: color <= pixel_bank_2[2207:2184];
					165: color <= pixel_bank_2[2183:2160];
					166: color <= pixel_bank_2[2159:2136];
					167: color <= pixel_bank_2[2135:2112];
					168: color <= pixel_bank_2[2111:2088];
					169: color <= pixel_bank_2[2087:2064];
					170: color <= pixel_bank_2[2063:2040];
					171: color <= pixel_bank_2[2039:2016];
					172: color <= pixel_bank_2[2015:1992];
					173: color <= pixel_bank_2[1991:1968];
					174: color <= pixel_bank_2[1967:1944];
					175: color <= pixel_bank_2[1943:1920];
					176: color <= pixel_bank_2[1919:1896];
					177: color <= pixel_bank_2[1895:1872];
					178: color <= pixel_bank_2[1871:1848];
					179: color <= pixel_bank_2[1847:1824];
					180: color <= pixel_bank_2[1823:1800];
					181: color <= pixel_bank_2[1799:1776];
					182: color <= pixel_bank_2[1775:1752];
					183: color <= pixel_bank_2[1751:1728];
					184: color <= pixel_bank_2[1727:1704];
					185: color <= pixel_bank_2[1703:1680];
					186: color <= pixel_bank_2[1679:1656];
					187: color <= pixel_bank_2[1655:1632];
					188: color <= pixel_bank_2[1631:1608];
					189: color <= pixel_bank_2[1607:1584];
					190: color <= pixel_bank_2[1583:1560];
					191: color <= pixel_bank_2[1559:1536];
					192: color <= pixel_bank_2[1535:1512];
					193: color <= pixel_bank_2[1511:1488];
					194: color <= pixel_bank_2[1487:1464];
					195: color <= pixel_bank_2[1463:1440];
					196: color <= pixel_bank_2[1439:1416];
					197: color <= pixel_bank_2[1415:1392];
					198: color <= pixel_bank_2[1391:1368];
					199: color <= pixel_bank_2[1367:1344];
					200: color <= pixel_bank_2[1343:1320];
					201: color <= pixel_bank_2[1319:1296];
					202: color <= pixel_bank_2[1295:1272];
					203: color <= pixel_bank_2[1271:1248];
					204: color <= pixel_bank_2[1247:1224];
					205: color <= pixel_bank_2[1223:1200];
					206: color <= pixel_bank_2[1199:1176];
					207: color <= pixel_bank_2[1175:1152];
					208: color <= pixel_bank_2[1151:1128];
					209: color <= pixel_bank_2[1127:1104];
					210: color <= pixel_bank_2[1103:1080];
					211: color <= pixel_bank_2[1079:1056];
					212: color <= pixel_bank_2[1055:1032];
					213: color <= pixel_bank_2[1031:1008];
					214: color <= pixel_bank_2[1007:984];
					215: color <= pixel_bank_2[983:960];
					216: color <= pixel_bank_2[959:936];
					217: color <= pixel_bank_2[935:912];
					218: color <= pixel_bank_2[911:888];
					219: color <= pixel_bank_2[887:864];
					220: color <= pixel_bank_2[863:840];
					221: color <= pixel_bank_2[839:816];
					222: color <= pixel_bank_2[815:792];
					223: color <= pixel_bank_2[791:768];
					224: color <= pixel_bank_2[767:744];
					225: color <= pixel_bank_2[743:720];
					226: color <= pixel_bank_2[719:696];
					227: color <= pixel_bank_2[695:672];
					228: color <= pixel_bank_2[671:648];
					229: color <= pixel_bank_2[647:624];
					230: color <= pixel_bank_2[623:600];
					231: color <= pixel_bank_2[599:576];
					232: color <= pixel_bank_2[575:552];
					233: color <= pixel_bank_2[551:528];
					234: color <= pixel_bank_2[527:504];
					235: color <= pixel_bank_2[503:480];
					236: color <= pixel_bank_2[479:456];
					237: color <= pixel_bank_2[455:432];
					238: color <= pixel_bank_2[431:408];
					239: color <= pixel_bank_2[407:384];
					240: color <= pixel_bank_2[383:360];
					241: color <= pixel_bank_2[359:336];
					242: color <= pixel_bank_2[335:312];
					243: color <= pixel_bank_2[311:288];
					244: color <= pixel_bank_2[287:264];
					245: color <= pixel_bank_2[263:240];
					246: color <= pixel_bank_2[239:216];
					247: color <= pixel_bank_2[215:192];
					248: color <= pixel_bank_2[191:168];
					249: color <= pixel_bank_2[167:144];
					250: color <= pixel_bank_2[143:120];
					251: color <= pixel_bank_2[119:96];
					252: color <= pixel_bank_2[95:72];
					253: color <= pixel_bank_2[71:48];
					254: color <= pixel_bank_2[47:24];
					255: color <= pixel_bank_2[23:0];
				endcase
			end
			else begin
				case(counter)
					0: color <= pixel_bank_1[6143:6120];
					1: color <= pixel_bank_1[6119:6096];
					2: color <= pixel_bank_1[6095:6072];
					3: color <= pixel_bank_1[6071:6048];
					4: color <= pixel_bank_1[6047:6024];
					5: color <= pixel_bank_1[6023:6000];
					6: color <= pixel_bank_1[5999:5976];
					7: color <= pixel_bank_1[5975:5952];
					8: color <= pixel_bank_1[5951:5928];
					9: color <= pixel_bank_1[5927:5904];
					10: color <= pixel_bank_1[5903:5880];
					11: color <= pixel_bank_1[5879:5856];
					12: color <= pixel_bank_1[5855:5832];
					13: color <= pixel_bank_1[5831:5808];
					14: color <= pixel_bank_1[5807:5784];
					15: color <= pixel_bank_1[5783:5760];
					16: color <= pixel_bank_1[5759:5736];
					17: color <= pixel_bank_1[5735:5712];
					18: color <= pixel_bank_1[5711:5688];
					19: color <= pixel_bank_1[5687:5664];
					20: color <= pixel_bank_1[5663:5640];
					21: color <= pixel_bank_1[5639:5616];
					22: color <= pixel_bank_1[5615:5592];
					23: color <= pixel_bank_1[5591:5568];
					24: color <= pixel_bank_1[5567:5544];
					25: color <= pixel_bank_1[5543:5520];
					26: color <= pixel_bank_1[5519:5496];
					27: color <= pixel_bank_1[5495:5472];
					28: color <= pixel_bank_1[5471:5448];
					29: color <= pixel_bank_1[5447:5424];
					30: color <= pixel_bank_1[5423:5400];
					31: color <= pixel_bank_1[5399:5376];
					32: color <= pixel_bank_1[5375:5352];
					33: color <= pixel_bank_1[5351:5328];
					34: color <= pixel_bank_1[5327:5304];
					35: color <= pixel_bank_1[5303:5280];
					36: color <= pixel_bank_1[5279:5256];
					37: color <= pixel_bank_1[5255:5232];
					38: color <= pixel_bank_1[5231:5208];
					39: color <= pixel_bank_1[5207:5184];
					40: color <= pixel_bank_1[5183:5160];
					41: color <= pixel_bank_1[5159:5136];
					42: color <= pixel_bank_1[5135:5112];
					43: color <= pixel_bank_1[5111:5088];
					44: color <= pixel_bank_1[5087:5064];
					45: color <= pixel_bank_1[5063:5040];
					46: color <= pixel_bank_1[5039:5016];
					47: color <= pixel_bank_1[5015:4992];
					48: color <= pixel_bank_1[4991:4968];
					49: color <= pixel_bank_1[4967:4944];
					50: color <= pixel_bank_1[4943:4920];
					51: color <= pixel_bank_1[4919:4896];
					52: color <= pixel_bank_1[4895:4872];
					53: color <= pixel_bank_1[4871:4848];
					54: color <= pixel_bank_1[4847:4824];
					55: color <= pixel_bank_1[4823:4800];
					56: color <= pixel_bank_1[4799:4776];
					57: color <= pixel_bank_1[4775:4752];
					58: color <= pixel_bank_1[4751:4728];
					59: color <= pixel_bank_1[4727:4704];
					60: color <= pixel_bank_1[4703:4680];
					61: color <= pixel_bank_1[4679:4656];
					62: color <= pixel_bank_1[4655:4632];
					63: color <= pixel_bank_1[4631:4608];
					64: color <= pixel_bank_1[4607:4584];
					65: color <= pixel_bank_1[4583:4560];
					66: color <= pixel_bank_1[4559:4536];
					67: color <= pixel_bank_1[4535:4512];
					68: color <= pixel_bank_1[4511:4488];
					69: color <= pixel_bank_1[4487:4464];
					70: color <= pixel_bank_1[4463:4440];
					71: color <= pixel_bank_1[4439:4416];
					72: color <= pixel_bank_1[4415:4392];
					73: color <= pixel_bank_1[4391:4368];
					74: color <= pixel_bank_1[4367:4344];
					75: color <= pixel_bank_1[4343:4320];
					76: color <= pixel_bank_1[4319:4296];
					77: color <= pixel_bank_1[4295:4272];
					78: color <= pixel_bank_1[4271:4248];
					79: color <= pixel_bank_1[4247:4224];
					80: color <= pixel_bank_1[4223:4200];
					81: color <= pixel_bank_1[4199:4176];
					82: color <= pixel_bank_1[4175:4152];
					83: color <= pixel_bank_1[4151:4128];
					84: color <= pixel_bank_1[4127:4104];
					85: color <= pixel_bank_1[4103:4080];
					86: color <= pixel_bank_1[4079:4056];
					87: color <= pixel_bank_1[4055:4032];
					88: color <= pixel_bank_1[4031:4008];
					89: color <= pixel_bank_1[4007:3984];
					90: color <= pixel_bank_1[3983:3960];
					91: color <= pixel_bank_1[3959:3936];
					92: color <= pixel_bank_1[3935:3912];
					93: color <= pixel_bank_1[3911:3888];
					94: color <= pixel_bank_1[3887:3864];
					95: color <= pixel_bank_1[3863:3840];
					96: color <= pixel_bank_1[3839:3816];
					97: color <= pixel_bank_1[3815:3792];
					98: color <= pixel_bank_1[3791:3768];
					99: color <= pixel_bank_1[3767:3744];
					100: color <= pixel_bank_1[3743:3720];
					101: color <= pixel_bank_1[3719:3696];
					102: color <= pixel_bank_1[3695:3672];
					103: color <= pixel_bank_1[3671:3648];
					104: color <= pixel_bank_1[3647:3624];
					105: color <= pixel_bank_1[3623:3600];
					106: color <= pixel_bank_1[3599:3576];
					107: color <= pixel_bank_1[3575:3552];
					108: color <= pixel_bank_1[3551:3528];
					109: color <= pixel_bank_1[3527:3504];
					110: color <= pixel_bank_1[3503:3480];
					111: color <= pixel_bank_1[3479:3456];
					112: color <= pixel_bank_1[3455:3432];
					113: color <= pixel_bank_1[3431:3408];
					114: color <= pixel_bank_1[3407:3384];
					115: color <= pixel_bank_1[3383:3360];
					116: color <= pixel_bank_1[3359:3336];
					117: color <= pixel_bank_1[3335:3312];
					118: color <= pixel_bank_1[3311:3288];
					119: color <= pixel_bank_1[3287:3264];
					120: color <= pixel_bank_1[3263:3240];
					121: color <= pixel_bank_1[3239:3216];
					122: color <= pixel_bank_1[3215:3192];
					123: color <= pixel_bank_1[3191:3168];
					124: color <= pixel_bank_1[3167:3144];
					125: color <= pixel_bank_1[3143:3120];
					126: color <= pixel_bank_1[3119:3096];
					127: color <= pixel_bank_1[3095:3072];
					128: color <= pixel_bank_1[3071:3048];
					129: color <= pixel_bank_1[3047:3024];
					130: color <= pixel_bank_1[3023:3000];
					131: color <= pixel_bank_1[2999:2976];
					132: color <= pixel_bank_1[2975:2952];			
					133: color <= pixel_bank_1[2951:2928];
					134: color <= pixel_bank_1[2927:2904];
					135: color <= pixel_bank_1[2903:2880];
					136: color <= pixel_bank_1[2879:2856];
					137: color <= pixel_bank_1[2855:2832];
					138: color <= pixel_bank_1[2831:2808];
					139: color <= pixel_bank_1[2807:2784];
					140: color <= pixel_bank_1[2783:2760];
					141: color <= pixel_bank_1[2759:2736];
					142: color <= pixel_bank_1[2735:2712];
					143: color <= pixel_bank_1[2711:2688];
					144: color <= pixel_bank_1[2687:2664];
					145: color <= pixel_bank_1[2663:2640];
					146: color <= pixel_bank_1[2639:2616];
					147: color <= pixel_bank_1[2615:2592];
					148: color <= pixel_bank_1[2591:2568];
					149: color <= pixel_bank_1[2567:2544];
					150: color <= pixel_bank_1[2543:2520];
					151: color <= pixel_bank_1[2519:2496];
					152: color <= pixel_bank_1[2495:2472];
					153: color <= pixel_bank_1[2471:2448];
					154: color <= pixel_bank_1[2447:2424];
					155: color <= pixel_bank_1[2423:2400];
					156: color <= pixel_bank_1[2399:2376];
					157: color <= pixel_bank_1[2375:2352];
					158: color <= pixel_bank_1[2351:2328];
					159: color <= pixel_bank_1[2327:2304];
					160: color <= pixel_bank_1[2303:2280];
					161: color <= pixel_bank_1[2279:2256];
					162: color <= pixel_bank_1[2255:2232];
					163: color <= pixel_bank_1[2231:2208];
					164: color <= pixel_bank_1[2207:2184];
					165: color <= pixel_bank_1[2183:2160];
					166: color <= pixel_bank_1[2159:2136];
					167: color <= pixel_bank_1[2135:2112];
					168: color <= pixel_bank_1[2111:2088];
					169: color <= pixel_bank_1[2087:2064];
					170: color <= pixel_bank_1[2063:2040];
					171: color <= pixel_bank_1[2039:2016];
					172: color <= pixel_bank_1[2015:1992];
					173: color <= pixel_bank_1[1991:1968];
					174: color <= pixel_bank_1[1967:1944];
					175: color <= pixel_bank_1[1943:1920];
					176: color <= pixel_bank_1[1919:1896];
					177: color <= pixel_bank_1[1895:1872];
					178: color <= pixel_bank_1[1871:1848];
					179: color <= pixel_bank_1[1847:1824];
					180: color <= pixel_bank_1[1823:1800];
					181: color <= pixel_bank_1[1799:1776];
					182: color <= pixel_bank_1[1775:1752];
					183: color <= pixel_bank_1[1751:1728];
					184: color <= pixel_bank_1[1727:1704];
					185: color <= pixel_bank_1[1703:1680];
					186: color <= pixel_bank_1[1679:1656];
					187: color <= pixel_bank_1[1655:1632];
					188: color <= pixel_bank_1[1631:1608];
					189: color <= pixel_bank_1[1607:1584];
					190: color <= pixel_bank_1[1583:1560];
					191: color <= pixel_bank_1[1559:1536];
					192: color <= pixel_bank_1[1535:1512];
					193: color <= pixel_bank_1[1511:1488];
					194: color <= pixel_bank_1[1487:1464];
					195: color <= pixel_bank_1[1463:1440];
					196: color <= pixel_bank_1[1439:1416];
					197: color <= pixel_bank_1[1415:1392];
					198: color <= pixel_bank_1[1391:1368];
					199: color <= pixel_bank_1[1367:1344];
					200: color <= pixel_bank_1[1343:1320];
					201: color <= pixel_bank_1[1319:1296];
					202: color <= pixel_bank_1[1295:1272];
					203: color <= pixel_bank_1[1271:1248];
					204: color <= pixel_bank_1[1247:1224];
					205: color <= pixel_bank_1[1223:1200];
					206: color <= pixel_bank_1[1199:1176];
					207: color <= pixel_bank_1[1175:1152];
					208: color <= pixel_bank_1[1151:1128];
					209: color <= pixel_bank_1[1127:1104];
					210: color <= pixel_bank_1[1103:1080];
					211: color <= pixel_bank_1[1079:1056];
					212: color <= pixel_bank_1[1055:1032];
					213: color <= pixel_bank_1[1031:1008];
					214: color <= pixel_bank_1[1007:984];
					215: color <= pixel_bank_1[983:960];
					216: color <= pixel_bank_1[959:936];
					217: color <= pixel_bank_1[935:912];
					218: color <= pixel_bank_1[911:888];
					219: color <= pixel_bank_1[887:864];
					220: color <= pixel_bank_1[863:840];
					221: color <= pixel_bank_1[839:816];
					222: color <= pixel_bank_1[815:792];
					223: color <= pixel_bank_1[791:768];
					224: color <= pixel_bank_1[767:744];
					225: color <= pixel_bank_1[743:720];
					226: color <= pixel_bank_1[719:696];
					227: color <= pixel_bank_1[695:672];
					228: color <= pixel_bank_1[671:648];
					229: color <= pixel_bank_1[647:624];
					230: color <= pixel_bank_1[623:600];
					231: color <= pixel_bank_1[599:576];
					232: color <= pixel_bank_1[575:552];
					233: color <= pixel_bank_1[551:528];
					234: color <= pixel_bank_1[527:504];
					235: color <= pixel_bank_1[503:480];
					236: color <= pixel_bank_1[479:456];
					237: color <= pixel_bank_1[455:432];
					238: color <= pixel_bank_1[431:408];
					239: color <= pixel_bank_1[407:384];
					240: color <= pixel_bank_1[383:360];
					241: color <= pixel_bank_1[359:336];
					242: color <= pixel_bank_1[335:312];
					243: color <= pixel_bank_1[311:288];
					244: color <= pixel_bank_1[287:264];
					245: color <= pixel_bank_1[263:240];
					246: color <= pixel_bank_1[239:216];
					247: color <= pixel_bank_1[215:192];
					248: color <= pixel_bank_1[191:168];
					249: color <= pixel_bank_1[167:144];
					250: color <= pixel_bank_1[143:120];
					251: color <= pixel_bank_1[119:96];
					252: color <= pixel_bank_1[95:72];
					253: color <= pixel_bank_1[71:48];
					254: color <= pixel_bank_1[47:24];
					255: color <= pixel_bank_1[23:0];
				endcase
			end
			
			//COUNTER STEP
			counter <= counter + 1;
		end
		else color <= 0;
	end
	
end

endmodule
