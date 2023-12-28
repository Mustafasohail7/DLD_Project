// Code your design here

module TopLevelModule(
  input clk,
  input PS2_DATA,
  input PS2_CLK, //clk_div input that we generated in our previous lab to manipulate the frequency to be manageable by the FPGA
  output h_sync,
  output v_sync,
  output [3:0] red, // 3 RGB inputs which can be manipulated to create any color on screen.
  output [3:0] blue,
  output [3:0] green,
  output left,
  output right,
  output middle,
  output counter
);
  
  wire M1,M3,M7;
  wire [1:0] state;
  wire [9:0] M2, M4,M8,M9,x_pos;
  wire [8:0] y_pos; //we define multiple wires to connect our modules in our Top level module
  
  clk_div a1(M1,clk);
  h_count a2(M2,M3,M1);
  v_count a3(M1, M4, M3);
  vga_sync a4(M2,M4,h_sync,v_sync,M7,M8,M9);
  //clk_div2 a10(clk_o,clk);
  keyboard a6(clk,PS2_CLK,PS2_DATA,left,right,middle);
  //keyboard2 a9(clk,PS2_CLK,PS2_DATA,LED[1],LED[0]);
  moveFSMchakera a8(clk,left,right,middle,x_pos,y_pos,counter);
  //moveFSMwithFF(M1,LED,LED1);
  //moveFSM a7(LED,LED1);
  pixel_gen3 a5(M8,M9,M1,M7,x_pos,y_pos,red,blue,green); //here we call each module and connect it with each other using our pre defined wires and then eventually take the output out.
endmodule