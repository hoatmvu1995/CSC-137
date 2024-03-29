//Hoat Vu

`include "moore_seq.v"

module tester();

reg clock, reset, x;
wire z;

moore_seq u1(clock, reset, x, z);

initial begin
$monitor("%4d: 		z = %b", $time, z);
clock = 0;
reset = 1;	//reset the flip flop
x = 0;
#10 reset = 0; //end reset
end

always
begin
#5clock = ~clock; //generates a clock signal with period 10
end

initial begin //one input per clock cycle
#10 x = 1; $display("%4d: x = %b", $time, x);
#10 x = 1; $display("%4d: x = %b", $time, x);
#10 x = 1; $display("%4d: x = %b", $time, x);
#10 x = 0; $display("%4d: x = %b", $time, x);
#10 x = 1; $display("%4d: x = %b", $time, x);
#10 x = 0; $display("%4d: x = %b", $time, x);
#10 x = 1; $display("%4d: x = %b", $time, x);
#10 x = 1; $display("%4d: x = %b", $time, x);
#10 $finish;
end
endmodule
