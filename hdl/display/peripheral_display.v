module peripheral_display(clk,rst,d_in,cs,addr,rd,wr,sseg,anodos);

  input clk;
  input rst;
  input [15:0]d_in;
  input cs;
  input [3:0]addr;
  input rd;
  input wr;
 
  output [6:0]sseg;
  output [3:0]anodos;
 
  
reg [15:0] dato;


always @(negedge clk) begin//-------------------- escritura de registros 
  dato[15:0]=16'h1234; 
  dato[7:0]  = (cs && wr) ? d_in[7:0] : dato;
end 
display dp (.num(dato),.sseg(sseg), .an(anodos), .rst(rst), .clk(clk));

endmodule
