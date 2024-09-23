class scoreboard;
      virtual tinyalu_interface ta_if;

   function new (virtual tinyalu_interface b);
     ta_if = b;
   endfunction : new

   task execute();
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
   endtask : execute
   
   
endclass : scoreboard
