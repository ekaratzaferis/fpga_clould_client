library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


-------------------------------------------------------------------------------
-- The entity declaration for the example design.
-------------------------------------------------------------------------------
entity clock_gen is
   port(
   
       clk                : in  std_logic;
       rst                : in  std_logic;

       ref_clk            : out std_logic;
       gtx_clk            : out std_logic;
       dcm_locked         : out std_logic
   );
end clock_gen;


architecture RTL of clock_gen is

    -- EMAC0 Clocking signals

    -- Transceiver output clock (REFCLKOUT at 125MHz)
    signal clk125_o                  : std_logic;
    -- 125MHz clock input to wrappers
    signal clk_fb_emac1              : std_logic;
    signal clk100_emac1              : std_logic;
    signal ref_clk_bufg              : std_logic;
    signal gtx_clk_1_i               : std_logic;
 
-------------------------------------------------------------------------------
-- Main Body of Code
-------------------------------------------------------------------------------


begin
   
    -- Generate 125MHz (gtx_clk) and 200MHz (ref_clk)
    clk125_dcm : DCM_BASE 
    generic map (
     CLKFX_DIVIDE   => 4,
     CLKFX_MULTIPLY => 5)
    port map 
    (CLKIN      => clk,
     CLK0       => clk_fb_emac1,
     CLK180     => open,
     CLK270     => open,
     CLK2X      => ref_clk_bufg,
     CLK2X180   => open,
     CLK90      => open,
     CLKDV      => open,
     CLKFX      => gtx_clk_1_i,
     CLKFX180   => open,
     LOCKED     => dcm_locked,
     CLKFB      => clk100_emac1,
     RST        => rst);

    fb_bufg      : BUFG port map (I => clk_fb_emac1, O => clk100_emac1);
    
    gtx_clk_bufg : BUFG port map (I => gtx_clk_1_i, O => gtx_clk);
    
    refclk_bufg  : BUFG port map (I => ref_clk_bufg, O => ref_clk);
     
end RTL;
