module clk_div2(clk_d,clk);
  input clk;
  output clk_d;
  reg clk_d;
  parameter div = 8'd49999999;
  reg count;
  
  initial
    begin
      count = 0;
      clk_d = 0;
    end
  
  always @ (posedge clk)
  begin
    if (count == div)
      count <= 0;
    else
      count <= count + 1;
  end
  
  always @ (posedge clk)
  begin
    if (count == div)
      clk_d = ~clk_d;
  end
  
endmodule