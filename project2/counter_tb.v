`include "counter.v"

module counter_tb();

reg inorder, clock, reset;

wire [2:0] count;

counter c1(inorder, clock, reset, count);

initial begin
    $monitor("%4d: inorder = %b, count = %b", $time, inorder, count);
    clock = 0;
    reset = 1;
    inorder = 1;
    #10 reset = 0;
   // $monitor("%4d: inroder = %b, count = %b", $time, inorder, count);
end

always
begin
    #5clock = ~clock;
end 

initial begin
    $display("In Order Sequence (1,2,3,4,5,6): "); 
    inorder = 1;
    #150 inorder = 0;

    $display("");
    $display("");
    $display("Out of Order Sequence (4,2,5,3,6,1):");    
    #150 inorder = 1;

    #10 $finish;
end

endmodule
