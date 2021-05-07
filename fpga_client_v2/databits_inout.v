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
*      Version:  $Id: databits_inout.v,v 1.2 1999-06-09 16:44:39+00 bapat Exp $
*
******************************************************************************/

`timescale 1ns / 1ps

`define ADDR_BITS 16
`define DATA_BITS 36


// --------------------------------------------------
// Module for interfacing data with the ZBTSRAM
// --------------------------------------------------
module DATABITS_INOUT (/*AUTOARG*/
   // Outputs
   read_data, 
   // Inouts
   dq, 
   // Inputs
   write_data, rw_tff, fpga_clk
   );
   // Interface to DATABITS_INOUT
   output [(`DATA_BITS-1):0] read_data;
   input [(`DATA_BITS-1):0]  write_data;
   input [(`DATA_BITS-1):0]  rw_tff;
   input 		     fpga_clk;
   // Interface to ZBT SRAM
   inout [(`DATA_BITS-1):0]  dq;

   reg [(`DATA_BITS-1):0]    write_data_p;
   reg [(`DATA_BITS-1):0]    rw_tff_p;

   wire zero = 0;

   always @ (posedge fpga_clk) begin
      write_data_p <= write_data;
      rw_tff_p <= rw_tff;
   end

   IOBUF_F_16 I_iobuf0( .O(read_data[0]),.IO(dq[0]), .I(write_data_p[0]), .T(rw_tff_p[0]));
   IOBUF_F_16 I_iobuf1( .O(read_data[1]),.IO(dq[1]), .I(write_data_p[1]), .T(rw_tff_p[1]));
   IOBUF_F_16 I_iobuf2( .O(read_data[2]),.IO(dq[2]), .I(write_data_p[2]), .T(rw_tff_p[2]));
   IOBUF_F_16 I_iobuf3( .O(read_data[3]),.IO(dq[3]), .I(write_data_p[3]), .T(rw_tff_p[3]));
   IOBUF_F_16 I_iobuf4( .O(read_data[4]),.IO(dq[4]), .I(write_data_p[4]), .T(rw_tff_p[4]));
   IOBUF_F_16 I_iobuf5( .O(read_data[5]),.IO(dq[5]), .I(write_data_p[5]), .T(rw_tff_p[5]));
   IOBUF_F_16 I_iobuf6( .O(read_data[6]),.IO(dq[6]), .I(write_data_p[6]), .T(rw_tff_p[6]));
   IOBUF_F_16 I_iobuf7( .O(read_data[7]),.IO(dq[7]), .I(write_data_p[7]), .T(rw_tff_p[7]));
   IOBUF_F_16 I_iobuf8( .O(read_data[8]),.IO(dq[8]), .I(write_data_p[8]), .T(rw_tff_p[8]));
   IOBUF_F_16 I_iobuf9( .O(read_data[9]),.IO(dq[9]), .I(write_data_p[9]), .T(rw_tff_p[9]));
   IOBUF_F_16 I_iobuf10( .O(read_data[10]),.IO(dq[10]), .I(write_data_p[10]), .T(rw_tff_p[10]));
   IOBUF_F_16 I_iobuf11( .O(read_data[11]),.IO(dq[11]), .I(write_data_p[11]), .T(rw_tff_p[11]));
   IOBUF_F_16 I_iobuf12( .O(read_data[12]),.IO(dq[12]), .I(write_data_p[12]), .T(rw_tff_p[12]));
   IOBUF_F_16 I_iobuf13( .O(read_data[13]),.IO(dq[13]), .I(write_data_p[13]), .T(rw_tff_p[13]));
   IOBUF_F_16 I_iobuf14( .O(read_data[14]),.IO(dq[14]), .I(write_data_p[14]), .T(rw_tff_p[14]));
   IOBUF_F_16 I_iobuf15( .O(read_data[15]),.IO(dq[15]), .I(write_data_p[15]), .T(rw_tff_p[15]));
   IOBUF_F_16 I_iobuf16( .O(read_data[16]),.IO(dq[16]), .I(write_data_p[16]), .T(rw_tff_p[16]));
   IOBUF_F_16 I_iobuf17( .O(read_data[17]),.IO(dq[17]), .I(write_data_p[17]), .T(rw_tff_p[17]));
   IOBUF_F_16 I_iobuf18( .O(read_data[18]),.IO(dq[18]), .I(write_data_p[18]), .T(rw_tff_p[18]));
   IOBUF_F_16 I_iobuf19( .O(read_data[19]),.IO(dq[19]), .I(write_data_p[19]), .T(rw_tff_p[19]));
   IOBUF_F_16 I_iobuf20( .O(read_data[20]),.IO(dq[20]), .I(write_data_p[20]), .T(rw_tff_p[20]));
   IOBUF_F_16 I_iobuf21( .O(read_data[21]),.IO(dq[21]), .I(write_data_p[21]), .T(rw_tff_p[21]));
   IOBUF_F_16 I_iobuf22( .O(read_data[22]),.IO(dq[22]), .I(write_data_p[22]), .T(rw_tff_p[22]));
   IOBUF_F_16 I_iobuf23( .O(read_data[23]),.IO(dq[23]), .I(write_data_p[23]), .T(rw_tff_p[23]));
   IOBUF_F_16 I_iobuf24( .O(read_data[24]),.IO(dq[24]), .I(write_data_p[24]), .T(rw_tff_p[24]));
   IOBUF_F_16 I_iobuf25( .O(read_data[25]),.IO(dq[25]), .I(write_data_p[25]), .T(rw_tff_p[25]));
   IOBUF_F_16 I_iobuf26( .O(read_data[26]),.IO(dq[26]), .I(write_data_p[26]), .T(rw_tff_p[26]));
   IOBUF_F_16 I_iobuf27( .O(read_data[27]),.IO(dq[27]), .I(write_data_p[27]), .T(rw_tff_p[27]));
   IOBUF_F_16 I_iobuf28( .O(read_data[28]),.IO(dq[28]), .I(write_data_p[28]), .T(rw_tff_p[28]));
   IOBUF_F_16 I_iobuf29( .O(read_data[29]),.IO(dq[29]), .I(write_data_p[29]), .T(rw_tff_p[29]));
   IOBUF_F_16 I_iobuf30( .O(read_data[30]),.IO(dq[30]), .I(write_data_p[30]), .T(rw_tff_p[30]));
   IOBUF_F_16 I_iobuf31( .O(read_data[31]),.IO(dq[31]), .I(write_data_p[31]), .T(rw_tff_p[31]));
   IOBUF_F_16 I_iobuf32( .O(read_data[32]),.IO(dq[32]), .I(write_data_p[32]), .T(rw_tff_p[32]));
   IOBUF_F_16 I_iobuf33( .O(read_data[33]),.IO(dq[33]), .I(write_data_p[33]), .T(rw_tff_p[33]));
   IOBUF_F_16 I_iobuf34( .O(read_data[34]),.IO(dq[34]), .I(write_data_p[34]), .T(rw_tff_p[34]));
   IOBUF_F_16 I_iobuf35( .O(read_data[35]),.IO(dq[35]), .I(write_data_p[35]), .T(rw_tff_p[35]));
   
endmodule // DATABITS_INOUT
