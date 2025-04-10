`timescale 1ns / 1ps
module display7(
input [3:0]iData,
output reg [6:0]oData
);
always @(*) begin
        case(iData)
            4'b0000: oData = 7'b1000000; // 0
            4'b0001: oData = 7'b1111001; // 1
            4'b0010: oData = 7'b0100100; // 2
            4'b0011: oData = 7'b0110000; // 3
            4'b0100: oData = 7'b0011001; // 4
            4'b0101: oData = 7'b0010010; // 5
            4'b0110: oData = 7'b0000010; // 6
            4'b0111: oData = 7'b1111000; // 7
            4'b1000: oData = 7'b0000000; // 8
            4'b1001: oData = 7'b0010000; // 9
            default: oData = 7'b1111111; // 默认情况，所有段熄灭
        endcase
    end
endmodule
