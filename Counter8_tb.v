`timescale 1ns / 1ps

module Counter8_tb;

    // 测试信号
    reg CLK;
    reg rst_n;
    wire [2:0] oQ;
    wire [6:0] oDisplay;

    // 实例化被测试的Counter8模块
    Counter8 uut (
        .CLK(CLK),
        .rst_n(rst_n),
        .oQ(oQ),
        .oDisplay(oDisplay)
    );

    // 时钟生成
    initial begin
        CLK = 0;
        forever #20
        CLK = ~CLK; // 10ns周期的时钟
    end

    // 测试过程
    initial begin
        rst_n = 0; // 复位
        #10;
        rst_n = 1; // 解除复位
    end
endmodule
