// Code your design here
`timescale 1ns / 1ps
module vga_sync (
  input [9:0] h_count,
  input [9:0] v_count,
  output h_sync,
  output v_sync,
  output video_on,
  output [9:0] x_loc,
  output [9:0] y_loc
);
  
  //horizontal
  localparam HD = 640; //display horizontal
  localparam HF = 16; //front porch
  localparam HB = 48; //back porch
  localparam HR = 96; //retrace
  
  //vertical
  localparam VD = 480; //vertical display
  localparam VF = 10; 
  localparam VB = 33; 
  localparam VR = 2;
  
  assign h_sync = ((h_count < (HD+HF)) || (h_count >= (HD+HF+HR)));
  //assigning h sync high value if its in any other phase than retrace
  
  assign v_sync = ((v_count < (VD+VF)) || (v_count >= (VD+VF+VR)));
  //doing the same for vertical sync where we assign it a low value only if its in retrace phase otherwise high
  
  assign video_on = ((h_count < HD) && (v_count < VD));
  //video on is only high when both of our syncs our in displayable array of the monitor 
  
  
  assign x_loc = h_count; //the location of will simply be the horiontal count
  assign y_loc = v_count; //same for vertical count
  
endmodule