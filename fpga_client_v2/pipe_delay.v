module pipe_delay(
	clk,
	reset,
	lb_rw_n,
	delay_rw_n,
	lb_data_in,
	delay_data_in,
	lb_data_out,
	ram_data_out
	);

//syn_preserve delay_rw_n;

//Parameter declarations
parameter FLOWTHROUGH = 0;		// Pipelined if zero, Flowthrough if one
parameter DSIZE = 36;			// data bus width
parameter BWSIZE = 4;			// byte enable bus width	

//Input and Output declarations
input 					clk;
input 					reset;	
input 					lb_rw_n;		// local bus read/write signal
output	[DSIZE - 1:0]	delay_rw_n;		// read/write to tri-state enable
	
input	[DSIZE - 1:0]	lb_data_in;		//data from local bus
output	[DSIZE - 1:0]	delay_data_in;	// data to RAM
	
output	[DSIZE - 1:0]	lb_data_out;	// data to local bus
input	[DSIZE - 1:0]	ram_data_out;	// data from RAM

	
	
//Wire and Register declarations
reg 	[2:0] 			rw_n_pipe;
reg		[DSIZE - 1:0]	data_in_pipe_0;
reg		[DSIZE - 1:0]	data_in_pipe_1;
reg		[DSIZE - 1:0]	delay_rw_n;
reg		[DSIZE - 1:0]	lb_data_out;

wire	[DSIZE - 1:0]	delay_data_in;
assign delay_data_in = FLOWTHROUGH ? data_in_pipe_0 : data_in_pipe_1;


always @ (rw_n_pipe[0], rw_n_pipe[1], rw_n_pipe[2])
begin
	delay_rw_n[DSIZE - 1] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 2] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 3] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 4] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 5] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 6] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 7] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 8] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 9] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 10] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 11] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 12] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 13] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 14] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 15] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 16] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 17] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 18] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 19] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 20] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 21] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 22] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 23] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 24] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 25] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 26] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 27] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 28] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 29] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 30] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 31] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 32] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 33] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 34] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 35] <= rw_n_pipe[1 - FLOWTHROUGH];
	delay_rw_n[DSIZE - 36] <= rw_n_pipe[1 - FLOWTHROUGH];
end


// pipeline read/write signal and data
always @ (posedge clk or posedge reset)
begin
	if (reset)
	begin
		rw_n_pipe <= 3'b0;
		data_in_pipe_0 <= 36'h0;
		data_in_pipe_1 <= 36'h0;
	end
	
	else
	begin
		rw_n_pipe[0] <= lb_rw_n;
		rw_n_pipe[2:1] <= rw_n_pipe[1:0];
		data_in_pipe_0 <= lb_data_in;
		data_in_pipe_1 <= data_in_pipe_0;
	end
end


always @ (posedge clk or posedge reset)
begin
	if (reset)
		lb_data_out <= 36'h0;
	else
	begin
		if (rw_n_pipe[2 - FLOWTHROUGH] == 1'b1)
			lb_data_out <= ram_data_out;
	end
end

endmodule
