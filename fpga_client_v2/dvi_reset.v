`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:25:07 08/23/2014 
// Design Name: 
// Module Name:    dvi_reset 
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
module dvi_reset(
	input clk_100,
	input reset,
	
	output [11:0] DVI_D,
	output DVI_DE,
	output DVI_H,
	output DVI_V,
	output DVI_RESET_B,
	output DVI_XCLK_N,
	output DVI_XCLK_P,
	inout I2C_SCL_DVI,
	inout I2C_SDA_DVI,
	
	input [23:0] pixel_data,
	input pixel_valid,
	output ready,
	output [7:0] deb
);

reg clk50 = 0, clock = 0;
always @(posedge clk_100) begin
	clock = clock + 1;
	if (clock) clk50 = ~clk50;
end

reg [7:0] debug = 0;
assign deb = debug;
assign DVI_DE = 0;
assign DVI_H = 0;
assign DVI_V = 0;
assign DVI_RESET_B = ~reset;
assign DVI_XCLK_N = clk50;
assign DVI_XCLK_P = ~clk50;
assign DVI_D = 0;
assign ready = 0;



endmodule
