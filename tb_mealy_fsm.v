`timescale 1ns / 1ps
module tb_mealy_fsm( );
    reg clk, arstn,in;
    wire out;
    
    mealy_fsm fsm(.clk(clk), .arstn(arstn), .out(out),.in(in));
    
    always #2 clk=~clk;
    
    initial
    begin
    clk=0;
    arstn=0;
    in=0;
    #10;
    
    arstn=1;
    in=1;#3
    in=0;#1
    in=1;#1
    in=0;#3
    in=0;#3
    in=1;#1
    in=1;#1
    in=0;#3
    in=1;#1
    in=0;#1
    in=1;#3
    in=1;#5
    in=0;#3
    in=1;#3
    in=0;#1
    in=0;#3
    in=1;#3
    in=0;#1
    
   
        
    #50;
    $finish;
    end

endmodule
