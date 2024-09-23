`timescale 1ns/1ns
module top;

logic[7:0] A=0;
logic[7:0] B=0;
logic[2:0] op=0;
logic clk=0;
logic reset_n=0;
logic start=0;
logic done;
logic [15:0] result;


tinyalu dut(.A(A), .B(B), .op(op), .clk(clk), .reset_n(reset_n), .start(start), .done(done), .result(result));

always begin
  #10;
  clk=~clk;
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
  $fsdbDumpfile("dump.fsdb");
  $fsdbDumpvars;
  clk=0;
  reset_n = 1'b0;
  @(negedge clk);
  @(negedge clk);
  reset_n = 1;
  
  @(negedge clk);
  @(negedge clk);
  A=3;
  B=5;
  op=mul_op;
  start=1;
  @(posedge done);
  $display($sformatf("a %d, b%d, result: %d" ,A,B,result));
  @(negedge done);
  start=0;
  @(negedge clk);
  @(negedge clk);
  $finish;
end


endmodule 
