class simple_test extends uvm_test;
`uvm_component_utils(simple_test);

virtual tinyalu_interface ta_if;
tinyalu_env env;

function new(string name, uvm_component parent);
  super.new(name,parent);
  uvm_config_db #(virtual tinyalu_interface)::get(null, "*", "ta_if",ta_if);
endfunction

function void build_phase(uvm_phase phase);
  tinyalu_base_tester::type_id::set_type_override(tinyalu_random_tester::get_type());
  env = tinyalu_env::type_id::create("env",this);
endfunction



endclass
