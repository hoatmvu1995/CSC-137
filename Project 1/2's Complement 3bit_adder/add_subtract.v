/*
*Hoat Vu
*CSC137
*Project 1 Extra Credit
*/

`include "full_adder.v"


module add_subtract(
    input[2:0] a, b,
    input m,
    output[2:0] result,
    output overflow
);

wire [2:0] xor_b, carry_out;

xor x1(xor_b[2], b[2], m);
xor x2(xor_b[1], b[1], m);
xor x3(xor_b[0], b[0], m);

full_adder fa1(a[0], xor_b[0], m, result[0], carry_out[0]);
full_adder fa2(a[1], xor_b[1], carry_out[0], result[1], carry_out[1]);
full_adder fa3(a[2], xor_b[2], carry_out[1], result[2], carry_out[2]);

xor x4(overflow, carry_out[2], carry_out[1]);

endmodule

