`timescale 1ns / 1ps

module tb_Divider;

    // Testbench信号声明
    reg I_CLK;      // 输入时钟
    reg rst;         // 同步复位信号
    wire O_CLK;      // 输出时钟

    // Divider模块实例化
    Divider uut (
        .I_CLK(I_CLK),
        .rst(rst),
        .O_CLK(O_CLK)
    );

    // 时钟生成过程
    always begin
        #5 I_CLK = ~I_CLK; // 100 MHz 时钟，周期 10ns
    end

    // 测试过程
    initial begin
        // 初始化信号
        I_CLK = 0;
        rst = 0;

        // 复位操作
        rst = 1;        // 激活复位
        #10;            // 保持复位 10ns
        rst = 0;        // 解除复位

        // 运行一段时间，观察 O_CLK 输出
        #2000;          // 运行 2000ns 后观察 O_CLK 的波形

    end

endmodule
