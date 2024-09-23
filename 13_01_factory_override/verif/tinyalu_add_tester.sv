class tinyalu_add_tester extends tinyalu_random_tester;
`uvm_component_utils(tinyalu_add_tester);

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction


   function op_type get_op();
      return add_op;
   endfunction : get_op

endclass
