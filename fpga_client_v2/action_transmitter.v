`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:27 02/18/2014 
// Design Name: 
// Module Name:    action_transmitter 
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
module data_tx(
	//ethernet
	output [7:0] tx_data,
	output [7:0] tx_data_length,
	output tx_start,
	input tx_payload,
	input tx_busy,
	//monitor
	input connect,
	input mouse_action,
	input [7:0] mouse_data,
	input keyboard_action,
	input [7:0] keyboard_data,
	output busy,
	output payload,
	output online,
	//system
	input reset,
	input clk
);

//Packet lengths
localparam mouse_length = 8'h18; //24
localparam connection_length = 8'h22; //34
localparam keyboard_length = 8'h18; //24

//States
reg connect_state = 0;
reg mouse_state = 0;
reg keyboard_state = 0;
reg [7:0] counter = 8'h00;

reg system_online = 1'b0;
reg start = 1'b0;
reg [7:0] data_out = 32'h00_00_00_00;
reg [7:0] length = 8'b00;
reg busy_reg = 1'b0;
reg payload_reg = 1'b0;


//Transmit FSM
always @(posedge clk) begin

	//reset
	if (reset) begin
		data_out <= 8'h00;
		length <= 8'h00;
		start <= 0;
		busy_reg <= 0;
		payload_reg <= 0;
		counter <= 8'h00;
		system_online <= 0;
	end
	
	//transmit states
	else if (connect_state) begin
		case (counter)
			0: begin
					busy_reg <= 1;
					if(!tx_busy) begin
						start <= 1;
						length <= connection_length;
						counter <= counter + 1;
					end
				end
			1: begin
					start <= 0;
					if (tx_payload) begin
						transmit("k");
					end
				end
			2: transmit("a");
			3: transmit("r");
			4: transmit("a");
			5: transmit("j");
			6: transmit("i");
			7: transmit("z");
			8: transmit("z");
			9: transmit("f");
			10: transmit("e");
			11: transmit("r");
			12: transmit("i");
			13: transmit("s");
			14: transmit("_");
			15: transmit("1");
			16: transmit("6");
			17: transmit("9");
			18: transmit(".");
			19: transmit("2");
			20: transmit("5");
			21: transmit("4");
			22: transmit(".");
			23: transmit("1");
			24: transmit("4");
			25: transmit("4");
			26: transmit(".");
			27: transmit("2");
			28: transmit("3");
			29: transmit("3");
			30: transmit("_");
			31: transmit("4");
			32: transmit("5");
			33: transmit("6");
			34: transmit("2");
			35: begin
					counter <= 8'h00;
					busy_reg <= 0;
					data_out <= 8'h00;
					connect_state <= 0;
					system_online <= 1;
				 end
		endcase
	end
	else if (mouse_state) begin
		case (counter)
			0: begin
					busy_reg <= 1;
					if(!tx_busy) begin
						start <= 1;
						length <= mouse_length;
						counter <= counter + 1;
					end
				end
			1: begin
					start <= 0;
					if (tx_payload) begin
						transmit("m");
					end
				end
			2: transmit("o");
			3: transmit("u");
			4: transmit("s");
			5: transmit("e");
			6: transmit("_");
			7: transmit("s");
			8: transmit("t");
			9: transmit("r");
			10: transmit("o");
			11: transmit("o");
			12: transmit("k");
			13: transmit("e");
			14: transmit("s");
			15: transmit("-");
			16: transmit("d");
			17: transmit("a");
			18: transmit("t");
			19: begin
					transmit("a");
					payload_reg <= 1; //we send 2 cycles earlier cause it will be delayed at monitor component
				end
			20: transmit("_");
			21: transmit(mouse_data);
			22: transmit(mouse_data);
			23: transmit(mouse_data);
			24: transmit(mouse_data);
			25: begin
					counter <= 8'h00;
					busy_reg <= 0;
					mouse_state <= 0;
					payload_reg <= 0;
					data_out <= 8'h00;
				end
		endcase
	end
	else if (keyboard_state) begin
		case (counter)
			0: begin
					busy_reg <= 1;
					if(!tx_busy) begin
						start <= 1;
						length <= keyboard_length;
						counter <= counter + 1;
					end
				end
			1: begin
					start <= 0;
					if (tx_payload) begin
						transmit("k");
					end
				end
			2: transmit("e");
			3: transmit("y");
			4: transmit("b");
			5: transmit("o");
			6: transmit("a");
			7: transmit("r");
			8: transmit("d");
			9: transmit("_");
			10: transmit("s");
			11: transmit("t");
			12: transmit("r");
			13: transmit("o");
			14: transmit("k");
			15: transmit("e");
			16: transmit("-");
			17: transmit("d");
			18: transmit("a");
			19: transmit("t");
			20: begin
					transmit("a");
					payload_reg <= 1; //we send one cycle earlier cause it will be delayed at monitor component
				end
			21: transmit("_");
			22: transmit(keyboard_data);
			23: transmit(keyboard_data);
			24: transmit(keyboard_data);
			25: begin
					counter <= 8'h00;
					busy_reg <= 0;
					keyboard_state <= 0;
					payload_reg <= 0;
					data_out <= 8'h00;
				end
		endcase
	end
	
	//action monitor
	else if (connect) connect_state <= 1;
	else if (mouse_action && system_online) mouse_state <= 1;
	else if (keyboard_action && system_online) keyboard_state <= 1;
end

assign online = system_online;
assign tx_start = start;
assign tx_data = data_out;
assign tx_data_length = length;
assign busy = busy_reg;
assign payload = payload_reg;

task transmit;
	input [31:0] data_o;
begin
	data_out <= data_o;
	counter <= counter + 1;
end
endtask

endmodule
