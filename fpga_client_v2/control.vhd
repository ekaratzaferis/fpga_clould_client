----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:20 11/26/2013 
-- Design Name: 
-- Module Name:    Control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--										EMBEDDED MICROPROCESSOR SYSTEMS
--												WINTER 2013-2014
--
--								         KONTOS NIKOS 	  := 2007030078
--										 BOZIKAS DIMITRIS := 2007030024
--
--								  ARCADE PONG IMPLEMENTATION ON ATLYS SPARTAN6


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           ball_x : in  STD_LOGIC_VECTOR (11 downto 0);
           ball_y : in  STD_LOGIC_VECTOR (11 downto 0);
           bar_1 : in  STD_LOGIC_VECTOR (11 downto 0);
           bar_2 : in  STD_LOGIC_VECTOR (11 downto 0);
			  start_button : in STD_LOGIC;
			  reset_pos : out STD_LOGIC;
			  score_1 : out std_logic_vector(2 downto 0);
			  score_2 : out std_logic_vector(2 downto 0);
			  deg : out  STD_LOGIC_VECTOR (1 downto 0);
			  hit : out  STD_LOGIC;
           dir : out  STD_LOGIC_VECTOR (1 downto 0));
end Control;

architecture Behavioral of Control is

signal dir_temp :std_logic_vector(1 downto 0);

signal score_1_temp : std_logic_vector(2 downto 0);
signal score_2_temp : std_logic_vector(2 downto 0);
signal temp : STD_LOGIC;
signal temp_y : STD_LOGIC;

type game_states is (new_game,start, playing, game_over);
signal state : game_states;
	
begin


process
begin

	WAIT UNTIL clk'EVENT AND clk = '1' ;
	if(reset ='0')then
	
		dir_temp <= "00";
		deg <= "11"; --00
		reset_pos  <= '1';
		hit<='0';
		state <= new_game;
		temp<='0';
		temp_y<='0';
		
	else
		
		case state is
		
				--=======================NEW GAME==========================--
				when new_game=>
					dir_temp <= "00";
					deg <= "11"; --00
					reset_pos  <= '1';
					score_1_temp<="000";
					score_2_temp<="000";
					hit<='0';
					temp<='0';
					temp_y<='0';
									
					state <= start;
					
				--=======================START=============================--	
            when start =>
				
					dir_temp <= "00";
					deg <= "11"; --00
					reset_pos  <= '1';
					hit<='0';
					temp<='0';
					temp_y<='0';
					
					if(start_button = '1')then
						state <= playing;
					else
						state <= start;
					end if;
					
				--========================PLAYING==========================--	
				when playing=>	
					
					reset_pos<='0';
					
					
					
					---------------------------------------------------------
					if(ball_x="001011010101" and temp='0')then
						temp<='1';
						if(ball_y="001000100110" or ball_y="000000110010")then
						temp_y<='0';
						end if;
						if(ball_y<=bar_2+"1000110" and ball_y>=bar_2-"1000110")then
						
							state<=playing;
							hit<='1';
							
							
--							if(ball_y=bar_2)then
--								deg<="11";
--							else					------mono 75 moires
--								deg<="01";
--							end if;
--								
--							dir_temp<=dir_temp - "10";
							
							
							
							if(ball_y<=bar_2+"101" and ball_y>=bar_2-"101")then	--meso baras
								
								deg<="11";
							
							elsif((ball_y>=bar_2+"110" and ball_y<=bar_2+"10100") or 
								  (ball_y<=bar_2-"110" and ball_y>=bar_2-"10100"))then	--pano/kato 1o
								  
								  deg<="10";
								  
							elsif((ball_y>=bar_2+"10101" and ball_y<=bar_2+"101000") or 
								  (ball_y<=bar_2-"10101" and ball_y>=bar_2-"101000"))then	--pano/kato 2o
								  
								  deg<="01";
								  
--							elsif((ball_y>=bar_2+"101001" and ball_y<=bar_2+"111100") or 
--								  (ball_y<=bar_2-"101001" and ball_y>=bar_2-"111100"))then	--pano/kato 3o	  
							else
								  deg<="00";
							
							end if;
							
							
							if(ball_y>=bar_2)then
							dir_temp<="00";
							else
							dir_temp<="01";
							end if;
						
						else
							hit<='0';
							score_1_temp<=score_1_temp +1;
							if(score_1_temp="100")then
								state<=game_over;
							else
								state<=start;
							end if;
							
						
						end if;
					
					elsif(ball_x="000001001011" and temp='0')then
						temp<='1';
						if(ball_y="001000100110" or ball_y="000000110010")then
						temp_y<='0';
						end if;
						if(ball_y<=bar_1+"1000110" and ball_y>=bar_1-"1000110")then
							
--							if(ball_y=bar_1)then
--								deg<="11";
--							else					------mono 75 moires
--								deg<="01";
--							end if;

							state<=playing;
							hit<='1';
							
							if(ball_y<=bar_1+"101" and ball_y>=bar_1-"101")then	--meso baras
								
								deg<="11";
							
							elsif((ball_y>=bar_1+"110" and ball_y<=bar_1+"10100") or 
								  (ball_y<=bar_1-"110" and ball_y>=bar_1-"10100"))then	--pano/kato 1o
								  
								  deg<="10";
								  
							elsif((ball_y>=bar_1+"10101" and ball_y<=bar_1+"101000") or 
								  (ball_y<=bar_1-"10101" and ball_y>=bar_1-"101000"))then	--pano/kato 2o
								  
								  deg<="01";
								  
--							elsif((ball_y>=bar_1+"101001" and ball_y<=bar_1+"111100") or 
--								  (ball_y<=bar_1-"101001" and ball_y>=bar_1-"111100"))then	--pano/kato 3o	  
							else
							
								  deg<="00";
							
							end if;
							
							if(ball_y>=bar_1)then
							dir_temp<="10";
							else
							dir_temp<="11";
							end if;
						
						else
						
							hit<='0';
							score_2_temp<=score_2_temp +1;
							if(score_2_temp="100")then
								state<=game_over;
							else
								state<=start;
							end if;
						end if;
					
					elsif(ball_y="001000111010" and temp_y='0')then			--an xtipisei pano
					
						dir_temp<=dir_temp + '1';
						temp_y<='1';
						if(ball_x="001011000001" or ball_x="000001011111")then
						temp<='0';
						end if;
						state<=playing;
						hit<='0';
						
					elsif (ball_y="000000011110"and temp_y='0')then		--an xtipisei kato
					
						dir_temp<=dir_temp - '1';
						temp_y<='1';
						if(ball_x="001011000001" or ball_x="000001011111")then
						temp<='0';
						end if;
						state<=playing;
						hit<='0';
					
					else	
						
						state<=playing;
						hit<='0';
						dir_temp<=dir_temp;
						
						if(ball_x="001011000001" or ball_x="000001011111")then
						temp<='0';
						end if;
						
						if(ball_y="001000100110" or ball_y="000000110010")then
						temp_y<='0';
						end if;
						
					end if;
					----------------------------------------------------------
					
					
				--========================GAME OVER========================--
				when game_over=>
					
					dir_temp<="00";
					deg<="00";
					reset_pos  <= '1';
					hit<='0';
					
					--if(start_button = '1')then
					--	state <= new_game;
					--else
						state <= game_over;
					--end if;
				
		end case;
		
		
	
	end if;

end process;

dir<=dir_temp;
score_1<=score_1_temp;
score_2<=score_2_temp;

end Behavioral;

