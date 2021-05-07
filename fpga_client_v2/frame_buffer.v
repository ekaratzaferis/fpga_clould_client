`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:05 10/03/2014 
// Design Name: 
// Module Name:    frame_buffer 
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
module frame_buffer(

	input wire clk100,
	input wire clk125,
	input wire reset,
	
	//DVI Controller
	output wire [6143:0] pixel_data,
	input wire ram_ask,
	input wire new_frame,
	output reg debug,
	
	//RX
	input wire screen_packet,
	input wire rx_valid,
	input wire [7:0] rx_data,
	
	//DDR2
	inout  wire [63:0] ddr2_dq,
	output wire [13:0] ddr2_a,
	output wire [2:0] ddr2_ba,
	output wire ddr2_ras_n,
	output wire ddr2_cas_n,
	output wire ddr2_we_n,
	output wire [1:0] ddr2_cs_n,
	output wire [1:0] ddr2_odt,
	output wire [1:0] ddr2_cke,
	inout  wire [7:0] ddr2_dqs,
	inout  wire [7:0] ddr2_dqs_n,
	output wire [1:0] ddr2_ck,
	output wire [1:0] ddr2_ck_n

);

wire clk200;
clk200gen clk200gen(
	.CLKIN1_IN(clk100),
	.RST_IN(reset),
	.CLKOUT0_OUT(clk200),
	.LOCKED_OUT()
);

wire clkdiv0, clk0, clk90, locked, clk0_tb;
ram_clk_gen ram_clk_gen(
	.CLKIN_IN(clk125),
	.RST_IN(reset),
	.CLKDV_OUT(clkdiv0),
	.CLK0_OUT(clk0),
	.CLK90_OUT(clk90),
	.LOCKED_OUT(locked)
);

wire [12:0] ddr2_a_r;
assign ddr2_a = {1'b0,ddr2_a_r};
wire [1:0] ddr2_ba_r;
assign ddr2_ba = {1'b0,ddr2_ba_r};
wire ddr2_odt_r;
assign ddr2_odt = {1'b0,ddr2_odt_r};
wire ddr2_cs_n_r;
assign ddr2_cs_n = {1'b0,ddr2_cs_n_r};
wire ddr2_cke_r;
assign ddr2_cke = {1'b0,ddr2_cke_r};
wire phy_init_done;
wire rst0_tb;
wire app_wdf_afull;
wire app_af_afull;


//RAM SIGNALS
wire [2:0] cmd;
wire [30:0] address;
wire af_we;
wire wdf_we;
wire rd_data_valid;
wire [127:0] rd_data_fifo_out;
wire [127:0] w_data;

//ETHERNET SIGNALS
wire write_ram;
wire [767:0] write_data;
wire [31:0] write_address;

always @(posedge clk0_tb) begin
	if (phy_init_done) debug <= 1;
	else debug <= 0;
end

ram_mux ram_mux(
	.clk0_tb(clk0_tb),
	.rst0_tb(rst0_tb),
	.debug(),
	
	//RAM
	.cmd(cmd),
	.address(address),
	.af_we(af_we),
	.wdf_we(wdf_we),
	.rd_data_valid(rd_data_valid),
	.rd_data_fifo_out(rd_data_fifo_out),
	.phy_init_done(phy_init_done),
	.app_wdf_afull(app_wdf_afull),
	.app_af_afull(app_af_afull),
	.w_data(w_data),
	
	//DVI
	.ask_data(ram_ask),
	.new_frame(new_frame),
	.read_data(pixel_data),
	
	//ETHERNET
	.write_data(write_data),
	.write_ram(write_ram),
	.write_address(write_address)
);

ethernet_to_ram ethernet_to_ram(
	.clk125(clk125),
	.reset(reset),
	.screen_packet(screen_packet),
	.rx_valid(rx_valid),
	.rx_data(rx_data),
	.write_ram(write_ram),
	.write_data(write_data),
	.write_address(write_address),
	.debug()
);

MIG MIG(
	.ddr2_dq(ddr2_dq),
	.ddr2_a(ddr2_a_r),
	.ddr2_ba(ddr2_ba_r),
	.ddr2_ras_n(ddr2_ras_n),
	.ddr2_cas_n(ddr2_cas_n),
	.ddr2_we_n(ddr2_we_n),
	.ddr2_cs_n(ddr2_cs_n_r),
	.ddr2_odt(ddr2_odt_r),
	.ddr2_cke(ddr2_cke_r),
	.ddr2_dqs(ddr2_dqs),
	.ddr2_dqs_n(ddr2_dqs_n),
	.ddr2_ck(ddr2_ck),
	.ddr2_ck_n(ddr2_ck_n),
	
	.locked(locked),
	.clk0(clk0),
	.clk90(clk90),
	.clkdiv0(clkdiv0),
	.clk200(clk200),
	
	.sys_rst_n(~reset),
	.phy_init_done(phy_init_done),
	.rst0_tb(rst0_tb),
	.clk0_tb(clk0_tb),
	
	.app_wdf_afull(app_wdf_afull),
	.app_af_afull(app_af_afull),
	.rd_data_valid(rd_data_valid),
	
	.app_wdf_wren(wdf_we),
	.app_af_wren(af_we),
	.app_af_addr(address), //30:0
	
	.app_af_cmd(cmd),
	.rd_data_fifo_out(rd_data_fifo_out),
	.app_wdf_data(w_data)
);

endmodule
