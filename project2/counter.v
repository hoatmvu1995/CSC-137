/*
 *Hoat Vu
 *CSC 137
 *Project 2
 * */

//module
module  counter
(
    input inorder,
    input clock, reset,
    output reg [2:0] count
);

//parameter that have 7 states, with two unsed state
parameter state1 = 3'b001,
	  state0 = 3'b000,
          state2 = 3'b010,  
          state3 = 3'b011, 
          state4 = 3'b100, 
          state5 = 3'b101, 
          state6 = 3'b110, 
          state7 = 3'b111;

reg [2:0] current_state, next_state;


always@(*)
begin
    case (current_state)
    //at state 0, it doesn't matter what happened, or inorder input, the next
    //state of state 0 is always state 1
    state0: next_state = state1;

    state1: if (inorder == 1)
                next_state = state2;
            else 
                next_state  = state4;

    state2: if  (inorder == 1)
                next_state = state3;
            else
                next_state =  state5;

    state3: if (inorder  == 1)
                next_state = state4;
            else
                next_state = state6;

    state4: if  (inorder  == 1)  
                next_state =  state5;
            else
                next_state = state2;

    state5: if  (inorder == 1) 
                next_state =  state6;
            else
                next_state  = state3;

    state6: if  (inorder == 1)
                next_state = state7;
            else
                next_state = state1;
    //It's almost the same with state0, except, if the inorder = 1, it would
    //follow order go to state 0. Otherwise, it will go to state 1. It seem
    //like an unused, but it's not like state 0 
    state7: next_state = state1;

    endcase
end

//output generator
always@(*)
begin
	if (current_state != state7)
		count <= current_state;	
    
end

//flip flop
always@(posedge clock, posedge reset)
begin
	if (reset == 1)
		current_state <= state0;
	else 
		current_state <= next_state;
end


endmodule


