`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:52 11/02/2014 
// Design Name: 
// Module Name:    write_burst 
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
module write_burst(
	input clk,
	input reset,
	
	input app_wdf_afull,
	input app_af_afull,
	input write,
	input [767:0] data,
	input [31:0] address_in,
	output reg busy,
	
	//RAM
	output reg write_enable,
	output reg address_enable,
	output reg [2:0] write_command,
	output reg [127:0] write_data,
	output reg [31:0] address_out
);

reg [3:0] write_fsm = 0;

always @(posedge clk) begin

	if (reset) begin
		write_fsm <= 0;
		busy <= 0;
		write_enable <= 0;
		address_enable <= 0;
		write_command <= 0;
		write_data <= 0;
		address_out <= 0;
	end
	else begin
		
		if ( (!busy) & (write) ) begin
			write_fsm <= 4'b0001;
			busy <= 1;
		end
		else if (write_fsm == 4'd0) busy <= 0;
	
		// EVERY WRITE CYCLE IS 128BITS, SO EVERY ADDRESS HAS 256BITS = 32bytes
		// WE USE 24 BYTES --> 192 BITS, SO IN FIRST PHASE WE WRITE 128bits, AND IN SECOND 64Bits
	
		case(write_fsm)
			1: if ( (!app_wdf_afull) & (!app_af_afull) )begin
					write_enable <= 1;
					address_enable <= 1;
					write_command <= 3'b000;
					address_out <= address_in;
					write_data <= data[767:640];
					write_fsm <= write_fsm + 1;
				end
			2: begin
					address_enable <= 0;
					write_data <= {data[639:576],64'd0};
					write_fsm <= write_fsm + 1;
				end
			3: begin
					address_enable <= 1;
					address_out <= address_in + 4;
					write_data <= data[575:448];
					write_fsm <= write_fsm + 1;
				end
			4: begin
					address_enable <= 0;
					write_data <= {data[447:384],64'd0};
					write_fsm <= write_fsm + 1;
				end
			5: begin
					address_enable <= 1;
					address_out <= address_in + 8;
					write_data <= data[383:256];
					write_fsm <= write_fsm + 1;
				end
			6: begin
					address_enable <= 0;
					write_data <= {data[255:192],64'd0};
					write_fsm <= write_fsm + 1;
				end
			7: begin
					address_enable <= 1;
					address_out <= address_in + 12;
					write_data <= data[191:64];
					write_fsm <= write_fsm + 1;
				end
			8: begin
					address_enable <= 0;
					write_data <= {data[63:0],64'd0};
					write_fsm <= write_fsm + 1;
				end
			9: begin
					write_fsm <= 0;
					write_enable <= 0;
				end
		endcase

	end

end
		
endmodule
