`timescale 1ns / 1ns
`include "clock.v"

module clock_tb;

    wire clock;
    
    clock UTT(clock);
    initial begin
        $dumpfile("clock_tb.vcd");
        $dumpvars(0, clock_tb);

        

        forever begin
            $display("clock: %b", clock);
            #10;
        end
    end
endmodule