module moveFSMchakera(
  input clk,
  //reset;
  input left,
  input right,
  input middle,
  output reg [9:0] object_x = 300,
  output reg [9:0] obstacle_y = 0,
  output reg checkerOBS = 0
  );
  
  reg [24:0] mover = 25'b0;
  
    always @ (clk) begin
    if (left==1)
        object_x = 80;
    else if (right==1)
        object_x = 520;
    else if (middle==1)
        object_x = 300;
    end
    
    
    always @ (clk) begin
    mover <= mover + 1;
    if (mover==1) begin
        checkerOBS = 0;
        end
    if (mover>24999999) begin
        checkerOBS = 1;
        //obstacle_y <= obstacle_y + 20;
        mover <= 0;
        end
        end
        
/*  always @ (clk)
    begin
    counter <= counter + 1;
    if (counter >= 4999999)
      begin
        case (state)
        LEFT:
        begin
          if (c_state == LEFT) begin
            object_x <= 80;
            next <= LEFT;
          end
          else if (c_state == RIGHT) begin
            object_x <= 300;
            next <= MIDDLE;
          end
        end
        MIDDLE:
        begin
          if (c_state == LEFT) begin
            object_x <= 80;
            next <= LEFT;
          end
          else if (c_state == RIGHT) begin
            object_x <= 520;
            next <= RIGHT;
          end
        end
        RIGHT:
        begin
          if (c_state == LEFT) begin
            object_x <= 300;
            next <= MIDDLE;
          end
          else if (c_state == RIGHT) begin
            object_x <= 520;
            next <= RIGHT;
          end
        end
        endcase
          c_state <= next;
      end
    end*/
endmodule
