module square_ROM (
  input              clk,
  input     [11:0] raddr,
  output reg [23:0]  dout
  );
 
 //ROM memory storing 4096 samples addressable
 //on 12 bit address (raddr)
 reg [23:0] square_table [0:4095];


 //initializing ROM memory with samples of square wave
 //taken from a hexadecimal file
initial $readmemh("square_wavetable_24b.hex", square_table);
  
  
 always@(posedge clk)
  begin
   dout <= square_table[raddr];
  end
 
 endmodule 
 
  