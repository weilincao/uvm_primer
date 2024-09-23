class simple_test extends base_test;
`uvm_component_utils(simple_test);


function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
  tinyalu_random_sequence random_sequence;
  random_sequence = new("random_sequence");
  phase.raise_objection(this);
  `uvm_info("test","staring test",UVM_LOW)
  random_sequence.start(sequencer);
  phase.drop_objection(this);
endtask



endclass
