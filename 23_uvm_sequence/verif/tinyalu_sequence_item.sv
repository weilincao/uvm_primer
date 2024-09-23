class tinyalu_sequence_item extends uvm_sequence_item;
`uvm_object_utils(tinyalu_sequence_item)

rand byte unsigned A;
rand byte unsigned B;
rand op_type op;
shortint unsigned result;

function new(string name = "");
  super.new(name);
endfunction


constraint valid_op{op dist{no_op:/5, add_op:/10, and_op:/10,xor_op:/10,mul_op:/10,rst_op:/2};}
constraint data { A dist {8'h00:=1, [8'h01 : 8'hFE]:=1, 8'hFF:=1};
      B dist {8'h00:=1, [8'h01 : 8'hFE]:=1, 8'hFF:=1};} 


endclass
