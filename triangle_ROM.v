module triangle_ROM (
  input               clk,
  input      [11:0] raddr,
  output reg [23:0]  dout
  );
 
 //ROM memory storing 4096 samples addressable
 //on 12 bit address (raddr)
 reg [23:0] triangle_table [0:4095];


 //initializing ROM memory with samples of triangle wave
 //taken from a hexadecimal file
initial $readmemh("triangle_wavetable_24b.hex", triangle_table);
  
  
 always@(posedge clk)
  begin
   dout <= triangle_table[raddr];
  end
 
 endmodule 