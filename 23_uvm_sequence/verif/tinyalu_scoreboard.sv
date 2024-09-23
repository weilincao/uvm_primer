class tinyalu_scoreboard extends uvm_component;
`uvm_component_utils(tinyalu_scoreboard)
      virtual tinyalu_interface ta_if;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    uvm_config_db#(virtual tinyalu_interface)::get(null,"*","ta_if",ta_if);
  endfunction

   task run_phase(uvm_phase phase);
      shortint predicted_result;
      forever begin : self_checker
         @(posedge ta_if.done) 
	   #1;
           case (ta_if.op_set)
             add_op: predicted_result = ta_if.A + ta_if.B;
             and_op: predicted_result = ta_if.A & ta_if.B;
             xor_op: predicted_result = ta_if.A ^ ta_if.B;
             mul_op: predicted_result = ta_if.A * ta_if.B;
           endcase // case (op_set)
         
         if ((ta_if.op_set != no_op) && (ta_if.op_set != rst_op))
           if (predicted_result != ta_if.result)
             $error ("FAILED: A: %0h  B: %0h  op: %s result: %0h",
                     ta_if.A, ta_if.B, ta_if.op_set.name(), ta_if.result);
         
      end : self_checker
   endtask : run_phase
   
   
endclass : tinyalu_scoreboard
