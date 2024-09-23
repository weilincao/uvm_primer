class tinyalu_env extends uvm_env;
`uvm_component_utils(tinyalu_env);

virtual tinyalu_interface ta_if;
tinyalu_base_tester tester;
tinyalu_scoreboard scoreboard;
tinyalu_coverage coverage;

function new(string name, uvm_component parent);
  super.new(name,parent);
  uvm_config_db #(virtual tinyalu_interface)::get(null, "*", "ta_if",ta_if);
  $display("tb class created");
endfunction

function void build_phase(uvm_phase phase);
  coverage = tinyalu_coverage::type_id::create("coverage",this);
  tester = tinyalu_base_tester::type_id::create("tester",this);
  scoreboard = tinyalu_scoreboard::type_id::create("scoreboard",this);
endfunction



endclass
