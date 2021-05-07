`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:15:29 05/07/2014
// Design Name:   sound_buffering
// Module Name:   C:/VHDL/fpga_client_v2/tb_sound_buffer.v
// Project Name:  fpga_client_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sound_buffering
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_sound_buffer;

	// Inputs
	reg clk;
	reg reset;
	reg new_sample;
	reg sound_packet;
	reg rx_valid;
	reg [7:0] rx_data;

	// Outputs
	wire [15:0] left_channel;
	wire [15:0] right_channel;

	// Instantiate the Unit Under Test (UUT)
	sound_buffering uut (
		.clk(clk), 
		.reset(reset), 
		.new_sample(new_sample), 
		.left_channel(left_channel), 
		.right_channel(right_channel), 
		.sound_packet(sound_packet), 
		.rx_valid(rx_valid), 
		.rx_data(rx_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		new_sample = 0;
		sound_packet = 0;
		rx_valid = 0;
		rx_data = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
	end
	
	always begin
		#10;
		new_sample = ~new_sample;
		#20;
		new_sample = ~new_sample;
		#370;
	end
	
	always begin	
		#10;
		clk = ~clk;
	end
	
	
	reg [3:0] state = 11;
	reg [9:0] counter = 0;
	reg [9:0] addr = 0;
	reg [7:0] rep = 0;
	always @(posedge clk) begin
		case(state)
			0: if (rep < 240) begin
					sound_packet <= 1;
					state <= state + 1;
				end
			1: begin
					sound_packet <= 0;
					state <= state + 1;
				end
			2: state <= state + 1;
			3: state <= state + 1;
			4: state <= state + 1;
			5: state <= state + 1;
			6: state <= state + 1;
			7: state <= state + 1;
			8: state <= state + 1;
			9: begin
					rx_valid <= 1;
					if (counter == 0) begin
						rx_data <= addr;
						counter <= counter + 1;
						if (addr == 199) addr <= 0;
						else addr <= addr + 1;
					end
					else begin
						rx_data <= counter;
						if (counter == 961) begin
							rx_valid <= 0;
							state <= state + 1;
						end
						else counter <= counter + 1;
					end
				end
			10: begin
					counter <= 0;
					state <= state + 1;
					rep <= rep + 1;
				 end
			default: state <= state + 1;
		endcase
	end

      
endmodule

