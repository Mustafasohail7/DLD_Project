module pixel_gen(
  input [9:0] pixel_x,
  input [9:0] pixel_y,
  input clk_div,
  input video_on,
  input [9:0] object_x,
  input [9:0] obstacle_y,
  output reg [3:0] red = 0,
  output reg [3:0] blue = 0,
  output reg [3:0] green = 0
);

    always @(posedge clk_div) begin
  if (((pixel_y>=280)&&(pixel_y<380))&&((pixel_x>=object_x)&&(pixel_x<(object_x+40)))) begin
    red   <= 4'h0;
    green <= 4'h0;
    blue  <= 4'hF;
    end
  else if (((pixel_y>=obstacle_y)&&(pixel_y<(obstacle_y+50)))&&((pixel_x>=280)&&(pixel_x<360))) begin
    red   <= 4'hF;
    green <= 4'h0;
    blue  <= 4'h0;
    end
  else if (((pixel_x>=200)&&(pixel_x<220))||((pixel_x>=420)&&(pixel_x<440))) begin
    red   <= 4'hF;
    green <= 4'hF;
    blue  <= 4'h0;
    end
  else begin
    red   <= 4'h8;
    green <= 4'h8;
    blue  <= 4'h8;
    end
    end
/*
  always @ (posedge clk_div) begin
    //LEFT LANE
    if (state==2'b01) begin
    if (((pixel_x>=0)&&(pixel_x<200))) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
      if (((pixel_y>=280)&&(pixel_y<380))&&((pixel_x>=80)&&(pixel_x<120))) begin
        red   <= 4'h0;
      	green <= 4'h0;
      	blue  <= 4'hF;
      end
    end
    if ((pixel_x>=200)&&(pixel_x<220)) begin
      red   <= 4'hF;
      green <= 4'hF;
      blue  <= 4'h0;
    end
    if ((pixel_x>=220)&&(pixel_x<420)) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
    end
    if ((pixel_x>=420)&&(pixel_x<440)) begin
      red   <= 4'hF;
      green <= 4'hF;
      blue  <= 4'h0;
    end
    if ((pixel_x>=440)&&(pixel_x<640)) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
    end
    end
    //RIGHT LANE
    if (state==2'b10) begin
    if (((pixel_x>=0)&&(pixel_x<200))) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
    end
    if ((pixel_x>=200)&&(pixel_x<220)) begin
      red   <= 4'hF;
      green <= 4'hF;
      blue  <= 4'h0;
    end
    if ((pixel_x>=220)&&(pixel_x<420)) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
    end
    if ((pixel_x>=420)&&(pixel_x<440)) begin
      red   <= 4'hF;
      green <= 4'hF;
      blue  <= 4'h0;
    end
    if ((pixel_x>=440)&&(pixel_x<640)) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
      if (((pixel_y>=280)&&(pixel_y<380))&&((pixel_x>=520)&&(pixel_x<560))) begin
        red   <= 4'h0;
      	green <= 4'h0;
      	blue  <= 4'hF;
      end
    end
    //MIDDLE LANE
    if (state==2'b00) begin
    if (((pixel_x>=0)&&(pixel_x<200))) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
    end
    if ((pixel_x>=200)&&(pixel_x<220)) begin
      red   <= 4'hF;
      green <= 4'hF;
      blue  <= 4'h0;
    end
    if ((pixel_x>=220)&&(pixel_x<420)) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
      
      if (((pixel_y>=280)&&(pixel_y<380))&&((pixel_x>=300)&&(pixel_x<340))) begin
        red   <= 4'h0;
      	green <= 4'h0;
      	blue  <= 4'hF;
      end
    end
    if ((pixel_x>=420)&&(pixel_x<440)) begin
      red   <= 4'hF;
      green <= 4'hF;
      blue  <= 4'h0;
    end
    if ((pixel_x>=440)&&(pixel_x<640)) begin
      red   <= 4'h8;
      green <= 4'h8;
      blue  <= 4'h8;
    end
    end
    end
      
  end
  */
  
endmodule