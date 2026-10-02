library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8bit_tb is
end full_adder_8bit_tb;

architecture behavior of full_adder_8bit_tb is

    component full_adder_8bit
        Port (
            A    : in  STD_LOGIC_VECTOR (7 downto 0);
            B    : in  STD_LOGIC_VECTOR (7 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR (7 downto 0);
            Cout : out STD_LOGIC
        );
    end component;
   signal A    : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal B    : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC_VECTOR (7 downto 0);
    signal Cout : STD_LOGIC;

begin

    uut: full_adder_8bit
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );
		    stim_proc: process
    begin

        -- 0 + 0 + 0 = 0
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        wait for 10 ns;

        -- 1 + 1 = 2
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;
		     -- 5 + 3 = 8
        A <= "00000101";
        B <= "00000011";
        Cin <= '0';
        wait for 10 ns;

        -- 15 + 1 = 16
        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        -- 100 + 50 = 150
        A <= "01100100";
        B <= "00110010";
        Cin <= '0';
        wait for 10 ns;
		   -- 127 + 1 = 128
        A <= "01111111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        -- 255 + 1 = 256
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        -- 255 + 255 + 1 = 511
        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        wait for 10 ns;

        wait;
		     end process;

end behavior;
