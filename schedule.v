module schedule (
                clk,
                rst,
                GTB,
                scheduleEntry,
                tx
                );
  input clk;
  input rst;
  input [31:0] GTB;
  input [31:0] scheduleEntry;
  output reg tx;
  
  
  integer counterPeriod;
  
  always @ (posedge clk)
    begin
      if (!rst)
        begin
          counterPeriod <= 0;
          tx <= 0;
        end 
      else
        begin
          counterPeriod <= counterPeriod +1;
          if (counterPeriod == 32'd500)
            begin
              counterPeriod <= 0;
            end 
        end 
        if (GTB % scheduleEntry == 0)
          begin
            tx <= 1;
          end 
        else
          begin
            tx <= 0;
          end 
    end 
  
endmodule

/*
entity schedule is
  port (
    clk, rst : in std_logic;
    scheduleEntry : in std_logic_vector (31 downto 0);
    tx : out std_logic
  );
end schedule;

architecture rtl of schedule is
  signal gtb : std_logic_vector (31 downto 0);
begin
  process (clk) is 
  begin
    if (rst = '1') then
      gtb <= (others =>'0');
      tx <= '0';
    elsif rising_edge(clk) then
      gtb <= gtb + 1;
      if (gtb = scheduleEntry) then
        gtb <= (others => '0');
        tx <= '1';
      else
        tx <= '0';
      end if;
    end if;
  end process;
end rtl;

*/
