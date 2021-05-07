module data_inout(
	clk,
	reset,
	ctrl_in_rw_n,
	data_in,
	dq,
	read_data
	);

// Parameter declarations
parameter DSIZE = 36;			// data bus width
parameter BWSIZE = 4;			// byte enable bus width	

//Input and Output declarations
input 					clk;
input					reset;
input	[DSIZE - 1:0]	ctrl_in_rw_n;	// delayed read/write signal
input	[DSIZE - 1:0]	data_in;		// input data to RAM
inout	[DSIZE - 1:0]	dq;				// bi-directional to/from RAM
output	[DSIZE - 1:0]	read_data;		// data from RAM


//Wire declarations

reg		[DSIZE - 1:0]	tri_r_n_w;
reg		[DSIZE - 1:0]	write_data;
wire	[DSIZE - 1:0]	dq;
wire	[DSIZE - 1:0]	read_data;

//syn_preserve tri_r_n_w;

// tri-state output bus
// assume there are 4 segments of the DQ bus, assign a separate tri-state enable to each of them

assign dq[0] = tri_r_n_w[0] ? write_data[0] : 1'bz;
assign dq[1] = tri_r_n_w[1] ? write_data[1] : 1'bz;
assign dq[2] = tri_r_n_w[2] ? write_data[2] : 1'bz;
assign dq[3] = tri_r_n_w[3] ? write_data[3] : 1'bz;
assign dq[4] = tri_r_n_w[4] ? write_data[4] : 1'bz;
assign dq[5] = tri_r_n_w[5] ? write_data[5] : 1'bz;
assign dq[6] = tri_r_n_w[6] ? write_data[6] : 1'bz;
assign dq[7] = tri_r_n_w[7] ? write_data[7] : 1'bz;
assign dq[8] = tri_r_n_w[8] ? write_data[8] : 1'bz;
assign dq[9] = tri_r_n_w[9] ? write_data[9] : 1'bz;
assign dq[10] = tri_r_n_w[10] ? write_data[10] : 1'bz;
assign dq[11] = tri_r_n_w[11] ? write_data[11] : 1'bz;
assign dq[12] = tri_r_n_w[12] ? write_data[12] : 1'bz;
assign dq[13] = tri_r_n_w[13] ? write_data[13] : 1'bz;
assign dq[14] = tri_r_n_w[14] ? write_data[14] : 1'bz;
assign dq[15] = tri_r_n_w[15] ? write_data[15] : 1'bz;
assign dq[16] = tri_r_n_w[16] ? write_data[16] : 1'bz;
assign dq[17] = tri_r_n_w[17] ? write_data[17] : 1'bz;
assign dq[18] = tri_r_n_w[18] ? write_data[18] : 1'bz;
assign dq[19] = tri_r_n_w[19] ? write_data[19] : 1'bz;
assign dq[20] = tri_r_n_w[20] ? write_data[20] : 1'bz;
assign dq[21] = tri_r_n_w[21] ? write_data[21] : 1'bz;
assign dq[22] = tri_r_n_w[22] ? write_data[22] : 1'bz;
assign dq[23] = tri_r_n_w[23] ? write_data[23] : 1'bz;
assign dq[24] = tri_r_n_w[24] ? write_data[24] : 1'bz;
assign dq[25] = tri_r_n_w[25] ? write_data[25] : 1'bz;
assign dq[26] = tri_r_n_w[26] ? write_data[26] : 1'bz;
assign dq[27] = tri_r_n_w[27] ? write_data[27] : 1'bz;
assign dq[28] = tri_r_n_w[28] ? write_data[28] : 1'bz;
assign dq[29] = tri_r_n_w[29] ? write_data[29] : 1'bz;
assign dq[30] = tri_r_n_w[30] ? write_data[30] : 1'bz;
assign dq[31] = tri_r_n_w[31] ? write_data[31] : 1'bz;
assign dq[32] = tri_r_n_w[32] ? write_data[32] : 1'bz;
assign dq[33] = tri_r_n_w[33] ? write_data[33] : 1'bz;
assign dq[34] = tri_r_n_w[34] ? write_data[34] : 1'bz;
assign dq[35] = tri_r_n_w[35] ? write_data[35] : 1'bz;

assign read_data = dq;


// register data_in and tri-state control signal
always @ (posedge clk or posedge reset)
begin
	if (reset)
	begin
		tri_r_n_w <= 36'h0;
		write_data <= 36'h0;
	end
	
	else
	begin
		tri_r_n_w <=  ~ctrl_in_rw_n;
		write_data <= data_in;
	end
end

endmodule
