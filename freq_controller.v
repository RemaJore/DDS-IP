module freq_controller (
 input          clk,
 output reg  divider
 );
 
//fixed divider, temporary 
parameter C4 = 93;

reg [6:0] counter = 7'd0;

always @(posedge clk)
begin
 if(counter == C4)
  counter <= 7'd0;
 else
 counter <= counter + 1'b1;
end

always@(posedge clk)
begin
 if(counter==C4)
   divider <= 1'b1;
  else
   divider <= 1'b0;
end

endmodule 
 