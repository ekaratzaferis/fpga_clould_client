`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:35 02/15/2014 
// Design Name: 
// Module Name:    keyboard_device 
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
module keyboard(
	inout ps2_clk,
	inout ps2_data,
	input clk,
	input reset,
	output wire error,
	output wire valid_scan,
	output wire [7:0] scan_code,
	output wire debug
);


wire [7:0] tx_data, rx_data;
wire write, read, busy;

ps2_host ps2_interface(
  .sys_clk(clk),
  .sys_rst(reset),
  .ps2_clk(ps2_clk),
  .ps2_data(ps2_data),

  .tx_data(tx_data),
  .send_req(write),
  .busy(busy),

  .rx_data(rx_data),
  .ready(read),
  .error(error)
);

wire read_edge;
wire [7:0] rx_buffer;

edge_detector edger(
	.clk(clk),
	.trigger(read),
	.data(rx_data),
	.trigger_out(read_edge),
	.data_out(rx_buffer)
);

assign scan_code = rx_buffer;
assign valid_scan = read_edge;

keyboard_controller configure(
	.clk(clk),
	.reset(reset),
	.busy(busy),
	.read(read_edge),
	.rx_data(rx_buffer),
	.write(write),
	.tx_data(tx_data),
	.debug(debug)
);

endmodule
