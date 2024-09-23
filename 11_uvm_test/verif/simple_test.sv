`include "tinyalu_interface.sv"
`include "tester.sv"
`include "coverage.sv"
`include "scoreboard.sv"
class simple_test extends uvm_test;
`uvm_component_utils(simple_test);

virtual tinyalu_interface ta_if;
tester tester_inst;
scoreboard scoreboard_inst;
coverage coverage_inst;

function new(string name, uvm_component parent);
  super.new(name,parent);
  uvm_config_db #(virtual tinyalu_interface)::get(null, "*", "ta_if",ta_if);
  $display("tb class created");
endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);

  tester_inst = new(ta_if);
  tester_inst.execute();
  coverage_inst = new(ta_if);
  coverage_inst.execute();
  scoreboard_inst = new(ta_if);
  scoreboard_inst.execute();
  
  phase.drop_objection(this);
endtask


endclass
