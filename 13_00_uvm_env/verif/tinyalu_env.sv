class tinyalu_env extends uvm_env;
`uvm_component_utils(tinyalu_env);

virtual tinyalu_interface ta_if;
tinyalu_tester tester;
tinyalu_scoreboard scoreboard;
tinyalu_coverage coverage;

function new(string name, uvm_component parent);
  super.new(name,parent);
  uvm_config_db #(virtual tinyalu_interface)::get(null, "*", "ta_if",ta_if);
  $display("tb class created");
endfunction

function void build_phase(uvm_phase phase);
  coverage = new("coverage",this);
  tester = new("tester",this);
  scoreboard = new("scoreboard",this);
endfunction



endclass
