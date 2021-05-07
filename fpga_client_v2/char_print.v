`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:43 02/03/2015 
// Design Name: 
// Module Name:    char_print 
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
module char_print(
	input clk,
	input reset,
	output reg [23:0] rgb
	// DATA FROM KEYBOARD HERE
);

wire [11:0] rom_adB;
wire [7:0] rom_doB;

wire [11:0] ram_adB;
wire [7:0] ram_doB;


vga80x40 vga80x40(
	.reset(reset),
	.clk25MHz(clk),
	.R(rgb[23:16]),
	.G(rgb[15:8]),
	.B(rgb[7:0]),
	.hsync(),
	.vsync(),
	.TEXT_A(ram_adB),
	.TEXT_D(ram_doB),
	.FONT_A(rom_adB),
	.FONT_D(rom_doB),
	.ocrx(8'h0),
	.ocry(8'h0),
	.octl(8'b10010111)
);

wire [7:0] ram_diA;
wire [11:0] ram_adA;
wire [7:0] ram_doA;
wire [0:0] ram_weA;

mem_text mem_text(
	.clka(clk),
   .dina(ram_diA),
   .addra(ram_adA),
   .wea(ram_weA),
   .douta(ram_doA),
   .clkb(clk),
   .addrb(ram_adB),
   .doutb(ram_doB)
);

mem_font mem_font(
	.clka(CLK25mhZ),
   .addra(rom_adB),
   .douta(rom_doB)
);

endmodule
