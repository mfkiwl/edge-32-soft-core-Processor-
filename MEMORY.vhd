library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MEMORY is
PORT(
		DIN: IN std_logic_vector(31 downto 0);
		WP, RP: IN std_logic_vector(11 downto 0);
		WCLK,RCLK, EN, WE, RE : IN std_logic;
		DOUT : OUT std_logic_vector(31 downto 0)


);
end MEMORY;

architecture Behavioral of MEMORY is
TYPE MEM IS ARRAY(0 TO 4095) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DATA : MEM;
SIGNAL WPTR, RPTR : INTEGER RANGE 0 TO 4095;

begin
WPTR <= CONV_INTEGER(WP);
RPTR <= CONV_INTEGER(RP);

PROCESS(WCLK, EN ,WE)
BEGIN
IF EN = '1' THEN
IF WE = '1' THEN 
IF RISING_EDGE(WCLK) THEN
	DATA(WPTR)<=DIN;
END IF;
END IF;
END IF;
END PROCESS;

PROCESS(RCLK, EN, RE)
BEGIN
IF EN = '1' THEN
IF RE = '1' THEN 
IF RISING_EDGE(RCLK) THEN
	DOUT <= DATA(RPTR);
	END IF;
END IF;
END IF;
END PROCESS;
end Behavioral;
