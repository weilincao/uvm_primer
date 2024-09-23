class tinyalu_random_sequence extends uvm_sequence#(tinyalu_sequence_item) ;
`uvm_object_utils(tinyalu_random_sequence);

function new(string name = "random");
  super.new(name);
endfunction;


virtual task body();
  tinyalu_sequence_item item;
  item = tinyalu_sequence_item::type_id::create("item");
  
  `uvm_info("sequence","start reset",UVM_LOW)
  start_item(item);
  item.op=rst_op;
  finish_item(item);

  `uvm_info("sequence","done reset",UVM_LOW)
  for(int i = 0 ; i < 20  ; i++) begin
    start_item(item);
    item.randomize();
    finish_item(item);
  end

endtask


endclass
