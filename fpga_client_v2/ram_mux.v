`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:31 10/22/2014 
// Design Name: 
// Module Name:    ram_mux 
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
module ram_mux(

	input clk0_tb,
	input rst0_tb,
	output wire [7:0] debug,
	
	//RAM
	output wire [2:0] cmd,
	output wire [30:0] address,
	output wire af_we,
	output wire wdf_we,
	input rd_data_valid,
	input [127:0] rd_data_fifo_out,
	input phy_init_done,
	input app_af_afull,
	input app_wdf_afull,
	output wire [127:0] w_data,
	
	//DVI
	output [6143:0] read_data,
	input ask_data,
	input new_frame,
	
	//ETHERNET TO RAM
	input [767:0] write_data,
	input write_ram,
	input [31:0] write_address
	
);

//DEBUG
reg [7:0] dd = 0;
assign debug = dd;

//WRITE BURST SIGNALS
wire write_busy;
wire write_address_enable;
wire write_enable;
wire [2:0] write_command;
wire [31:0] write_address_out;
wire [127:0] write_data_b;

//READ BURST SIGNALS
wire [2:0] read_command;
wire [31:0] read_address_out;
wire [767:0] read_data_out;
wire read_address_enable;
wire read_busy;
wire ready;

//ARBITRATOR SIGNAL
wire write_out;
wire [31:0] w_address_out;
wire [767:0] w_data_out;
wire read_out;
wire [31:0] r_address_out;

//FRAME READER SIGNAL
wire [31:0] send_address;
wire send_read;

assign wdf_we = write_enable;
assign w_data = write_data_b;

/////////////////////// MULTIPLEXING //////////////////////////////
reg [2:0] cmd_reg = 0;
reg [30:0] address_reg = 0;
reg af_we_reg = 0;

always @(write_busy,write_command,read_command) begin
	if (write_busy) cmd_reg <= write_command;
	else cmd_reg <= read_command;
end
always @(write_busy,write_address_out,read_address_out) begin
	if (write_busy) address_reg <= write_address_out[30:0];
	else address_reg <= read_address_out[30:0];
end
always @(write_busy,write_address_enable,read_address_enable) begin
	if (write_busy) af_we_reg <= write_address_enable;
	else af_we_reg <= read_address_enable;
end

assign cmd = cmd_reg;
assign address = address_reg;
assign af_we = af_we_reg;

////////////////////////////////////////////////////////////////////

//RAM INITIATOR SIGNALS
wire ram_ready;
wire m_write_ram;
wire [31:0] m_write_address;
wire [767:0] m_write_data;

assign ram_init = ram_ready;

ram_initiator ram_initiator(
	.clk(clk0_tb),
	.reset(rst0_tb),
	.ram_init(ram_ready),
	.phy_init_done(phy_init_done),
	.e_write_data(write_data),
	.e_write_ram(write_ram),
	.e_write_address(write_address),
	.m_write_data(m_write_data),
	.m_write_address(m_write_address),
	.m_write_ram(m_write_ram)
);

write_burst write_burst(
	.clk(clk0_tb),
	.reset(rst0_tb),
	.write(write_out), //ARB
	.data(w_data_out),
	.address_in(w_address_out),
	.busy(write_busy),
	.app_wdf_afull(app_wdf_afull),
	.app_af_afull(app_af_afull),
	.write_enable(write_enable),
	.address_enable(write_address_enable),
	.write_command(write_command),
	.write_data(write_data_b),
	.address_out(write_address_out)
);

read_burst read_burst(
	.clk(clk0_tb),
	.reset(rst0_tb),
	.read(read_out), //ARB
	.address_in(r_address_out),
	.ready(ready), //FRAME READER
	.read_data_out(read_data_out), 
	.busy(read_busy),
	.app_af_afull(app_af_afull),
	.valid(rd_data_valid),
	.read_data_in(rd_data_fifo_out),
	.read_address_enable(read_address_enable),
	.read_command(read_command),
	.address_out(read_address_out)
);

arbitrator arbitrator(
	.clk(clk0_tb),
	.reset(rst0_tb),
	.phy_init_done(phy_init_done),
	
	.r_busy(read_busy),
	.w_busy(write_busy),
	
	//ETHERNET
	.write_in(m_write_ram),
	.w_address_in(m_write_address),
	.w_data_in(m_write_data),
	
	//BURST
	.write_out(write_out),
	.w_address_out(w_address_out),
	.w_data_out(w_data_out),
	
	//DVI
	.read_in(send_read),
	.r_address_in(send_address),
	
	//BURST
	.read_out(read_out),
	.r_address_out(r_address_out)
);

frame_reader frame_reader(
	.clk(clk0_tb),
	.reset(rst0_tb),
	
	.ram_init(ram_ready),
	.phy_init_done(phy_init_done),
	
	//DVI
	.new_frame(new_frame),
	.read_data(read_data),
	.ask_data(ask_data),
	
	//ARBITRATOR
	.read_out(send_read),
	.r_address_out(send_address),
	
	//BURST
	.ready(ready),
	.read_data_in(read_data_out)
);

endmodule
