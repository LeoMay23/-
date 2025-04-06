`timescale 1ns / 1ps

module Adder_tb;
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    reg iC;
    wire [7:0] oData;
    wire oData_C;
    
    Adder uut (
        .iData_a(iData_a),
        .iData_b(iData_b),
        .iC(iC),
        .oData(oData),
        .oData_C(oData_C)
    );
    initial begin
        // 测试用例1：全0加全0
        iData_a = 8'b00000000;
        iData_b = 8'b00000000;
        iC = 1'b0;
        #30;
        // 测试用例2：全1加全1
        iData_a = 8'b11111111;
        iData_b = 8'b11111111;
        iC = 1'b0;
        #30;
        // 测试用例3：最大值加1
        iData_a = 8'b11111111;
        iData_b = 8'b00000001;
        iC = 1'b0;
        #30;
        // 测试用例4：随机值相加
        iData_a = 8'b10101010;
        iData_b = 8'b01010101;
        iC = 1'b0;
        #30;
        // 测试用例5：进位测试
        iData_a = 8'b01111111;
        iData_b = 8'b01111111;
        iC = 1'b1;
        #30;
    end
endmodule