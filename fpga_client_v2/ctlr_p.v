/******************************************************************************
*
*       Author:  Shekhar Bapat
*        Email:  shekhar.bapat@xilinx.com
*        Phone:  (408) 879-5368
*      Company:  Xilinx
*
*   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY 
*                WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY 
*                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
*                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
*
*                Copyright (c) 1999 Xilinx, Inc.
*                All rights reserved
*
*      Version:  $Id: ctlr_p.v,v 1.2 1999-06-09 16:44:39+00 bapat Exp $
*
******************************************************************************/

`timescale 1ns / 1ps

`define ADDR_BITS 16
`define DATA_BITS 36

// ----------------------------------------------------------------------
// This ZBT SRAM controller assumes that only the read/write signal is being used
// The other control signals are tied inside FPGA logic for future flexibility
// The user can instead tie them on the board and save on the pins
// ----------------------------------------------------------------------
module CTLR_P (/*AUTOARG*/
   // Outputs
   addr, lbo_n, clk, cke_n, ld_n, bwa_n, bwb_n, bwc_n, bwd_n, rw_n, 
   oe_n, ce_n, ce2, ce2_n, zz, fpga_clk, ui_read_data, 
   ui_clk_mirror_locked_int, ui_clk_mirror_locked_ext, 
   // Inouts
   dq, 
   // Inputs
   ui_addr, ui_write_data, ui_rw_n, ui_rw_n_ctlr, ui_board_clk, 
   ui_clk_mirror_fb
   );
   
   inout [(`DATA_BITS-1):0]  dq;       // bidirectional data bus to RAM
   output [(`ADDR_BITS-1):0] addr;     // addr goes out to the RAM
   output 		     lbo_n;    // Burst Mode (0 = Linear, 1 = Interleaved)
   output 		     clk;      // 2x clock goes to the RAM
   output 		     cke_n;    // Synchronous Clock Enable
   output 		     ld_n;     // Synchronous address Adv/LD
   output 		     bwa_n;    // Synchronous Byte Write Enable A
   output 		     bwb_n;    // Synchronous Byte Write Enable B
   output 		     bwc_n;    // Synchronous Byte Write Enable C
   output 		     bwd_n;    // Synchronous Byte Write Enable D
   output 		     rw_n;     // Read write control goes out to the RAM
   output 		     oe_n;     // Output Enable
   output 		     ce_n;     // Synchronous Chip Enable
   output 		     ce2;      // Synchronous Chip Enable
   output 		     ce2_n;    // Synchronous Chip Enable
   output 		     zz;       // Snooze Mode
   output 		     fpga_clk; // clk to use inside fpga (= ui_board_clk * 2)
   
   input [(`ADDR_BITS-1):0]  ui_addr;        // addr comes in from the user design
   input [(`DATA_BITS-1):0]  ui_write_data;  // data comes in from the user design
   input 		     ui_rw_n;        			// Read write control comes from the user design
   input 		     ui_rw_n_ctlr;        		// Read write control comes from the user design
   input 		     ui_board_clk;     			// incoming clock into the Virtex CLKDLL
   output [(`DATA_BITS-1):0] ui_read_data;   // data read from SRAM
   
   output 		     ui_clk_mirror_locked_int;
   output 		     ui_clk_mirror_locked_ext;
   input 		     ui_clk_mirror_fb;  // 2x clock feedback from the ui_board
   
   wire [(`DATA_BITS-1):0]   write_data;
   wire [(`DATA_BITS-1):0]   read_data;
   wire [(`DATA_BITS-1):0]   rw_tff;

   reg 			     rw_n_p;

   // write data and read/write has to go thru two levels of pipelining for the
   // Pipelined ZBT SRAM and one level for the Flowthru ZBT SRAM
   // This module provides appropriate number of pipeline stages
   // and fans out the read/write signal using a tree of FFs
   PIPELINED_STAGES_P I_pipeline_stages_p (.ui_read_data(ui_read_data), .write_data(write_data),
					   .rw_tff(rw_tff), .ui_write_data(ui_write_data),
					   .ui_rw_n(ui_rw_n_ctlr), .read_data(read_data),
					   .fpga_clk(fpga_clk)
					   );
   
   DATABITS_INOUT I_databits_inout (.read_data(read_data), .dq(dq),
				    .write_data(write_data), .rw_tff(rw_tff),
				    .fpga_clk(fpga_clk));

   ADDRBITS_OUT   I_addrbits_out (.addr(addr), .ui_addr(ui_addr), .fpga_clk(fpga_clk));

   // The read/write control signal goes directly to the ZBT SRAM

   always @ (posedge fpga_clk) begin
      rw_n_p <= ui_rw_n;
   end

   OBUF_F_16 I_obuf0 (.I(rw_n_p), .O(rw_n));

   TIE_UNUSED_SIGS I_tie_unused_sigs (.lbo_n(lbo_n), .cke_n(cke_n), .ld_n(ld_n),
				      .bwa_n(bwa_n), .bwb_n(bwb_n), .bwc_n(bwc_n),
				      .bwd_n(bwd_n), .oe_n(oe_n), .ce_n(ce_n),
				      .ce2(ce2), .ce2_n(ce2_n), .zz(zz));

   DLL_2X_BOARD I_dll_2x_board (.clk2x_int(fpga_clk),
				.ui_clk_mirror_locked_int(ui_clk_mirror_locked_int),
				.clk2x_ext(clk),
				.ui_clk_mirror_locked_ext(ui_clk_mirror_locked_ext),
				.ui_board_clk(ui_board_clk),
				.ui_clk_mirror_fb(ui_clk_mirror_fb));
  
endmodule // CTLR_P

