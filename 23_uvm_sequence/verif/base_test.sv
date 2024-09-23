class base_test extends uvm_test;
`uvm_component_utils(base_test);

tinyalu_env env;
tinyalu_sequencer sequencer;

function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  env = tinyalu_env::type_id::create("env",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
  sequencer = env.sequencer;
endfunction






endclass
