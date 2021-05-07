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
*      Version:  $Id: addrbits_out.v,v 1.1 1999-05-26 20:23:37+00 bapat Exp $
*
******************************************************************************/

`timescale 1ns / 1ps

`define ADDR_BITS 16
`define DATA_BITS 36


// --------------------------------------------------
// Module for interfacing address with the ZBTSRAM
// --------------------------------------------------
module ADDRBITS_OUT (/*AUTOARG*/
   // Outputs
   addr, 
   // Inputs
   ui_addr, fpga_clk
   );

   // interfaces to user logic
   input [(`ADDR_BITS-1):0]  ui_addr;
   input 		     fpga_clk;
   // Interface to ZBT SRAM
   output [(`ADDR_BITS-1):0] addr;

   reg [(`ADDR_BITS-1):0] addr_p;

   always @ (posedge fpga_clk) begin
      addr_p <= ui_addr;
   end

   wire zero = 0;

   OBUF_F_16 I_obuf_addr0 (.O(addr[0]), .I(addr_p[0]));
   OBUF_F_16 I_obuf_addr1 (.O(addr[1]), .I(addr_p[1]));
   OBUF_F_16 I_obuf_addr2 (.O(addr[2]), .I(addr_p[2]));
   OBUF_F_16 I_obuf_addr3 (.O(addr[3]), .I(addr_p[3]));
   OBUF_F_16 I_obuf_addr4 (.O(addr[4]), .I(addr_p[4]));
   OBUF_F_16 I_obuf_addr5 (.O(addr[5]), .I(addr_p[5]));
   OBUF_F_16 I_obuf_addr6 (.O(addr[6]), .I(addr_p[6]));
   OBUF_F_16 I_obuf_addr7 (.O(addr[7]), .I(addr_p[7]));
   OBUF_F_16 I_obuf_addr8 (.O(addr[8]), .I(addr_p[8]));
   OBUF_F_16 I_obuf_addr9 (.O(addr[9]), .I(addr_p[9]));
   OBUF_F_16 I_obuf_addr10 (.O(addr[10]), .I(addr_p[10]));
   OBUF_F_16 I_obuf_addr11 (.O(addr[11]), .I(addr_p[11]));
   OBUF_F_16 I_obuf_addr12 (.O(addr[12]), .I(addr_p[12]));
   OBUF_F_16 I_obuf_addr13 (.O(addr[13]), .I(addr_p[13]));
   OBUF_F_16 I_obuf_addr14 (.O(addr[14]), .I(addr_p[14]));
   OBUF_F_16 I_obuf_addr15 (.O(addr[15]), .I(addr_p[15]));

endmodule // ADDRBITS_OUT
