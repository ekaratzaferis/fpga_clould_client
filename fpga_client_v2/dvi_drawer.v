`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:08 10/22/2014 
// Design Name: 
// Module Name:    dvi_drawer 
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
module dvi_drawer(
	input pixel_clock,
	input new_frame,
	input frame_enable,
	input ram_ack,
	input ram_init,
	output ask_data,
	output reg [7:0] R,
	output reg [7:0] G,
	output reg [7:0] B,
	input [6143:0] read_data
);

// 6144 bits --> 768 bytes
// 768 bytes --> 256 pixels
// 256 pixels --> 8 ram reads

parameter total_pixels = 31'd786432;

reg [6143:0] pixels = 0;
reg [30:0] pixel_counter = 0;
reg [23:0] value = 0;
reg [7:0] buffer_counter = 0;
reg drawing = 0;
reg ram_ask = 0;
assign ask_data = ram_ask;

//DVI FSM
always @(posedge pixel_clock) begin

	// RAM COMMUNICATION
	if (buffer_counter == 8'd1) ram_ask <= 1;
	else if (ram_ack) ram_ask <= 0;

	if (drawing | (new_frame & ram_init)) begin
		
		// ONLINE CALCULATION
		if (pixel_counter == total_pixels - 1) drawing <= 0;
		else drawing <= 1;
		
		
		if (frame_enable) begin
			// BUFFER PROGRESSION
			buffer_counter <= buffer_counter + 1;
			if (buffer_counter == 8'd255) pixels <= read_data;
			
			// FRAME ROGRESSION
			if (pixel_counter == total_pixels - 1) pixel_counter <= 0;
			else pixel_counter <= pixel_counter + 1;
		end
			
			
		// READ DATA
		value <= pixels[(24*buffer_counter) +: 24];
	
	end
	else begin
		pixel_counter <= 0;
		buffer_counter <= 0;
		value <= 0;
	end

end

always @(value) begin
	B <= value[23:16];
	G <= value[15:8];
	R <= value[7:0];
end

endmodule
