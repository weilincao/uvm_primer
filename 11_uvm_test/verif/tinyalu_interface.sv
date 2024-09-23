
typedef enum bit[2:0] {
    no_op = 0,
    add_op = 1,
    and_op = 2,
    xor_op = 3,
    mul_op = 4,
    rst_op = 7
} op_type;


interface tinyalu_interface;
  
  logic[7:0] A;
  logic[7:0] B;
  logic[2:0] op;
  logic clk;
  logic reset_n;
  logic start;
  logic done;
  logic [15:0] result;


  op_type  op_set;

  assign op = op_set;

  task reset_alu();
      reset_n = 1'b0;
      @(negedge clk);
      @(negedge clk);
      reset_n = 1'b1;
      start = 1'b0;
   endtask : reset_alu

  task send_op(input byte iA, input byte iB, input op_type iop, output shortint alu_result);
     
      if (iop == rst_op) begin
         @(negedge clk);
         op_set = iop;         
         @(posedge clk);
         reset_n = 1'b0;
         start = 1'b0;
         @(posedge clk);
         #1;
         reset_n = 1'b1;
      end else begin
         @(negedge clk);
         op_set = iop;
         A = iA;
         B = iB;
         start = 1'b1;
         if (iop == no_op) begin
            @(posedge clk);
            #1;
            start = 1'b0;           
         end else begin
            do
              @(negedge clk);
            while (done == 0);
            start = 1'b0;
         end
         alu_result = result;
      end // else: !if(iop == rst_op)
      
   endtask : send_op


endinterface


