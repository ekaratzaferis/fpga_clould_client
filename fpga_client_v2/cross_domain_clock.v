`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:00 03/29/2014 
// Design Name: 
// Module Name:    cross_domain_clock 
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
module cross_domain_clock(

	input clk_100,
	input clk_125,
	input reset,
	input trigger_1,
	input trigger_2,
	input [7:0] data_in_1,
	input [7:0] data_in_2,
	
	output action_1,
	output action_2,
	output [7:0] data_out_1,
	output [7:0] data_out_2
	
);

reg [1:0] triggers = 0;
reg [1:0] actions = 0;
reg [7:0] data_in_1_buffer = 0;
reg [7:0] data_in_2_buffer = 0;
reg [7:0] data_out_reg_1 = 0;
reg [7:0] data_out_reg_2 = 0;

always @(posedge clk_100) begin
	if (trigger_1) begin
		triggers[0] <= 1;
		data_in_1_buffer <= data_in_1;
	end
	else begin
		triggers[0] <= 0;
		data_in_1_buffer <= 8'h00;
	end
	if (trigger_2) begin
		triggers[1] <= 1;
		data_in_2_buffer <= data_in_2;
	end
	else begin
		triggers[1] <= 0;
		data_in_2_buffer <= 8'h00;
	end
end

reg [1:0] clear = 0;

always @(posedge clk_125) begin
	if(reset) begin
		actions <= 2'b00;
		data_out_reg_1 <= 8'h00;
		data_out_reg_2 <= 8'h00;
		clear <= 2'b00;
	end
	else begin
		if (clear[0]) begin
			clear[0] <= 0;
			actions[0] <= 0;
			data_out_reg_1 <= 8'h00;
		end
		else if (triggers[0]) begin
			clear[0] <= 1;
			actions[0] <= 1;
			data_out_reg_1 <= data_in_1_buffer;
		end
		
		if (clear[1]) begin
			clear[1] <= 0;
			actions[1] <= 0;
			data_out_reg_2 <= 8'h00;
		end
		else if (triggers[1]) begin
			clear[1] <= 1;
			actions[1] <= 1;
			data_out_reg_2 <= data_in_2_buffer;
		end
	end
end

assign action_1 = actions[0];
assign action_2 = actions[1];
assign data_out_1 = data_out_reg_1;
assign data_out_2 = data_out_reg_2;


endmodule
