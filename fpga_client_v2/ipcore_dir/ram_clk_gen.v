////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : xaw2verilog
//  /   /         Filename : ram_clk_gen.v
// /___/   /\     Timestamp : 10/12/2014 20:16:34
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st C:\VHDL\fpga_client_v2\ipcore_dir\.\ram_clk_gen.xaw C:\VHDL\fpga_client_v2\ipcore_dir\.\ram_clk_gen
//Design Name: ram_clk_gen
//Device: xc5vlx110t-1ff1136
//
// Module ram_clk_gen
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
`timescale 1ns / 1ps

module ram_clk_gen(CLKIN_IN, 
                   RST_IN, 
                   CLKDV_OUT, 
                   CLK0_OUT, 
                   CLK90_OUT, 
                   LOCKED_OUT);

    input CLKIN_IN;
    input RST_IN;
   output CLKDV_OUT;
   output CLK0_OUT;
   output CLK90_OUT;
   output LOCKED_OUT;
   
   wire CLKDV_BUF;
   wire CLKFB_IN;
   wire CLK0_BUF;
   wire CLK90_BUF;
   wire GND_BIT;
   wire [6:0] GND_BUS_7;
   wire [15:0] GND_BUS_16;
   
   assign GND_BIT = 0;
   assign GND_BUS_7 = 7'b0000000;
   assign GND_BUS_16 = 16'b0000000000000000;
   assign CLK0_OUT = CLKFB_IN;
   BUFG  CLKDV_BUFG_INST (.I(CLKDV_BUF), 
                         .O(CLKDV_OUT));
   BUFG  CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   BUFG  CLK90_BUFG_INST (.I(CLK90_BUF), 
                         .O(CLK90_OUT));
   DCM_ADV #( .CLK_FEEDBACK("1X"), .CLKDV_DIVIDE(2.0), .CLKFX_DIVIDE(1), 
         .CLKFX_MULTIPLY(4), .CLKIN_DIVIDE_BY_2("FALSE"), .CLKIN_PERIOD(5.000), 
         .CLKOUT_PHASE_SHIFT("NONE"), .DCM_AUTOCALIBRATION("TRUE"), 
         .DCM_PERFORMANCE_MODE("MAX_SPEED"), 
         .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), .DFS_FREQUENCY_MODE("HIGH"), 
         .DLL_FREQUENCY_MODE("HIGH"), .DUTY_CYCLE_CORRECTION("TRUE"), 
         .FACTORY_JF(16'hF0F0), .PHASE_SHIFT(0), .STARTUP_WAIT("FALSE"), 
         .SIM_DEVICE("VIRTEX5") ) DCM_ADV_INST (.CLKFB(CLKFB_IN), 
                         .CLKIN(CLKIN_IN), 
                         .DADDR(GND_BUS_7[6:0]), 
                         .DCLK(GND_BIT), 
                         .DEN(GND_BIT), 
                         .DI(GND_BUS_16[15:0]), 
                         .DWE(GND_BIT), 
                         .PSCLK(GND_BIT), 
                         .PSEN(GND_BIT), 
                         .PSINCDEC(GND_BIT), 
                         .RST(RST_IN), 
                         .CLKDV(CLKDV_BUF), 
                         .CLKFX(), 
                         .CLKFX180(), 
                         .CLK0(CLK0_BUF), 
                         .CLK2X(), 
                         .CLK2X180(), 
                         .CLK90(CLK90_BUF), 
                         .CLK180(), 
                         .CLK270(), 
                         .DO(), 
                         .DRDY(), 
                         .LOCKED(LOCKED_OUT), 
                         .PSDONE());
endmodule
