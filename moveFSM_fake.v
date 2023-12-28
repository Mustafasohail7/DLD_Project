module moveFSM(
    input [1:0] dir,
    output reg [1:0] state
);
    
    reg [1:0] next;
    parameter LEFT = 4'b0100;
    parameter MIDDLE = 4'b0010;
    parameter RIGHT = 4'b1000;
    parameter START = 4'b0000;
      
  always @(dir) begin
    case (state)
        START:
            begin
                if (dir==4'b0010)
                    next = MIDDLE;
                else if (dir==4'b0100)
                    next = LEFT;
                else if (dir==4'b1000)
                    next = RIGHT;
           end
        MIDDLE:
            begin
                if (dir==4'b0100)
                    next = LEFT;
                else if (dir==4'b1000)
                    next = RIGHT;
            end
        LEFT:
            begin
                if (dir==4'b0100)
                    next = LEFT;
                else if (dir==4'b1000)
                    next = MIDDLE;
            end
        RIGHT:
            begin
                if (dir==4'b0100)
                    next = MIDDLE;
                else if (dir==4'b1000)
                    next = RIGHT;
            end
    endcase
    state = next;
    end
    
  
  
  endmodule