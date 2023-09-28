// Code your design here


module counter(clk, rst, out);
  
  input  wire      clk;
  input  wire      rst;
  output wire[3:0] out;

  reg[3:0]  temp;
  reg       up_down;
  
  always @ (posedge clk or posedge rst) begin
    if(rst)
      temp<=0;
    else
      if(up_down)
        temp <= temp-1'b1;
      else
        temp <= temp+1'b1;
  end  
  
  always @ (negedge clk) begin
    if(temp == 15)
      up_down <=1;
    else if(temp == 0)
      up_down <= 0;
  end  
  
  assign out = temp;
  
endmodule
