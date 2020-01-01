module top_module (
  input        clk,
  input  [1:0] sel,
  output [23:0] wave_out
  );
  
  
 //signal connecting freq_controller and wave_gen
  wire divider_conn;
  
  
 //===========================================================
 //instantiating frequency controller to divide 100MHz stystem
 //clock with a value depending on MIDI note in input 
 //(input to be added later) according to 
 // divisions = round(Fclk/(Nsamples*Fdesired))  
 //===========================================================
 freq_controller freq_controller_inst(.clk(clk),.divider(divider_conn));
 
 //===========================================================
 //instantiating wave generator, taking the clock and frequency
 //divider to drive the ROMs with the samples of different waves
 //===========================================================
 wave_gen wave_gen_inst (.clk(clk),.sel(sel),.wave_out(wave_out),.divider(divider_conn));
 
 endmodule 