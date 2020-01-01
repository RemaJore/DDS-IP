module sawtooth_ROM (
  input             clk,
  input [11:0]    raddr,
  output reg [23:0] dout
  );
  
 //ROM memory storing 4096 samples addressable
 //on 12 bit address (raddr)
 reg [23:0] sawtooth_table [0:4095];

 
 //initializing ROM memory with samples of sawtooth wave
 //taken from a hexadecimal file
initial $readmemh("sawtooth_wavetable_24b.hex", sawtooth_table);
  
  
 always@(posedge clk)
  begin
   dout <= sawtooth_table[raddr];
	
  end
 
 endmodule