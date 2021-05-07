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
*      Version:  $Id: tie_unused_sigs.v,v 1.1 1999-05-26 20:23:38+00 bapat Exp $
*
******************************************************************************/

`timescale 1ns / 1ps

`include "defines.v"

// --------------------------------------------------
// Module for tying the unused control signals
// --------------------------------------------------
module TIE_UNUSED_SIGS (/*AUTOARG*/
   // Outputs
   lbo_n, cke_n, ld_n, bwa_n, bwb_n, bwc_n, bwd_n, oe_n, ce_n, ce2, 
   ce2_n, zz
   );

   // Interface to ZBT SRAM
   output lbo_n;  // Burst Mode (0 = Linear, 1 = Interleaved)
   output cke_n;  // Synchronous Clock Enable
   output ld_n;   // Synchronous address Adv/LD
   output bwa_n;  // Synchronous Byte Write Enable A
   output bwb_n;  // Synchronous Byte Write Enable B
   output bwc_n;  // Synchronous Byte Write Enable C
   output bwd_n;  // Synchronous Byte Write Enable D
   output oe_n;   // Output Enable
   output ce_n;   // Synchronous Chip Enable
   output ce2;    // Synchronous Chip Enable
   output ce2_n;  // Synchronous Chip Enable
   output zz;     // Snooze Mode
   
   wire   lbo_n_w = 0;
   wire   cke_n_w = 0;
   wire   ld_n_w = 0;
   wire   bwa_n_w = 0;
   wire   bwb_n_w = 0;
   wire   bwc_n_w = 0;
   wire   bwd_n_w = 0;
   wire   oe_n_w = 0;
   wire   ce_n_w = 0;
   wire   ce2_w = 1;
   wire   ce2_n_w = 0;
   wire   zz_w = 0;

   OBUF I_obuf_lbo_n  (.O(lbo_n), .I(lbo_n_w));
   OBUF I_obuf_cke_n  (.O(cke_n), .I(cke_n_w));
   OBUF I_obuf_ld_n   (.O(ld_n), .I(ld_n_w));
   OBUF I_obuf_bwa_n  (.O(bwa_n), .I(bwa_n_w));
   OBUF I_obuf_bwb_n  (.O(bwb_n), .I(bwb_n_w));
   OBUF I_obuf_bwc_n  (.O(bwc_n), .I(bwc_n_w));
   OBUF I_obuf_bwd_n  (.O(bwd_n), .I(bwd_n_w));
   OBUF I_obuf_oe_n   (.O(oe_n), .I(oe_n_w));
   OBUF I_obuf_ce_n   (.O(ce_n), .I(ce_n_w));
   OBUF I_obuf_ce2    (.O(ce2), .I(ce2_w));
   OBUF I_obuf1_ce2_n (.O(ce2_n), .I(ce2_n_w));
   OBUF I_obuf1_zz    (.O(zz), .I(zz_w));

endmodule // TIE_UNUSED_SIGS
