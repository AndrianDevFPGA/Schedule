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
