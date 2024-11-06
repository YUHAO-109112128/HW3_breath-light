--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:23 10/30/2024
-- Design Name:   
-- Module Name:   C:/Users/User/Desktop/testbench/pwm/pwm_breath_tb.vhd
-- Project Name:  pwm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pwm_breath
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pwm_breath_tb IS
END pwm_breath_tb;
 
ARCHITECTURE behavior OF pwm_breath_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwm_breath
    PORT(
         i_clk : IN  std_logic;
         i_rst : IN  std_logic;
         i_sw_up : IN  std_logic;
         i_sw_dn : IN  std_logic;
         pwm : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_rst : std_logic := '0';
   signal i_sw_up : std_logic := '0';
   signal i_sw_dn : std_logic := '0';

 	--Outputs
   signal pwm : std_logic;

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm_breath PORT MAP (
          i_clk => i_clk,
          i_rst => i_rst,
          i_sw_up => i_sw_up,
          i_sw_dn => i_sw_dn,
          pwm => pwm
        );

   -- Clock process definitions
   i_clk_process :process
   begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	  i_sw_up <= '0';
	  i_sw_dn <= '0';
	  i_rst <= '0';
	  wait for 100 ns;	
	  i_rst <= '1';
      wait for i_clk_period*1024;	

      -- insert stimulus here 

      wait;
   end process;

END;
