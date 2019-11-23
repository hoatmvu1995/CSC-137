/*
 *Hoat Vu
 *CSC137
 *Project 1
 * */

`timescale 1ns/100ps
`include "adder_3bits.v"

module adder_3bits_tb();

	//inputs
	reg [2:0] a, b;
	reg cin;

	//outputs
	wire [2:0] sum;
	wire co;

	adder_3bits cpa1(a, b, cin, sum, co);

	initial begin

 	 	$display("--------------------------------------------------");
   	 	$display("|t(ns)|  a    b   cin |  co   s  | ");
     	 	$display("--------------------------------------------------");
       	 	$monitor("%4d  | %b  %b   %b  |  %b   %b | ", $time, a, b, cin, co, sum);


         	a = 0; b = 0; cin = 0; //initial  
         	#1 a = 3'b001; b = 3'b001; cin = 1'b0;
         	#1 a = 3'b011; b = 3'b010; cin = 1'b1;
         	#1 a = 3'b011; b = 3'b100; cin = 1'b0;
         	#1 a = 3'b111; b = 3'b001; cin = 1'b0;
         	$display("--------------------------------------------------");
	end
endmodule 
