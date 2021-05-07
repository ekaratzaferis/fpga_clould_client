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
*      Version:  $Id: pipelined_stages_zbtf.v,v 1.2 1999-06-09 16:44:41+00 bapat Exp $
*
******************************************************************************/

`timescale 1ns / 1ps

`include "defines.v"
		      

// ----------------------------------------------------------------------
// Customizes the Controller for the ZBT SRAM for the Flowthru variety
// ----------------------------------------------------------------------
module PIPELINED_STAGES_F (/*AUTOARG*/
   // Outputs
   ui_read_data, write_data, rw_tff, 
   // Inputs
   ui_write_data, ui_rw_n, read_data, fpga_clk
   );

   // interfaces to user logic
   input [(`DATA_BITS-1):0]  ui_write_data;
   input 		     ui_rw_n;
   output [(`DATA_BITS-1):0] ui_read_data;
   
   // interfaces to DATABITS_INOUT
   output [(`DATA_BITS-1):0] write_data;
   input [(`DATA_BITS-1):0]  read_data;
   output [(`DATA_BITS-1):0] rw_tff;
   
   input 		     fpga_clk;
   
   
   reg [(`DATA_BITS-1):0]    ui_read_data;
   reg [(`DATA_BITS-1):0]    write_data;
   
   reg [3:0] 		     rw_P1;
   reg [3:0] 		     rw_P2;
   reg [(`DATA_BITS-1):0]    rw_tff;


   always @ (posedge fpga_clk) begin
      rw_P1 <= {4{ui_rw_n}};
      // a tree of FFs to reduce fanout and add one pipelining stage
      rw_tff <= {36{ui_rw_n}};
      // add one pipeline stage to data being written to the ZBT SRAM
      write_data <= ui_write_data;
      rw_P2 <= rw_P1;
      // register the data being read back from the ZBT SRAM
      if (rw_P2[0]) ui_read_data[8:0] <= read_data[8:0];
      if (rw_P2[1]) ui_read_data[17:9] <= read_data[17:9];
      if (rw_P2[2]) ui_read_data[26:18] <= read_data[26:18];
      if (rw_P2[3]) ui_read_data[35:27] <= read_data[35:27];
   end

endmodule // PIPELINED_STAGES_F
