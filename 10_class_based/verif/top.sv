`include "tinyalu_tb.sv"
`include "tinyalu.sv"
module top;

tinyalu_interface ta_if();
tinyalu_tb ta_tb;

tinyalu dut(.A(ta_if.A), .B(ta_if.B), .op(ta_if.op), .clk(ta_if.clk), .reset_n(ta_if.reset_n), .start(ta_if.start), .done(ta_if.done), .result(ta_if.result));

always begin
  #10;
  ta_if.clk=~ta_if.clk;
end

enum bit[2:0] {
no_op = 0,
add_op = 1,
and_op = 2,
xor_op = 3,
mul_op = 4,
rst_op = 7
} op_type;

initial begin
  ta_if.clk=0;
  $fsdbDumpfile("dump.fsdb");
  $fsdbDumpvars;
  ta_tb = new(ta_if);
  ta_tb.execute();
  /*
  ta_if.reset_n = 1'b0;
  @(negedge ta_if.clk);
  @(negedge ta_if.clk);
  ta_if.reset_n = 1;
  
  @(negedge ta_if.clk);
  @(negedge ta_if.clk);
  ta_if.A=3;
  ta_if.B=5;
  ta_if.op=mul_op;
  ta_if.start=1;
  @(posedge ta_if.done);
  $display($sformatf("a %d, b%d, result: %d" ,ta_if.A,ta_if.B,ta_if.result));
  @(negedge ta_if.done);
  ta_if.start=0;
  @(negedge ta_if.clk);
  @(negedge ta_if.clk);
  $finish;
  */
end


endmodule 
