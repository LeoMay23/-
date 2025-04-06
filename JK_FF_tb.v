`timescale 1ns / 1ps

module JK_FF_tb;
    reg CLK;
    reg J;
    reg K;
    reg RST_n;
    wire Q1;
    wire Q2;
    // 实例化 JK_FF 模块
    JK_FF uut (
        .CLK(CLK),
        .J(J),
        .K(K),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );

    // 时钟生成
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 每5ns翻转一次
    end

    // 测试过程
    initial begin
        // 初始化输入信号
        J = 0;
        K = 0;
        RST_n = 0; // 复位触发器
        #10;
        // 解除复位
        RST_n = 1;
        #10;
        // 测试不同的 J 和 K 输入组合
        // J=0, K=0 (保持状态)
        J = 0; K = 0;
        #10;
        // J=0, K=1 (复位)
        J = 0; K = 1;
        #10;
        // J=1, K=0 (设置)
        J = 1; K = 0;
        #10;
        // J=1, K=1 (切换状态)
        J = 1; K = 1;
        #10;
        // J=0, K=0 (保持状态)
        J = 0; K = 0;
        #10;
    end
endmodule
