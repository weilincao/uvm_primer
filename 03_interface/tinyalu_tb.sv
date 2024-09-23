`timescale 1ns/1ns

interface tinyalu_interface;
logic[7:0] A=0;
logic[7:0] B=0;
logic[2:0] op=0;
logic clk=0;
logic reset_n=0;
logic start=0;
logic done;
logic [15:0] result;
endinterface

module top;

tinyalu_interface ta_if();


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
  $fsdbDumpfile("dump.fsdb");
  $fsdbDumpvars;
  ta_if.clk=0;
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
end


endmodule 
