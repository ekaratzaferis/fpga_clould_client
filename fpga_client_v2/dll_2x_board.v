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
*      Version:  $Id: dll_2x_board.v,v 1.1 1999-05-26 20:23:34+00 bapat Exp $
*
******************************************************************************/

`timescale 1ns / 1ps

`include "defines.v"

//----------------------------------------------------------------------
// This module instantiates two DLLs for generating de-skewed 2X clocks
// one for use inside the fpga (_int)
// and one for interfacing with other components on the Board (_ext)
//----------------------------------------------------------------------

module DLL_2X_BOARD (/*AUTOARG*/
   // Outputs
   clk2x_int, ui_clk_mirror_locked_int, clk2x_ext, 
   ui_clk_mirror_locked_ext, 
   // Inputs
   ui_board_clk, ui_clk_mirror_fb
   );
   
   input  ui_board_clk;          // Incoming clock

   output clk2x_int;             // 2X clk available inside the fpga
   output ui_clk_mirror_locked_int; // locked signal for the internal clock

   output clk2x_ext;             // 2X clk going out of the fpga
   output ui_clk_mirror_locked_ext;  // locked signal for the external clock
   input  ui_clk_mirror_fb;      // feedback signal for the external clock
                                 // user has to provide connection on the board
   wire   logic0 = 1'b0;         // Never reset the DLL
   
   wire   clkin;
   wire   clk_mirror_fb_ext;
   wire   clk2xdll_int;   
   wire   clk2xdll_ext;   
   wire   clk_mirror_locked_ext;

   IBUFG  I_ibufg_clkin    (.I(ui_board_clk), .O(clkin));
   CLKDLL I_clkdll_int     (.CLKIN(clkin), .CLKFB(clk2x_int), .RST(logic0),
			    .CLK2X(clk2xdll_int), .LOCKED(clk_mirror_locked_int));
   
   BUFG   I_bufg_clk2x_int (.I(clk2xdll_int), .O(clk2x_int));
   CLKDLL I_clkdll_ext     (.CLKIN(clkin), .CLKFB(clk_mirror_fb_ext), .RST(logic0),
			    .CLK2X(clk2xdll_ext), .LOCKED(clk_mirror_locked_ext));

   OBUF_F_16 I_obuf_clk_mirror_locked_int (.I(~clk_mirror_locked_int),
					   .O(ui_clk_mirror_locked_int));

   OBUF_F_8 I_obuf_clk2x_ext             (.I(clk2xdll_ext), .O(clk2x_ext));
   IBUFG     I_ibufg_clk_mirror_fb_ext    (.I(ui_clk_mirror_fb), .O(clk_mirror_fb_ext));
   OBUF_F_16 I_obuf_clk_mirror_locked_ext (.I(~clk_mirror_locked_ext),
					   .O(ui_clk_mirror_locked_ext));

endmodule // DLL_2X_BOARD
