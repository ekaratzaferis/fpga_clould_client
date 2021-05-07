`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:50 12/03/2014 
// Design Name: 
// Module Name:    ram_initiator 
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
module ram_initiator(
	input clk,
	input reset,
	
	input e_write_ram,
	input [767:0] e_write_data,
	input [31:0] e_write_address,
	
	output reg ram_init,
	input phy_init_done,
	
	output m_write_ram,
	output [767:0] m_write_data,
	output [31:0] m_write_address
);

reg i_write_ram = 0;
reg [767:0] i_write_data = 0;
reg [31:0] i_write_address = 0;
reg first = 1;

///////////////// MULTIPLEXING ////////////////////////////
reg m_write_ram_reg = 0;
reg [767:0] m_write_data_reg = 0;
reg [30:0] m_write_address_reg = 0;

always @(ram_init,e_write_ram,i_write_ram) begin
	if (ram_init) m_write_ram_reg <= e_write_ram;
	else m_write_ram_reg <= i_write_ram;
end
always @(ram_init,e_write_data,i_write_data) begin
	if (ram_init) m_write_data_reg <= e_write_data;
	else m_write_data_reg <= i_write_data;
end
always @(ram_init,e_write_address,i_write_address) begin
	if (ram_init) m_write_address_reg <= e_write_address;
	else m_write_address_reg <= i_write_address;
end

assign m_write_ram = m_write_ram_reg;
assign m_write_data = m_write_data_reg;
assign m_write_address = m_write_address_reg;
///////////////////////////////////////////////////////////

reg [6:0] delay = 0;
reg [15:0] counter = 0;
reg do_ram_init = 0;

reg [7:0] draw_counter = 0;

always @(posedge clk) begin
	if(reset) begin
		first <= 1;
		counter <= 0;
		delay <= 0;
		ram_init <= 0;
		do_ram_init <= 0;
		i_write_ram <= 0;
		i_write_data <= 0;
		i_write_address <= 0;
		draw_counter <= 0;
	end
	if (do_ram_init) begin
		case(delay)
			100: begin
						ram_init <= 1;
						do_ram_init <= 0;
						delay <= 0;
				  end
			default: delay <= delay + 1;
		endcase
	end
	else if( (!ram_init) & phy_init_done) begin
		if (delay == 7'd100) begin
			counter <= counter + 1;
			delay <= 0;
			i_write_ram <= 1;
			
			case(counter)
				11207: draw_counter <= 8'h1;
				11239: draw_counter <= 8'h1;
				11271: draw_counter <= 8'h1;
				11303: draw_counter <= 8'h1;
				11335: draw_counter <= 8'h1;
				11367: draw_counter <= 8'h1;
				11399: draw_counter <= 8'h1;
				11431: draw_counter <= 8'h1;
				11463: draw_counter <= 8'h1;
				11495: draw_counter <= 8'h1;
				11527: draw_counter <= 8'h1;
				11559: draw_counter <= 8'h1;
				11591: draw_counter <= 8'h1;
				11623: draw_counter <= 8'h1;
				11655: draw_counter <= 8'h1;
				11687: draw_counter <= 8'h1;
				11719: draw_counter <= 8'h1;
				11751: draw_counter <= 8'h1;
				11783: draw_counter <= 8'h1;
				11815: draw_counter <= 8'h1;
				11847: draw_counter <= 8'h1;
				11879: draw_counter <= 8'h1;
				11911: draw_counter <= 8'h1;
				11943: draw_counter <= 8'h1;
				11975: draw_counter <= 8'h1;
				12007: draw_counter <= 8'h1;
				12039: draw_counter <= 8'h1;
				12071: draw_counter <= 8'h1;
				12103: draw_counter <= 8'h1;
				12135: draw_counter <= 8'h1;
				12167: draw_counter <= 8'h1;
				12199: draw_counter <= 8'h1;
				12231: draw_counter <= 8'h1;
				12263: draw_counter <= 8'h1;
				12295: draw_counter <= 8'h1;
				12327: draw_counter <= 8'h1;
				12359: draw_counter <= 8'h1;
				12391: draw_counter <= 8'h1;
				12423: draw_counter <= 8'h1;
				12455: draw_counter <= 8'h1;
				12487: draw_counter <= 8'h1;
				12519: draw_counter <= 8'h1;
				12551: draw_counter <= 8'h1;
				12583: draw_counter <= 8'h1;
				12615: draw_counter <= 8'h1;
			endcase
			
			case (draw_counter) 
				0: i_write_data <= {32{24'h252525}};
				//1st square
				1: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				2: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				3: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				4: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				//space
				5: begin
						i_write_data <= {32{24'h252525}};
						draw_counter <= draw_counter + 1;
					end
				6: begin
						i_write_data <= {32{24'h252525}};
						draw_counter <= draw_counter + 1;
					end
				//2nd square
				7: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				8: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				9: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				10: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				//space
				11: begin
						i_write_data <= {32{24'h252525}};
						draw_counter <= draw_counter + 1;
					end
				12: begin
						i_write_data <= {32{24'h252525}};
						draw_counter <= draw_counter + 1;
					end
				//3rd square
				13: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				14: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				15: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= draw_counter + 1;
					end
				16: begin
						i_write_data <= {32{24'h3D11AE}};
						draw_counter <= 0;
					end
			endcase 
			
			// Help to write from address 0 and not 16.
			if (first) first <= 0;
			else i_write_address <= i_write_address + 32'd16;
		end
		else begin
			i_write_ram <= 0;		
			if (counter == 16'd24576) begin // 24576 * 32 = 786432 = 1024 * 768
				delay <= 0;
				counter <= 0;
				i_write_ram <= 0;
				i_write_data <= 0;
				i_write_address <= 0;
				do_ram_init <= 1;
				first <= 1;
			end
			else delay <= delay + 1;
		end
	end
end

endmodule
