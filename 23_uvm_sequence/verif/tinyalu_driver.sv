class tinyalu_driver extends uvm_driver#(tinyalu_sequence_item) ;
`uvm_component_utils(tinyalu_driver);

virtual tinyalu_interface ta_if;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    uvm_config_db#(virtual tinyalu_interface)::get(null, "*", "ta_if", ta_if);
  endfunction


   task run_phase(uvm_phase phase);
      tinyalu_sequence_item item;
      shortint     unsigned        result;
      forever begin
      seq_item_port.get_next_item(item);
      ta_if.send_op(item.A, item.B, item.op, result );
      $display("%2h %6s %2h = %4h",item.A, item.op.name(), item.B, result);
      seq_item_port.item_done();
      end
   endtask : run_phase

//virtual task execute();
//  $display("executing tinyalu_teseter");
//endtask

endclass
