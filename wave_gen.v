module wave_gen (
  input clk,
//input wire [11:0] phase;
  input wire divider,
  input [1:0] sel,
  output wire [23:0] wave_out
  );
  
reg [11:0] phase = 12'd0;
//reg [7:0] sqr_table [4095:0];
wire [23:0] square_out;
wire [23:0] sawtooth_out;
wire [23:0] triangle_out;

/*
initial
 begin
  $readmemh("square_wavetable.txt", sqr_table);
 end
*/
 
//freq_controller freq_controller_inst (.clk(clk),.divider(divider));
 

always@(posedge clk)
 begin
  if(divider == 1'b1)
  begin
  phase <= phase + 1;
  end
 end
 
 
 square_ROM square_ROM_inst (.clk(clk),.raddr(phase),.dout(square_out));
 sawtooth_ROM sawtooth_ROM_inst (.clk(clk),.raddr(phase),.dout(sawtooth_out));
 triangle_ROM triangle_ROM_inst (.clk(clk),.raddr(phase),.dout(triangle_out));
/* 
always@(posedge clk)
 begin
  sqr_out <= sqr_table[phase];
 end
 */
 
 assign wave_out = (sel==2'b01)? square_out: (sel==2'b10)? sawtooth_out : 
   (sel==2'b11)? triangle_out : 24'd0;
endmodule 
 
