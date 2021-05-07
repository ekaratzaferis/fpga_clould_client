`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:00 02/16/2014 
// Design Name: 
// Module Name:    keyboard_controller 
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
module keyboard_controller(
	input clk,
	input reset,
	input busy,
	input read,
	input [7:0] rx_data,
	output write,
	output [7:0] tx_data,
	output debug
);

reg [2:0] send_state = 3'b000;
reg [1:0] light_led = 2'b00;
reg reset_state = 1'b0;

reg write_data = 1'b0;
reg [7:0] data_out = 8'h00;
reg debug_reg = 0;

//Monitor
always @(posedge clk) begin

	//Reset
	if (reset) begin
		reset_state <= 1'b1;
		write_data <= 1;
		data_out <= 8'hff; //reset code to the keyboard
		send_state <= 3'b000;
		light_led <= 2'b00;
	end
	else if (reset_state) begin
		write_data <= 0;
		data_out <= 8'h00;
		reset_state <= 1'b0;
		debug_reg <= 1'b1;
	end
	
	//Send Commands
	else if(send_state == 3'b001) begin
		if (!busy) begin
			write_data <= 1;
			data_out <= 8'hed;
			send_state <= 3'b010;
		end
	end
	else if(send_state == 3'b010) begin
		write_data <= 0;
		if (read == 1'b1) begin
			if (rx_data == 8'hfa) begin
				send_state <= 3'b11;
			end
		end
	end
	else if(send_state == 3'b11) begin
		if (!busy) begin
			write_data <= 1;
			case (light_led)
				0: data_out <= 8'b00000000;
				1: data_out <= 8'b00000100;
				2: data_out <= 8'b00000010;
				3: data_out <= 8'b00000001;
			endcase
			send_state <= 3'b100;
		end
	end
	else if(send_state == 3'b100) begin
		write_data <= 0;
		data_out <= 8'b00000000;
		send_state <= 3'b000;
	end
	
	//Monitor for Caps,Num and Schroll Lock
	else if(read) begin
		if (rx_data == 8'h58) begin
			light_led <= 2'b01;
			send_state <= 3'b001;
		end
		else if (rx_data == 8'h77) begin
			light_led <= 2'b10;
			send_state <= 3'b001;
		end
		else if (rx_data == 8'h7e) begin 
			light_led <= 2'b11;
			send_state <= 3'b001;
		end
	end
	
end

assign write = write_data;
assign tx_data = data_out;
assign debug = debug_reg;

endmodule
