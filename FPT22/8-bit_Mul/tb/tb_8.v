`timescale 1ns / 1ps


module TB8(

    );
    wire [15:0]r;
    reg [7:0]A;
    reg [7:0]B;
    integer i;
    integer j;
    reg [15:0]ErrorCounter = 0;
    reg [31:0]ErrorDistance = 0;
    reg [31:0]MaxError = 0;
    reg [63:0]RED = 0;
    initial 
    begin
     for (i = 1;i < 256;i = i + 1)
      begin
       for (j = 1;j < 256;j = j + 1)
        begin
         A = i;
         B = j;
         #0.001
          if (r < i * j)
          begin
           ErrorCounter =  ErrorCounter + 1'b1; 
           ErrorDistance = ErrorDistance + (i * j - r);
           if ((i * j - r) > MaxError)//MaxError
            begin
             MaxError = (i * j - r);
            end
            RED = RED +((i * j - r)*10000)/(i*j);   
          end
          else if(r > i * j)
          begin
           ErrorCounter = ErrorCounter + 1'b1; 
           ErrorDistance = ErrorDistance + (r - i * j);
           if ((r - i * j) > MaxError)
            begin
                MaxError = (r - i * j);
            end
            RED = RED +((r - i * j)*10000)/(i*j);
          end
        end
      end
      
      $display("%d",RED);  // Due to verilog cannot display decimals, the real result of RED is calcuated as RED/10000.
      $display("%d",ErrorDistance);

      //MRED = RED / 65536
      //MED = ED / 65536

    end
    mult_8x8_2233 M1(.A(A),.B(B),.R(r));
endmodule
