`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:04 03/23/2014 
// Design Name: 
// Module Name:    devices 
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
module devices(

	input clk,
	input reset,
	inout ps2_clk_mouse,
	inout ps2_data_mouse,
	inout ps2_clk_keyboard,
	inout ps2_data_keyboard,
	output keyboard_valid,
	output keyboard_error,
	output [7:0] keyboard_data,
	output mouse_valid,
	output mouse_error,
	output [7:0] mouse_data,
	output [1:0] debug
	
);

keyboard keyboard(
	.ps2_clk(ps2_clk_keyboard),
	.ps2_data(ps2_data_keyboard),
	.clk(clk),
	.reset(reset),
	.error(keyboard_error),
	.valid_scan(keyboard_valid),
	.scan_code(keyboard_data),
	.debug(debug[0])
);

mouse mouse(
	.ps2_clk_mouse(ps2_clk_mouse),
	.ps2_data_mouse(ps2_data_mouse),
	.clk(clk),
	.reset(reset),
	.error(mouse_error),
	.valid_scan(mouse_valid),
	.scan_code(mouse_data),
	.debug(debug[1])
);


endmodule
