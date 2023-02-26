module peripheral_display(clk , rst , d_in , cs , addr , rd , wr, d_out,  sseg_d1, ssegd2 );
  
  input clk;
  input rst;
  input [15:0]d_in;
  input cs;
  input [3:0]addr; // 4 LSB from j1_io_addr
  input rd;
  input wr;
  output reg [15:0]d_out;

  output [6:0]sseg_d1;
  output [6:0]sseg_d2;

  wire [7:0]bcd;
//------------------------------------ regs and wires-------------------------------

 bcd = (cs && wr) ? d_in[7:0];

 display dp (.bcd(bcd),.sseg_d1(sseg_d1), .sseg_d2(sseg_d2));

endmodule
