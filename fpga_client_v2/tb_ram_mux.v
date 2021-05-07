`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:08:23 11/24/2014
// Design Name:   ram_mux
// Module Name:   C:/VHDL/fpga_client_v2/tb_ram_mux.v
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

module tb_ram_mux;

	// Inputs
	reg clk0_tb;
	reg rst0_tb;
	reg rd_data_valid;
	reg [127:0] rd_data_fifo_out;
	reg phy_init_done;
	reg app_af_afull;
	reg app_wdf_afull;
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
		.app_af_afull(app_af_afull), 
		.app_wdf_afull(app_wdf_afull), 
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
		phy_init_done = 0;
		
		new_frame = 0;
		ask_data = 0;
		
		rd_data_valid = 0;
		rd_data_fifo_out = 0;
		
		app_af_afull = 0;
		app_wdf_afull = 0;
		
		write_data = 0;
		write_ram = 0;
		write_address = 0;

		// Wait 100 ns for global reset to finish
		#100;
      @(posedge clk0_tb);
		rst0_tb = 1;
		@(posedge clk0_tb);
		rst0_tb = 0;
		phy_init_done = 1;
		
		
		

	end
	
	reg begig = 0;
	reg send_valid = 0;
	reg [15:0] read_counter = 0;
	reg [15:0] send_counter = 0;
	always @(posedge clk0_tb) begin
	
		if ( (cmd == 3'b001) & (af_we) ) begig <= 1;
		else if (begig) begin
		
			if (read_counter == 5) begin
				send_valid <= 1;
				begig <= 0;
				read_counter <= 0;
			end
			else read_counter <= read_counter + 1;
				
		end
		else if (send_valid) begin
		
			if (send_counter == 16'd8) begin
				send_valid <= 0;
				rd_data_valid <= 0;
				rd_data_fifo_out <= 0;
				send_counter <= 0;
			end
			else begin
				send_counter <= send_counter + 1;
				rd_data_valid <= 1;
			end
			
			case(send_counter)
				0: rd_data_fifo_out <= {16{8'h01}};
				1: rd_data_fifo_out <= {16{8'h02}};
				2: rd_data_fifo_out <= {16{8'h03}};
				3: rd_data_fifo_out <= {16{8'h04}};
				4: rd_data_fifo_out <= {16{8'h05}};
				5: rd_data_fifo_out <= {16{8'h06}};
				6: rd_data_fifo_out <= {16{8'h07}};
				7: rd_data_fifo_out <= {16{8'h08}};
			endcase
		end
	
	end
	
	reg [31:0] ram_ask_delay = 0;
	reg [31:0] ram_ask_init_delay = 0;
	reg counting_init = 0;
	reg counting = 0;
	always @(posedge clk0_tb) begin
		if (new_frame) counting_init <= 1;
		else if (counting_init) begin
			if (ram_ask_init_delay == 32'd200) begin
				ask_data <= 1;
				counting <= 1;
				counting_init <= 0;
				ram_ask_init_delay <= 0;
			end
			else ram_ask_init_delay <= ram_ask_init_delay + 1;
		end
		else if (counting) begin
			if (ram_ask_delay == 32'd50) begin
				ask_data <= 1;
				ram_ask_delay <= 0;
			end
			else begin
				ask_data <= 0;
				ram_ask_delay <= ram_ask_delay + 1;
			end
		end
	end
	
	reg [31:0] frame_delay = 0;
	always @(posedge clk0_tb) begin
		if (frame_delay == 32'd1690500) begin
			new_frame <= 1;
			frame_delay <= 0;
		end
		else begin
			new_frame <= 0;
			frame_delay <= frame_delay + 1;
		end
	end
	
	always begin	
		#10;
		clk0_tb = ~clk0_tb;
	end
      
endmodule

