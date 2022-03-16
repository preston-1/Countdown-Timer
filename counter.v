module counter (clock, reset, inputValue, current);
    input clock, reset;
    input [8:0] inputValue;
    output [8:0] current;

    reg [8:0] current;
    reg [8:0] reg_inputValue;
    always @(posedge clock) begin
        if(reset)begin
            current <= 0;
            reg_inputValue <= 0;
        end
        else begin
            if(reg_inputValue == 0)begin
                reg_inputValue <= inputValue; 
            end
            else begin
                if (reg_inputValue != 8'b00000000) begin
                    current = reg_inputValue - 1;
                    reg_inputValue = reg_inputValue - 1;
                end
            end
        end
    end
endmodule