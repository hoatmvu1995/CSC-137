/*
 *Hoat Vu
 *CSC137
 *Project 1
 * */

`include "full_adder.v"



module adder_3bits(

	input [2:0] a, b,
	input cin,

	output [2:0] sum,
	output co);

	wire c1, c2;

	full_adder FA1(a[0], b[0], cin, sum[0], c1),
		   FA2(a[1], b[1], c1, sum[1], c2),
		   FA3(a[2], b[2], c2, sum[2], co);
		
endmodule

