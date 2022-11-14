`timescale 1ns / 1ps


module tb_4(

    );
    wire [7:0]r;
    reg [3:0]A;
    reg [3:0]B;
    integer i;
    integer j;
    reg [7:0]ErrorCounter = 0;
    reg [15:0]ErrorDistance = 0;
    reg [15:0]MaxError = 0;
    reg [31:0]RED = 0;
    initial 
    begin
     for (i = 1;i < 16;i = i + 1)
      begin
       for (j = 1;j < 16;j = j + 1)
        begin
         A = i;
         B = j;
         #1
         if (r < i * j)
          begin
          $display ("A = %d,B = %d,r = %d,i*j = %d,ED = %d",i,j,r,i*j,i*j-r);
           ErrorCounter =  ErrorCounter + 1'b1; //Error Occurrences
           ErrorDistance = ErrorDistance + (i * j - r);//Error Distance
           if ((i * j - r) > MaxError)//MaxError
            begin
             MaxError = (i * j - r);
            end
            RED = RED +((i * j - r)*10000)/(i*j);
          end
          
          else if(r > i * j)
          begin
          $display ("A = %d,B = %d,r = %d,i*j = %d,ED = %d***",i,j,r,i*j,r-i*j);
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
    end
  LM_1 M0(.a(A),.b(B),.prod(r));
  
endmodule
