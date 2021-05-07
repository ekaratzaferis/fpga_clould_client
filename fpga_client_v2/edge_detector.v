`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:05 04/01/2014 
// Design Name: 
// Module Name:    edge_detector 
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
module edge_detector(
	input clk,
	input trigger,
	input [7:0] data,
	output trigger_out,
	output [7:0] data_out
);
	 
reg edgee = 0;
reg [7:0] buffer = 8'h00;
reg state = 0;

always @(posedge clk) begin
	case (state)
		0: begin
				if (trigger) begin
					edgee <= 1;
					buffer <= data;
					state <= state + 1;
				end
			end
		1: begin
				edgee <= 0;
				buffer <= 8'h00;
				if (!trigger) state <= state + 1;
			end
	endcase
end

assign trigger_out = edgee;
assign data_out = buffer;

endmodule
