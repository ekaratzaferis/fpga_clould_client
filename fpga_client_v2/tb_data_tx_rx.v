`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:15:54 03/25/2014
// Design Name:   data_tx_rx
// Module Name:   C:/VHDL/fpga_client_v2/tb_data_tx_rx.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_tx_rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_data_tx_rx;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] rx_data;
	reg rx_sof;
	reg rx_eof;
	reg rx_src_rdy;
	reg tx_dest_rdy;
	reg start_tx;
	reg [7:0] data_tx;
	reg [7:0] length_tx;

	// Outputs
	wire [7:0] tx_data;
	wire tx_sof;
	wire tx_eof;
	wire tx_src_rdy;
	wire payload;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	data_tx_rx uut (
		.clk(clk), 
		.reset(reset), 
		.rx_data(rx_data), 
		.rx_sof(rx_sof), 
		.rx_eof(rx_eof), 
		.rx_src_rdy(rx_src_rdy), 
		.tx_data(tx_data), 
		.tx_sof(tx_sof), 
		.tx_eof(tx_eof), 
		.tx_src_rdy(tx_src_rdy), 
		.tx_dest_rdy(tx_dest_rdy), 
		.start_tx(start_tx), 
		.data_tx(data_tx), 
		.length_tx(length_tx), 
		.payload(payload), 
		.busy(busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		rx_data = 0;
		rx_sof = 0;
		rx_eof = 0;
		rx_src_rdy = 0;
		tx_dest_rdy = 0;
		start_tx = 0;
		data_tx = 0;
		length_tx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		#40;
		
		@(posedge clk);
		start_tx = 1;
		length_tx = 8'h0c;
		@(posedge clk);
		start_tx = 0;
		
		#20;
		data_tx <= 8'he0;
		

	end
	
	always begin	
		#10;
		clk = ~clk;
	end
      
endmodule

