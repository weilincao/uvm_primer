class tinyalu_tester extends uvm_component;
`uvm_component_utils(tinyalu_tester);

virtual tinyalu_interface ta_if;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    uvm_config_db#(virtual tinyalu_interface)::get(null, "*", "ta_if", ta_if);
  endfunction

   protected function op_type get_op();

      bit [2:0] op_choice;
      op_choice = $random;
      case (op_choice)
        3'b000 : return no_op;
        3'b001 : return add_op;
        3'b010 : return and_op;
        3'b011 : return xor_op;
        3'b100 : return mul_op;
        3'b101 : return no_op;
        3'b110 : return rst_op;
        3'b111 : return rst_op;
      endcase // case (op_choice)
   endfunction : get_op

   protected function byte get_data();
      bit [1:0] zero_ones;
      zero_ones = $random;
      if (zero_ones == 2'b00)
        return 8'h00;
      else if (zero_ones == 2'b11)
        return 8'hFF;
      else
        return $random;
   endfunction : get_data
   
   task run_phase(uvm_phase phase);

      byte         unsigned        iA;
      byte         unsigned        iB;
      shortint     unsigned        result;
      op_type                  op_set;
    phase.raise_objection(this);
      ta_if.reset_alu();
      op_set = rst_op;
      iA = get_data();
      iB = get_data();
      ta_if.send_op(iA, iB, op_set, result);
      op_set = mul_op;
      ta_if.send_op(iA, iB, op_set, result);
      ta_if.send_op(iA, iB, op_set, result);
      op_set = rst_op;
      ta_if.send_op(iA, iB, op_set, result);
      repeat (10) begin : random_loop
         op_set = get_op();
         iA = get_data();
         iB = get_data();
         ta_if.send_op(iA, iB, op_set, result );
         $display("%2h %6s %2h = %4h",iA, op_set.name(), iB, result);
      end : random_loop
  phase.drop_objection(this);
   endtask : run_phase

//virtual task execute();
//  $display("executing tinyalu_teseter");
//endtask

endclass
