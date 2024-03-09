`timescale 1ns / 1ps
module mealy_fsm #(parameter s0=2'b00, s1=2'b01, s2= 2'b10)(
    input clk, arstn,in,
    output reg out
    );
    reg [1:0]current_state, next_state;
    
    //state transition 
    always @(posedge clk, negedge arstn)
    begin
        if(~arstn)begin
            current_state <= s0;
            out<=1'b0;end
         else current_state <= next_state;   
    end
    
    //next state logic
    always @(*)
    begin
        case(current_state)
        s0: if(in==1)
                next_state =s1;
                else next_state = s0;
         
        s1: if(in==0)
                next_state = s2;
                else next_state = s1;
         
        s2:if(in==1)begin
                next_state = s0;
                out<=1'b1;
                end else next_state=s0;
         default: next_state=s0;       
                
       endcase       
    end
    
    //output logic
    always@(*)
    begin
        case(current_state)
            s0: out =1'b0;
            s1: out= 1'b0;
            s2: if(in==1)
                    out=1'b1;
            default: out=1'hz;        
        endcase
    end
    
endmodule
