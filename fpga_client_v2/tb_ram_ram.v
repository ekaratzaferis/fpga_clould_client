`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:28:09 01/14/2015
// Design Name:   ram_mux
// Module Name:   C:/VHDL/fpga_client_v2/tb_ram_ram.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ram_ram;

	// Inputs
	reg clk0_tb;
	reg rst0_tb;
	reg rd_data_valid;
	reg [127:0] rd_data_fifo_out;
	reg phy_init_done;
	reg ask_data;
	reg new_frame;
	reg [767:0] write_data;
	reg write_ram;
	reg [31:0] write_address;

	// Outputs
	wire [7:0] debug;
	wire [2:0] cmd;
	wire [30:0] address;
	wire af_we;
	wire wdf_we;
	wire [127:0] w_data;
	wire [6143:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	ram_mux uut (
		.clk0_tb(clk0_tb), 
		.rst0_tb(rst0_tb), 
		.debug(debug), 
		.cmd(cmd), 
		.address(address), 
		.af_we(af_we), 
		.wdf_we(wdf_we), 
		.rd_data_valid(rd_data_valid), 
		.rd_data_fifo_out(rd_data_fifo_out), 
		.phy_init_done(phy_init_done), 
		.w_data(w_data), 
		.read_data(read_data), 
		.ask_data(ask_data), 
		.new_frame(new_frame), 
		.write_data(write_data), 
		.write_ram(write_ram), 
		.write_address(write_address)
	);

	initial begin
		// Initialize Inputs
		clk0_tb = 0;
		rst0_tb = 0;
		rd_data_valid = 0;
		rd_data_fifo_out = 0;
		phy_init_done = 0;
		ask_data = 0;
		new_frame = 0;
		write_data = 0;
		write_ram = 0;
		write_address = 0;

		// Wait 100 ns for global reset to finish
      #100;
      @(posedge clk0_tb);
		rst0_tb = 1;
		@(posedge clk0_tb);
		rst0_tb = 0;
		
		#200;
		phy_init_done = 1;
		
		#400;
		@(posedge clk0_tb);
		rd_data_valid = 1;
		rd_data_fifo_out = 128'd0;
		@(posedge clk0_tb);
		rd_data_fifo_out = {64'd1,64'd0};
		@(posedge clk0_tb);
		rd_data_fifo_out = 128'd0;
		@(posedge clk0_tb);
		rd_data_fifo_out = {64'd2,64'd0};
		@(posedge clk0_tb);
		rd_data_fifo_out = 128'd0;
		@(posedge clk0_tb);
		rd_data_fifo_out = {64'd3,64'd0};
		@(posedge clk0_tb);
		rd_data_fifo_out = 128'd0;
		@(posedge clk0_tb);
		rd_data_fifo_out = {64'd4,64'd0};
		@(posedge clk0_tb);
		rd_data_valid = 0;
		
	end
	
	always begin	
		#10;
		clk0_tb = ~clk0_tb;
	end
      
endmodule

