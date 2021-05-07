module addr_ctrl_out(
	clk,
	reset,
	lb_addr,
	ram_addr,
	lb_rw_n,
	ram_rw_n,
	lb_adv_ld_n,
	ram_adv_ld_n,
	lb_bw,
	ram_bw_n,
	ram_oe_n
	);

parameter ASIZE = 18;					// address bus width
parameter BWSIZE = 4;			
		                                         
input 					clk;
input 					reset;
input	[ASIZE - 1:0]	lb_addr;		// local bus addr input
output	[ASIZE - 1:0]	ram_addr;		// addr to RAM
input 					lb_rw_n;		// local bus read/write signal
output 					ram_rw_n;		// read/write to RAM
input 					lb_adv_ld_n;	// local bus advance/load signal
output 					ram_adv_ld_n;	// advance/load to RAM
input	[BWSIZE - 1:0]	lb_bw;			// local bus byte write selects
output	[BWSIZE - 1:0]	ram_bw_n;		// byte write selects to RAM
output					ram_oe_n;

//Wire and Register declarations

wire	[BWSIZE - 1:0]	lb_bw_n;
reg		[ASIZE - 1:0]	ram_addr;
reg 					ram_rw_n;
reg 					ram_adv_ld_n;	
reg		[BWSIZE - 1:0]	ram_bw_n;
reg						ram_oe_n;

assign lb_bw_n =  ~lb_bw;


// register output signals

always @(posedge clk or posedge reset)
begin
	if (reset)
	begin
		ram_addr <= 18'h0;
		ram_rw_n <= 1'b0;
		ram_adv_ld_n <= 1'b0;	
		ram_bw_n <= 4'h0;
		ram_oe_n <= 1'b0;
	end
	
	else
	begin
		ram_addr <= lb_addr;
		ram_rw_n <= lb_rw_n;
		ram_adv_ld_n <= lb_adv_ld_n;
		ram_bw_n <= lb_bw_n;
		ram_oe_n <= !ram_rw_n;
	end
end
			
endmodule
