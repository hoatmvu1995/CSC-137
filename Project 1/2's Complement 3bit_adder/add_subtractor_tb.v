/*
*Hoat Vu
*CSC137
*Project 1 Extra Credit
*/

`timescale 1ns/100ps
`include "add_subtract.v"


module add_subtractor_tb();

reg [2:0] a, b;
reg m;

wire [2:0] result;
wire overflow;

add_subtract cpa1(a, b, m, result, overflow);

initial
    begin

	$display("--------------------------------------------------");
  	$display("|t(ns)|  a    b    m  | result  overflow  | ");
    	$display("--------------------------------------------------");
        $monitor("%4d  | %b   %b  %b  |  %b        %b     | ", $time, a, b, m, result, overflow);
	
		a = 0; b = 0; m = 0; 		  //initiall
	#1	a = 3'b001; b = 3'b001; m = 1'b0; // (1+1=2) => result = 3’b010;  overflow = 1’b0
	#1	a = 3'b011; b = 3'b010; m = 1'b1; // (3-2=1) => result = 3’b001;   overflow = 1’b0  
	#1	a = 3'b011; b = 3'b010; m = 1'b0; // (3+2=5) =>  result = 3’b101;  overflow = 1’b1    Overflow Error!
	#1	a = 3'b110; b = 3'b101; m = 1'b0; // (-2-3)=-5) => result = 3’b011; overflow = 1’b1   Overflow Error!

    end

endmodule
