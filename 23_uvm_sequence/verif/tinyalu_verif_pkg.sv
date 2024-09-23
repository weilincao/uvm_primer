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

`include "tinyalu_sequence_item.sv"
`include "tinyalu_random_sequence.sv"
`include "tinyalu_sequencer.sv"
`include "tinyalu_driver.sv"
`include "tinyalu_coverage.sv"
`include "tinyalu_scoreboard.sv"
`include "tinyalu_env.sv"
`include "base_test.sv"
`include "simple_test.sv"

endpackage
