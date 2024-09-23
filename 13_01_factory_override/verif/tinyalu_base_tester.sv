class tinyalu_base_tester extends uvm_component;
`uvm_component_utils(tinyalu_base_tester);

virtual tinyalu_interface ta_if;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    uvm_config_db#(virtual tinyalu_interface)::get(null, "*", "ta_if", ta_if);
  endfunction

   virtual function op_type get_op();
   endfunction

   virtual function byte get_data();
   endfunction

   

//virtual task execute();
//  $display("executing tinyalu_teseter");
//endtask

endclass
