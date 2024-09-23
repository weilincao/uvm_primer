package tinyalu_verif_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh";

typedef enum bit[2:0] {
    no_op = 0,
    add_op = 1,
    and_op = 2,
    xor_op = 3,
    mul_op = 4,
    rst_op = 7
} op_type;

`include "tester.sv"
`include "coverage.sv"
`include "scoreboard.sv"

`include "simple_test.sv"

endpackage