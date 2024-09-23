class tinyalu_env extends uvm_env;
`uvm_component_utils(tinyalu_env);

virtual tinyalu_interface ta_if;
tinyalu_driver driver;
tinyalu_sequencer sequencer;
tinyalu_scoreboard scoreboard;
tinyalu_coverage coverage;

function new(string name, uvm_component parent);
  super.new(name,parent);
  uvm_config_db #(virtual tinyalu_interface)::get(null, "*", "ta_if",ta_if);
  $display("tb class created");
endfunction

function void build_phase(uvm_phase phase);
  coverage = tinyalu_coverage::type_id::create("coverage",this);
  driver = tinyalu_driver::type_id::create("driver",this);
  scoreboard = tinyalu_scoreboard::type_id::create("scoreboard",this);
  sequencer = tinyalu_sequencer::type_id::create("sequencer",this);
endfunction

function void connect_phase(uvm_phase phase);
  driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction

endclass
