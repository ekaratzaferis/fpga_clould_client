module pipe_stage(
	clk,
	reset,
	addr,
	data_in,
	data_out,
	rd_wr_n,
	addr_adv_ld_n,
	dm,
	addr_reg,
	data_in_reg,
	data_out_reg,
	rd_wr_n_reg,
	addr_adv_ld_n_reg,
	dm_reg
	);

parameter ASIZE = 18;			// address bus width
parameter DSIZE = 36;			// data bus width
parameter BWSIZE = 4;			// byte enable bus width	

input 					clk;
input 					reset;
	
input	[ASIZE - 1:0]	addr;		
input	[DSIZE - 1:0]	data_in;
input	[DSIZE - 1:0]	data_out;
input 					rd_wr_n;				// active LOW write
input 					addr_adv_ld_n;			// advance/load address (active LOW load)
input	[BWSIZE - 1:0]	dm;						// data mask bits                   

output	[ASIZE - 1:0]	addr_reg;
output	[DSIZE - 1:0]	data_in_reg;
output	[DSIZE - 1:0]	data_out_reg;
output 					rd_wr_n_reg;
output 					addr_adv_ld_n_reg;
output	[BWSIZE - 1:0]	dm_reg;

// Register declarations
reg	[ASIZE - 1:0]	addr_reg;
reg	[DSIZE - 1:0]	data_in_reg;
reg	[DSIZE - 1:0]	data_out_reg;
reg 					rd_wr_n_reg;
reg 					addr_adv_ld_n_reg;
reg	[BWSIZE - 1:0]	dm_reg;

// register all signals

always @ (posedge clk or posedge reset)
begin
	if (reset)
	begin
		addr_reg <= 18'h0;
		data_in_reg <= 36'h0;
		data_out_reg <= 36'h0;
		rd_wr_n_reg <= 1'b0;
		addr_adv_ld_n_reg <= 1'b0;
		dm_reg <= 4'h0;
	end
	
	else
	begin
		addr_reg <= addr;
		data_in_reg <= data_in;
		data_out_reg <= data_out;
		rd_wr_n_reg <= rd_wr_n;
		addr_adv_ld_n_reg <= addr_adv_ld_n;
		dm_reg <= dm;
	end
end

endmodule
