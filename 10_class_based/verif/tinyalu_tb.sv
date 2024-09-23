`include "tinyalu_interface.sv"
`include "tester.sv"
`include "coverage.sv"
`include "scoreboard.sv"
class tinyalu_tb;

virtual tinyalu_interface ta_if;
tester tester_inst;
scoreboard scoreboard_inst;
coverage coverage_inst;

function new(virtual tinyalu_interface intf);
  ta_if = intf;
  $display("tb class created");
endfunction

task execute();
  tester_inst = new(ta_if);
  tester_inst.execute();
  coverage_inst = new(ta_if);
  coverage_inst.execute();
  scoreboard_inst = new(ta_if);
  scoreboard_inst.execute();
endtask


endclass
