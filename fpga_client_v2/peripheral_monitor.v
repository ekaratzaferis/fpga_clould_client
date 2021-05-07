`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:18 02/26/2014 
// Design Name: 
// Module Name:    peripheral_monitor 
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
module peripheral_monitor(
	input clk,
	input reset,
	//data_tx
	output mouse_action,
	output [7:0] mouse_data_tx,
	output keyboard_action,
	output [7:0] keyboard_data_tx,
	input busy,
	input payload,
	input online,
	//peripherals
	input keyboard_valid,
	input keyboard_error,
	input [7:0] keyboard_data,
	input mouse_valid,
	input mouse_error,
	input [7:0] mouse_data
);

reg m_action = 1'b0;
reg k_action = 1'b0;
reg [7:0] m_data = 8'h00;
reg [7:0] k_data = 8'h00;

reg [1:0] keyboard_state = 2'b00;
reg [1:0] keyboard_counter = 2'b00;
reg decode = 0;
reg transmit = 0;
reg [7:0] keyboard_buffer = 8'h00;

reg [31:0] mouse_buffer = 8'h00;
reg [1:0] bytes_read = 2'b00;
reg transmit_mouse = 0;
reg [1:0] mouse_counter = 2'b00;

always @(posedge clk) begin

	if (reset) begin
		m_action <= 1'b0;
		m_data <= 8'h00;
	end
	else if(online) begin
	
		if (transmit_mouse) begin
			m_action <= 1'b0;
			if (payload == 1'b1) begin
				case(mouse_counter)
					0: begin
							m_data <= mouse_buffer[31:24];
							mouse_counter <= mouse_counter + 1;
						end
					1: begin
							m_data <= mouse_buffer[23:16];
							mouse_counter <= mouse_counter + 1;
						end
					2: begin
							m_data <= mouse_buffer[15:8];
							mouse_counter <= mouse_counter + 1;
						end
					3: begin
							m_data <= mouse_buffer[7:0];
							mouse_counter <= 0;
							transmit_mouse <= 1'b0;
						end
				endcase
			end
		end
		
		else if (mouse_valid) begin
			case(bytes_read)
				0: begin
						mouse_buffer[31:24] <= mouse_data;
						bytes_read <= bytes_read + 1;
					end
				1: begin
						mouse_buffer[23:16] <= mouse_data;
						bytes_read <= bytes_read + 1;
					end
				2: begin
						mouse_buffer[15:8] <= mouse_data;
						bytes_read <= bytes_read + 1;
					end
				3: begin
						mouse_buffer[7:0] <= mouse_data;
						bytes_read <= 0;
						transmit_mouse <= 1'b1;
						m_action <= 1'b1;
					end
			endcase
		end
		
		else begin
			m_data <= 8'h00;
			m_action <= 0;
		end
		
	end
end

always @(posedge clk) begin
	if (reset) begin
		k_action <= 1'b0;
		k_data <= 8'h00;
	end
	else if (online) begin
		if (transmit) begin
			k_action <= 1'b0;
			if (payload == 1'b1) begin
				case (keyboard_counter)
					0: begin
							if(keyboard_state[1]) k_data <= 8'he0;
							else k_data <= 8'h00;
							keyboard_counter <= keyboard_counter + 1;
						end
					1: begin
							if(keyboard_state[0]) k_data <= 8'hf0;
							else k_data <= 8'h00;
							keyboard_counter <= keyboard_counter + 1;
						end
					2: begin
							k_data <= keyboard_buffer;
							keyboard_counter <= 0;
							keyboard_state <= 0;
							transmit <= 0;
						end
				endcase
			end
		end
		else if (decode) begin
			case(keyboard_buffer)
				8'he0: begin
					 keyboard_state[1] <= 1;
					 decode <= 0;
					 end
				8'hf0: begin
					 keyboard_state[0] <= 1;
					 decode <= 0;
					 end
				default: 
					 if (!busy) begin
						 k_action <= 1'b1;
						 transmit <= 1'b1;
						 decode <= 1'b0;
					 end
			endcase
		end
		else if (keyboard_valid) begin
			decode <= 1'b1;
			keyboard_buffer <= keyboard_data; 
		end
		else begin
			k_data <= 0;
			k_action <= 0;
		end
	end
end

assign mouse_action = m_action;
assign keyboard_action = k_action;
assign mouse_data_tx = m_data;
assign keyboard_data_tx = k_data;

endmodule
