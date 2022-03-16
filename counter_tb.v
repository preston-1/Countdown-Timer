`timescale 1ns / 1ns
`include "counter.v"
`include "clock.v"

module counter_tb;
    reg clock;
    wire realClock;
    reg reset; 
    reg [8:0] inputValue;
    wire [8:0] current;
    
    integer i;

    clock CLK(realClock);
    counter UTT(clock, reset, inputValue, current);


    initial begin
        forever begin
            clock = realClock;
            #10;
            clock = realClock;
        end
    end
    
    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);

        reset = 1;
        inputValue = 8'b11111111;
        #10;
        reset = 0;
        #10;

        for (i = inputValue; i > 0; i = i- 1) begin
            #20;
            $display("current:", current);
        end
        $stop;
    end

endmodule