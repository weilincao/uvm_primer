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

function void build_phase(uvm_phase phase);
  coverage_inst = new("coverage_inst",this);
  tester_inst = new("tester_inst",this);
  scoreboard_inst = new("scoreboard_inst",this);
endfunction



endclass
