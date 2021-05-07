//-----------------------------------------------------------------------------
// Title      : Virtex-5 Ethernet MAC Example Design Wrapper
// Project    : Virtex-5 Embedded Tri-Mode Ethernet MAC Wrapper
// File       : emac_example_design.v
// Version    : 1.8
//-----------------------------------------------------------------------------
//
// (c) Copyright 2004-2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
// Description:  This is the Verilog example design for the Virtex-5 
//               Embedded Ethernet MAC.  It is intended that
//               this example design can be quickly adapted and downloaded onto
//               an FPGA to provide a real hardware test environment.
//
//               This level:
//
//               * instantiates the TEMAC local link file that instantiates 
//                 the TEMAC top level together with a RX and TX FIFO with a 
//                 local link interface;
//
//               * instantiates a simple client I/F side example design,
//                 providing an address swap and a simple
//                 loopback function;
//
//               * Instantiates IBUFs on the GTX_CLK, REFCLK and HOSTCLK inputs 
//                 if required;
//
//               Please refer to the Datasheet, Getting Started Guide, and
//               the Virtex-5 Embedded Tri-Mode Ethernet MAC User Gude for
//               further information.
//
//
//
//    ---------------------------------------------------------------------
//    | EXAMPLE DESIGN WRAPPER                                            |
//    |           --------------------------------------------------------|
//    |           |LOCAL LINK WRAPPER                                     |
//    |           |              -----------------------------------------|
//    |           |              |BLOCK LEVEL WRAPPER                     |
`timescale 1 ps / 1 ps


//-----------------------------------------------------------------------------
// The module declaration for the example design.
//-----------------------------------------------------------------------------
module emac_example_design
(
    // Client Receiver Interface - EMAC0
    EMAC0CLIENTRXDVLD,
    EMAC0CLIENTRXFRAMEDROP,
    EMAC0CLIENTRXSTATS,
    EMAC0CLIENTRXSTATSVLD,
    EMAC0CLIENTRXSTATSBYTEVLD,

    // Client Transmitter Interface - EMAC0
    CLIENTEMAC0TXIFGDELAY,
    EMAC0CLIENTTXSTATS,
    EMAC0CLIENTTXSTATSVLD,
    EMAC0CLIENTTXSTATSBYTEVLD,

    // MAC Control Interface - EMAC0
    CLIENTEMAC0PAUSEREQ,
    CLIENTEMAC0PAUSEVAL,

    // GMII Interface - EMAC0
    GMII_TXD_0,
    GMII_TX_EN_0,
    GMII_TX_ER_0,
    GMII_TX_CLK_0,
    GMII_RXD_0,
    GMII_RX_DV_0,
    GMII_RX_ER_0,
    GMII_RX_CLK_0 ,

    // Reference clock for RGMII IODELAYs
	 PHY_RESET,
	 CLK_100,
	 
    // Asynchronous Reset
    RESET,
	 CONNECT,
	 //TEST_BUTTON,
	 //TEST_BUTTON2,
	 
	 //PS2
	  ps2_clk_mouse,
	  ps2_data_mouse,
	  ps2_clk_keyboard,
	  ps2_data_keyboard,
	  
	  // AC97
	  AC97_reset,
	  AC97_clk,
	  Sync,
	  SData_Out,
	  SData_In,
	  
	  // Chrontel DVI
	  DVI_D,
	  DVI_DE,
	  DVI_H,
	  DVI_V,
	  DVI_RESET_B,
	  DVI_XCLK_N,
	  DVI_XCLK_P,
	  
	  // IIC
	  I2C_SCL_DVI,
	  I2C_SDA_DVI,
	  
	  //DDR2
	  ddr2_dq,
	  ddr2_a,
	  ddr2_ba,
	  ddr2_ras_n,
	  ddr2_cas_n,
	  ddr2_we_n,
	  ddr2_cs_n,
	  ddr2_odt,
	  ddr2_cke,
	  ddr2_dqs,
	  ddr2_dqs_n,
	  ddr2_ck,
	  ddr2_ck_n,
	  DDR2_DM,
	
	  leds
);


//-----------------------------------------------------------------------------
// Port Declarations 
//-----------------------------------------------------------------------------
    // Client Receiver Interface - EMAC0
    output          EMAC0CLIENTRXDVLD;
    output          EMAC0CLIENTRXFRAMEDROP;
    output   [6:0]  EMAC0CLIENTRXSTATS;
    output          EMAC0CLIENTRXSTATSVLD;
    output          EMAC0CLIENTRXSTATSBYTEVLD;

    // Client Transmitter Interface - EMAC0
    input    [7:0]  CLIENTEMAC0TXIFGDELAY;
    output          EMAC0CLIENTTXSTATS;
    output          EMAC0CLIENTTXSTATSVLD;
    output          EMAC0CLIENTTXSTATSBYTEVLD;

    // MAC Control Interface - EMAC0
    input           CLIENTEMAC0PAUSEREQ;
    input   [15:0]  CLIENTEMAC0PAUSEVAL;

    // GMII Interface - EMAC0
    output   [7:0]  GMII_TXD_0;
    output          GMII_TX_EN_0;
    output          GMII_TX_ER_0;
    output          GMII_TX_CLK_0;
    input    [7:0]  GMII_RXD_0;
    input           GMII_RX_DV_0;
    input           GMII_RX_ER_0;
    input           GMII_RX_CLK_0 ;
	 
	 output			  PHY_RESET;
    input			  CLK_100;
	 
    // Asynchronous Reset
    input           RESET;
	 input 			  CONNECT;
	 //input 			  TEST_BUTTON;
	 //input 			  TEST_BUTTON2;
	 
	 // PS2 Interface
	 inout 			  ps2_clk_mouse;
	 inout 			  ps2_data_mouse;
	 inout 			  ps2_clk_keyboard;
	 inout 			  ps2_data_keyboard;
	 
	 // AC97 Interface
	 output			  AC97_reset;
	 input			  AC97_clk;
	 output			  Sync;
	 output			  SData_Out;
	 input			  SData_In;
	 
	 // Chrontel DVI
	 output  [11:0]  DVI_D;
	 output          DVI_DE;
	 output          DVI_H;
	 output          DVI_V;
	 output          DVI_RESET_B;
	 output          DVI_XCLK_N;
	 output          DVI_XCLK_P;
	 
	 // IIC
	 inout           I2C_SCL_DVI;
	 inout           I2C_SDA_DVI;
	 
	 //DDR2
	 inout   [63:0]  ddr2_dq;
	 output  [13:0]  ddr2_a;
	 output  [2:0]   ddr2_ba;
	 output          ddr2_ras_n;
	 output          ddr2_cas_n;
	 output          ddr2_we_n;
	 output  [1:0]   ddr2_cs_n;
	 output  [1:0]   ddr2_odt;
	 output  [1:0]   ddr2_cke;
	 inout   [7:0]   ddr2_dqs;
	 inout   [7:0]   ddr2_dqs_n;
	 output  [1:0]   ddr2_ck;
	 output  [1:0]   ddr2_ck_n;
	 output   [7:0]   DDR2_DM;
	 
	 output	 [7:0]  leds;

//-----------------------------------------------------------------------------
// Wire and Reg Declarations 
//-----------------------------------------------------------------------------

    // Global asynchronous reset
    wire            reset_i;
    // Local Link Interface Clocking Signal - EMAC0
    wire            ll_clk_0_i;

    // address swap transmitter connections - EMAC0
    wire      [7:0] tx_ll_data_0_i;
    wire            tx_ll_sof_n_0_i;
    wire            tx_ll_eof_n_0_i;
    wire            tx_ll_src_rdy_n_0_i;
    wire            tx_ll_dst_rdy_n_0_i;

    // address swap receiver connections - EMAC0
    wire      [7:0] rx_ll_data_0_i;
    wire            rx_ll_sof_n_0_i;
    wire            rx_ll_eof_n_0_i;
    wire            rx_ll_src_rdy_n_0_i;
    //wire            rx_ll_dst_rdy_n_0_i;

    // create a synchronous reset in the local link clock domain
    reg       [5:0] ll_pre_reset_0_i;
    reg             ll_reset_0_i;

    // synthesis attribute ASYNC_REG of tx_pre_reset_0_i is "TRUE";

    // Reference clock for RGMII IODELAYs
    wire            refclk_ibufg_i;
    wire            refclk_bufg_i;
    // EMAC0 Clocking signals

    // GMII input clocks to wrappers
    wire            tx_clk_0;
    wire            rx_clk_0_i;
    wire            gmii_rx_clk_0_delay;

    // IDELAY controller
    reg  [12:0] idelayctrl_reset_0_r;
    wire idelayctrl_reset_0_i;


    wire            gtx_clk_0_i;
    // synthesis attribute buffer_type of gtx_clk_0_i is none;
	 
	 //Crap
	 //Buttons
		wire deb_reset;
		wire deb_connect;

		//Peripheral Monitor
		wire mouse_action;
		wire keyboard_action;
		wire [7:0] mouse_data_tx;
		wire [7:0] keyboard_data_tx;

		//Data Tx
		wire [7:0] tx_data;
		wire [7:0] tx_data_length;
		wire tx_start;
		wire busy;
		wire payload;
		wire online;
		
		//Data RX
		wire eof;
		wire sof;
		wire rx_valid;
		wire rx_busy;
		wire [7:0] data_rx;
		wire rx_error;
		wire [15:0] length_rx;
		
		// Sound Buffer - AC97
		wire sound_packet;
		wire ac97_accept;
		wire [15:0] left_channel_out;
		wire [15:0] right_channel_out;
		
		// Screen Buffer
		wire screen_packet;
		
		//ARP
		wire arp;
		wire [47:0] arp_mac;
		wire [31:0] arp_ip;

		//Devices
		wire keyboard_valid;
		wire [7:0] keyboard_data;
		wire mouse_valid;
		wire [7:0] mouse_data;
		
		wire busy_tx;
		wire payload_tx;
		
		//Cross Domain Connector
		wire mouse_valid_monitor;
		wire keyboard_valid_monitor;
		wire [7:0] mouse_data_monitor;
		wire [7:0] keyboard_data_monitor;
	 



//-----------------------------------------------------------------------------
// Main Body of Code 
//-----------------------------------------------------------------------------

    // Reset input buffer
    IBUF reset_ibuf (.I(RESET), .O(reset_i));
	 assign PHY_RESET = ~(reset_i);

    // EMAC0 Clocking

    // Use IDELAY on GMII_RX_CLK_0 to move the clock into
    // alignment with the data

    // Instantiate IDELAYCTRL for the IDELAY in Fixed Tap Delay Mode
    IDELAYCTRL dlyctrl0 (
        .RDY(),
        .REFCLK(refclk_bufg_i),
        .RST(idelayctrl_reset_0_i)
        );
    //synthesis attribute syn_noprune of dlyctrl0 is "TRUE"

    always @(posedge refclk_bufg_i, posedge reset_i)
    begin
        if (reset_i == 1'b1)
        begin
            idelayctrl_reset_0_r[0]    <= 1'b0;
            idelayctrl_reset_0_r[12:1] <= 12'b111111111111;
        end
        else
        begin
            idelayctrl_reset_0_r[0]    <= 1'b0;
            idelayctrl_reset_0_r[12:1] <= idelayctrl_reset_0_r[11:0];
        end
    end

    assign idelayctrl_reset_0_i = idelayctrl_reset_0_r[12];

    // Please modify the value of the IOBDELAYs according to your design.
    // For more information on IDELAYCTRL and IODELAY, please refer to
    // the Virtex-5 User Guide.
    IODELAY gmii_rxc0_delay
    (.IDATAIN(GMII_RX_CLK_0),
     .ODATAIN(1'b0),
     .DATAOUT(gmii_rx_clk_0_delay),
     .DATAIN(1'b0),
     .C(1'b0),
     .T(1'b0),
     .CE(1'b0),
     .INC(1'b0),
     .RST(1'b0));
    //synthesis attribute IDELAY_TYPE of gmii_rxc0_delay is "FIXED"
    //synthesis attribute IDELAY_VALUE of gmii_rxc0_delay is 0
    //synthesis attribute DELAY_SRC of gmii_rxc0_delay is "I"
    //synthesis attribute SIGNAL_PATTERN of gmii_rxc0_delay is "CLOCK"
    defparam gmii_rxc0_delay.IDELAY_TYPE = "FIXED";
    defparam gmii_rxc0_delay.IDELAY_VALUE = 0;
    defparam gmii_rxc0_delay.DELAY_SRC = "I";
    defparam gmii_rxc0_delay.SIGNAL_PATTERN = "CLOCK";

    // Put the 125MHz reference clock through a BUFG.
    // Used to clock the TX section of the EMAC wrappers.
    // This clock can be shared between multiple MAC instances.
    BUFG bufg_tx_0 (.I(gtx_clk_0_i), .O(tx_clk_0));

    // Put the RX PHY clock through a BUFG.
    // Used to clock the RX section of the EMAC wrappers.
    BUFG bufg_rx_0 (.I(gmii_rx_clk_0_delay), .O(rx_clk_0_i));

    assign ll_clk_0_i = tx_clk_0;


    //------------------------------------------------------------------------
    // Instantiate the EMAC Wrapper with LL FIFO 
    // (emac_locallink.v) 
    //------------------------------------------------------------------------
    emac_locallink v5_emac_ll
    (
    // EMAC0 Clocking
    // TX Clock output from EMAC
    .TX_CLK_OUT                          (),
    // EMAC0 TX Clock input from BUFG
    .TX_CLK_0                            (tx_clk_0),

    // Local link Receiver Interface - EMAC0
    .RX_LL_CLOCK_0                       (ll_clk_0_i),
    .RX_LL_RESET_0                       (ll_reset_0_i),
    .RX_LL_DATA_0                        (rx_ll_data_0_i),
    .RX_LL_SOF_N_0                       (rx_ll_sof_n_0_i),
    .RX_LL_EOF_N_0                       (rx_ll_eof_n_0_i),
    .RX_LL_SRC_RDY_N_0                   (rx_ll_src_rdy_n_0_i),
    .RX_LL_DST_RDY_N_0                   (1'b0),
    .RX_LL_FIFO_STATUS_0                 (),

    // Unused Receiver signals - EMAC0
    .EMAC0CLIENTRXDVLD                   (EMAC0CLIENTRXDVLD),
    .EMAC0CLIENTRXFRAMEDROP              (EMAC0CLIENTRXFRAMEDROP),
    .EMAC0CLIENTRXSTATS                  (EMAC0CLIENTRXSTATS),
    .EMAC0CLIENTRXSTATSVLD               (EMAC0CLIENTRXSTATSVLD),
    .EMAC0CLIENTRXSTATSBYTEVLD           (EMAC0CLIENTRXSTATSBYTEVLD),

    // Local link Transmitter Interface - EMAC0
    .TX_LL_CLOCK_0                       (ll_clk_0_i),
    .TX_LL_RESET_0                       (ll_reset_0_i),
    .TX_LL_DATA_0                        (tx_ll_data_0_i),
    .TX_LL_SOF_N_0                       (tx_ll_sof_n_0_i),
    .TX_LL_EOF_N_0                       (tx_ll_eof_n_0_i),
    .TX_LL_SRC_RDY_N_0                   (tx_ll_src_rdy_n_0_i),
    .TX_LL_DST_RDY_N_0                   (tx_ll_dst_rdy_n_0_i),

    // Unused Transmitter signals - EMAC0
    .CLIENTEMAC0TXIFGDELAY               (CLIENTEMAC0TXIFGDELAY),
    .EMAC0CLIENTTXSTATS                  (EMAC0CLIENTTXSTATS),
    .EMAC0CLIENTTXSTATSVLD               (EMAC0CLIENTTXSTATSVLD),
    .EMAC0CLIENTTXSTATSBYTEVLD           (EMAC0CLIENTTXSTATSBYTEVLD),

    // MAC Control Interface - EMAC0
    .CLIENTEMAC0PAUSEREQ                 (CLIENTEMAC0PAUSEREQ),
    .CLIENTEMAC0PAUSEVAL                 (CLIENTEMAC0PAUSEVAL),



    .GTX_CLK_0                           (1'b0),

    // GMII Interface - EMAC0
    .GMII_TXD_0                          (GMII_TXD_0),
    .GMII_TX_EN_0                        (GMII_TX_EN_0),
    .GMII_TX_ER_0                        (GMII_TX_ER_0),
    .GMII_TX_CLK_0                       (GMII_TX_CLK_0),
    .GMII_RXD_0                          (GMII_RXD_0),
    .GMII_RX_DV_0                        (GMII_RX_DV_0),
    .GMII_RX_ER_0                        (GMII_RX_ER_0),
    .GMII_RX_CLK_0                       (rx_clk_0_i),

    // Asynchronous Reset Input
    .RESET                               (reset_i));


    //-------------------------------------------------------------------
    //  Instatiate the address swapping module
    //-------------------------------------------------------------------
	 
    tx_data_mac tx_data_mac 
      (.clk(ll_clk_0_i),
       .reset(ll_reset_0_i),
       .tx_data(tx_ll_data_0_i),
       .tx_sof(tx_ll_sof_n_0_i),
       .tx_eof(tx_ll_eof_n_0_i),
       .tx_src_rdy(tx_ll_src_rdy_n_0_i),
       .tx_dest_rdy(tx_ll_dst_rdy_n_0_i),
		 .start_tx(tx_start),
		 .data_tx(tx_data),
		 .length_tx(tx_data_length),
		 .busy(busy_tx),
		 .payload(payload_tx),
		 .arp(arp),
		 .arp_mac(arp_mac),
		 .arp_ip(arp_ip)
    );
	 
	 rx_data_mac rx_data_mac
		(.clk(ll_clk_0_i),
		 .reset(ll_reset_0_i),
		 .rx_data(rx_ll_data_0_i),
       .rx_sof(rx_ll_sof_n_0_i),
       .rx_eof(rx_ll_eof_n_0_i),
       .rx_src_rdy(rx_ll_src_rdy_n_0_i),
		 .sof(sof),
		 .eof(eof),
		 .sound_packet(sound_packet),
		 .screen_packet(screen_packet),
		 .rx_valid(rx_valid),
		 .data_rx(data_rx),
		 .length_rx(length_rx),
		 .busy(rx_busy),
		 .rx_error(rx_error),
		 .mac_error(GMII_RX_ER_0),
		 .arp(arp),
		 .arp_mac(arp_mac),
		 .arp_ip(arp_ip)
	);

    //assign rx_ll_dst_rdy_n_0_i   = tx_ll_dst_rdy_n_0_i;

    // Create synchronous reset in the transmitter clock domain.
    always @(posedge ll_clk_0_i, posedge reset_i)
    begin
      if (reset_i === 1'b1)
      begin
        ll_pre_reset_0_i <= 6'h3F;
        ll_reset_0_i     <= 1'b1;
      end
      else
      begin
        ll_pre_reset_0_i[0]   <= 1'b0;
        ll_pre_reset_0_i[5:1] <= ll_pre_reset_0_i[4:0];
        ll_reset_0_i          <= ll_pre_reset_0_i[5];
      end
    end
     
    //------------------------------------------------------------------------
    // REFCLK used for RGMII IODELAYCTRL primitive
    //------------------------------------------------------------------------
    //IBUFG refclk_ibufg (.I(ref_clk), .O(refclk_ibufg_i));
    BUFG  refclk_bufg  (.I(refclk_ibufg_i), .O(refclk_bufg_i));

    //----------------------------------------------------------------------
    // Stop the tools from automatically adding in a BUFG on the
    // GTX_CLK_0 line.
    //----------------------------------------------------------------------
    //IBUF gtx_clk0_ibuf (.I(gtx_clk),            .O(gtx_clk_0_i));
	  
	 clock_gen clock_gen(
		.clk(CLK_100),
		.rst(reset_i),
		.ref_clk(refclk_ibufg_i),
		.gtx_clk(gtx_clk_0_i),
		.dcm_locked()
	 );
	 
	
	 edge_detect connect_button(.button(CONNECT), .clk(CLK_100), .rise(), .fall(deb_connect));

	  data_tx data_tx(
			//ethernet
			.tx_data(tx_data),
			.tx_data_length(tx_data_length),
			.tx_start(tx_start),
			.tx_payload(payload_tx),
			.tx_busy(busy_tx),
			//monitor
			.connect(deb_connect),//connects system
			.mouse_action(mouse_action),
			.mouse_data(mouse_data_tx),
			.keyboard_action(keyboard_action),
			.keyboard_data(keyboard_data_tx),
			
			.busy(busy),
			.payload(payload),
			.online(online),
			//system
			.reset(reset_i),
			.clk(ll_clk_0_i)
		);
	
	reg [7:0] dd = 0;
	assign leds = dd;

	always @(posedge ll_clk_0_i) if (online) dd[6] <= 1;
	peripheral_monitor peripheral_monitor(
		.clk(ll_clk_0_i),
		.reset(reset_i),
		//data_tx
		.mouse_action(mouse_action),
		.mouse_data_tx(mouse_data_tx),
		.keyboard_action(keyboard_action),
		.keyboard_data_tx(keyboard_data_tx),
		
		.busy(busy),
		.payload(payload),
		.online(online),
		//peripherals
		.keyboard_valid(keyboard_valid_monitor),
		.keyboard_error(),
		.keyboard_data(keyboard_data_monitor),
		.mouse_valid(mouse_valid_monitor),
		.mouse_error(),
		.mouse_data(mouse_data_monitor)
	);
	
	wire device_reset;
	edge_detect dev_reset( .button(reset_i), .clk(CLK_100), .rise(), .fall(device_reset) );
	
	always @(posedge ll_clk_0_i) if (!rx_ll_src_rdy_n_0_i) dd[2] <= 1;
	
	wire [1:0] debug_p;
	always @(posedge CLK_100) begin
		if(debug_p[0]) dd[0] <= 1;
		if(debug_p[1]) dd[1] <= 1;
	end
	
	devices devices(
		.clk(CLK_100),
		.reset(device_reset),
		.ps2_clk_mouse(ps2_clk_mouse),
		.ps2_data_mouse(ps2_data_mouse),
		.ps2_clk_keyboard(ps2_clk_keyboard),
		.ps2_data_keyboard(ps2_data_keyboard),
		
		.keyboard_valid(keyboard_valid),
		.keyboard_error(),
		.keyboard_data(keyboard_data),
		.mouse_valid(mouse_valid),
		.mouse_error(),
		.mouse_data(mouse_data),
		.debug(debug_p)
	);
	
	cross_domain_clock cross_domain_connector(
		.clk_100(CLK_100),
		.clk_125(ll_clk_0_i),
		.reset(reset_i),
		.trigger_1(keyboard_valid),
		.trigger_2(mouse_valid),
		.data_in_1(keyboard_data),
		.data_in_2(mouse_data),
		.action_1(keyboard_valid_monitor),
		.action_2(mouse_valid_monitor),
		.data_out_1(keyboard_data_monitor),
		.data_out_2(mouse_data_monitor)
	);
	
	always @(posedge ll_clk_0_i) if (ac97_accept) dd[3] <= 1;
	ac97_if ac97_codec(
		.Reset(reset_i),
		.ClkIn(ll_clk_0_i),
		
		.SData_Out(SData_Out),
		.Sync(Sync),
		.AC97Clk(AC97_clk),
		.AC97Reset_n(AC97_reset),
		.SData_In(SData_In),
		
		.PCM_Record_Left(),
		.PCM_Record_Right(),
		.PCM_Record_Valid(),
		
		.Debug(),
		
		.PCM_Playback_Accept(ac97_accept),
		.PCM_Playback_Left({left_channel_out[7:0],left_channel_out[15:8]}),
		.PCM_Playback_Right({right_channel_out[7:0],right_channel_out[15:8]})
	);
	
	sound_buffering sound_buffering(
		.clk(ll_clk_0_i),
		.reset(reset_i),
		
		.new_sample(ac97_accept),
		.left_channel(left_channel_out),
		.right_channel(right_channel_out),
		
		.debug(),
		
		.sound_packet(sound_packet),
		.rx_valid(rx_valid),
		.rx_data(data_rx)
	);
	
	wire clk75; // EINAI 75MHZ!!!!
	clk25_gen clk25_gen(
		.CLKIN1_IN(CLK_100),
		.RST_IN(reset_i),
		.CLKOUT0_OUT(clk75),
		.LOCKED_OUT()
	);
	
	wire [6143:0] pixel_data;
	wire [10:0] rows;
	wire [10:0] lines;
	wire [23:0] rgb;
	wire ram_ask;
	wire new_frame;
	
	assign DDR2_DM = 0;
	always @(posedge ll_clk_0_i) if (screen_packet) dd[7] <= 1;
	wire debug_r;
	always @(posedge ll_clk_0_i) if (debug_r) dd[4] <= 1;
	frame_buffer frame_buffer(
		.clk100(CLK_100),
		.clk125(ll_clk_0_i), //125MHz unbuffed gtx_clk_0_i
		.reset(reset_i),
		
		.pixel_data(pixel_data),//pixel_data
		.ram_ask(ram_ask),//ram_ask_125
		.new_frame(new_frame),
		.debug(debug_r),
		
		.screen_packet(screen_packet),
		.rx_valid(rx_valid),
		.rx_data(data_rx),
		
		.ddr2_dq(ddr2_dq),
		.ddr2_a(ddr2_a),
		.ddr2_ba(ddr2_ba),
		.ddr2_ras_n(ddr2_ras_n),
		.ddr2_cas_n(ddr2_cas_n),
		.ddr2_we_n(ddr2_we_n),
		
		.ddr2_cs_n(ddr2_cs_n),
		.ddr2_odt(ddr2_odt),
		.ddr2_cke(ddr2_cke),
		.ddr2_dqs(ddr2_dqs),
		.ddr2_dqs_n(ddr2_dqs_n),
		.ddr2_ck(ddr2_ck),
		.ddr2_ck_n(ddr2_ck_n)
	);
	
	always @(posedge ll_clk_0_i) if (new_frame) dd[5] <= 1;
	ram_dvi_sync ram_dvi_sync(
		.clk125(ll_clk_0_i),
		.reset(reset_i),
		.clk75(clk75),
		.debug(),
		.pixel_data(pixel_data),
		.ram_ask(ram_ask),
		.new_frame(new_frame),
		.rgb(rgb),
		.rows(rows),
		.lines(lines)
	);
	
	HDMIController HDMIController(
		.CLK(CLK_100),
		.RSTN(~reset_i),
		.CLK_25(clk75),//75MHz
		.HDMIHSync(DVI_H),
		.HDMIVSync(DVI_V),
		.HDMIDE(DVI_DE),
		.HDMICLKP(DVI_XCLK_P),
		.HDMICLKN(DVI_XCLK_N),
		.HDMID(DVI_D),
		.HDMISCL(I2C_SCL_DVI),
		.HDMISDA(I2C_SDA_DVI),
		.HDMIRSTN(DVI_RESET_B),
		.ROWS(rows),
		.LINES(lines),
		.RGB(rgb)
	);
	
	
endmodule
