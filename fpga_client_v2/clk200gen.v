////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : xaw2verilog
//  /   /         Filename : clk200gen.v
// /___/   /\     Timestamp : 11/03/2014 22:30:03
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -intstyle C:/VHDL/fpga_client_v2/ipcore_dir/clk200gen.xaw -st clk200gen.v
//Design Name: clk200gen
//Device: xc5vlx110t-1ff1136
//
// Module clk200gen
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT0 = 0.140 ns
`timescale 1ns / 1ps

module clk200gen(CLKIN1_IN, 
                 RST_IN, 
                 CLKOUT0_OUT, 
                 LOCKED_OUT);

    input CLKIN1_IN;
    input RST_IN;
   output CLKOUT0_OUT;
   output LOCKED_OUT;
   
   wire CLKFBOUT_CLKFBIN;
   wire CLKOUT0_BUF;
   wire GND_BIT;
   wire [4:0] GND_BUS_5;
   wire [15:0] GND_BUS_16;
   wire VCC_BIT;
   
   assign GND_BIT = 0;
   assign GND_BUS_5 = 5'b00000;
   assign GND_BUS_16 = 16'b0000000000000000;
   assign VCC_BIT = 1;
   BUFG  CLKOUT0_BUFG_INST (.I(CLKOUT0_BUF), 
                           .O(CLKOUT0_OUT));
   PLL_ADV #( .BANDWIDTH("OPTIMIZED"), .CLKIN1_PERIOD(10.000), 
         .CLKIN2_PERIOD(10.000), .CLKOUT0_DIVIDE(4), .CLKOUT0_PHASE(0.000), 
         .CLKOUT0_DUTY_CYCLE(0.500), .COMPENSATION("SYSTEM_SYNCHRONOUS"), 
         .DIVCLK_DIVIDE(1), .CLKFBOUT_MULT(8), .CLKFBOUT_PHASE(0.0), 
         .REF_JITTER(0.005000) ) PLL_ADV_INST (.CLKFBIN(CLKFBOUT_CLKFBIN), 
                         .CLKINSEL(VCC_BIT), 
                         .CLKIN1(CLKIN1_IN), 
                         .CLKIN2(GND_BIT), 
                         .DADDR(GND_BUS_5[4:0]), 
                         .DCLK(GND_BIT), 
                         .DEN(GND_BIT), 
                         .DI(GND_BUS_16[15:0]), 
                         .DWE(GND_BIT), 
                         .REL(GND_BIT), 
                         .RST(RST_IN), 
                         .CLKFBDCM(), 
                         .CLKFBOUT(CLKFBOUT_CLKFBIN), 
                         .CLKOUTDCM0(), 
                         .CLKOUTDCM1(), 
                         .CLKOUTDCM2(), 
                         .CLKOUTDCM3(), 
                         .CLKOUTDCM4(), 
                         .CLKOUTDCM5(), 
                         .CLKOUT0(CLKOUT0_BUF), 
                         .CLKOUT1(), 
                         .CLKOUT2(), 
                         .CLKOUT3(), 
                         .CLKOUT4(), 
                         .CLKOUT5(), 
                         .DO(), 
                         .DRDY(), 
                         .LOCKED(LOCKED_OUT));
endmodule
