//Hoat Vu
//Modified 
module moore_seq
(
   input clock, reset, x,
   output reg z);

   //assign binary encoded codes to the states A through D
   parameter A = 2'b00,
	       B = 2'b01,
	       C = 2'b10,
	       D = 2'b11;
   reg [1:0] current_state, next_state;

   //Section 1: Next state generator (NSG)
   always@(*)
   begin
      casex (current_state)
      
         A: if (x==1)
               next_state = A;
            else
               next_state = B;

         B: if (x==1)
               next_state = C;
            else
               next_state = B;

         C: if (x==1)
               next_state = D;
            else
               next_state = B;

         D: if (x==1)
               next_state = A;
            else
               next_state = B;

      endcase
   end

   //Section 2: Output generator (OG)
   always@(*)
   begin

      if (current_state == D)
         z = 1;
      else
         z = 0;

   end

   //Section 3: The flip-flops
   always@(posedge clock, posedge reset)
   begin

      if (reset == 1)
         current_state <= A;
      else
         current_state <= next_state;
         
   end
endmodule
