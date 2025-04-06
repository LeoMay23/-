`timescale 1ns / 1ps

module pcreg_tb;
    reg clk;
    reg rst;
    reg ena;
    reg [31:0] data_in;
    wire [31:0] data_out;

    // 实例化PC寄存器
    pcreg uut (
        .clk(clk),
        .rst(rst),
        .ena(ena),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        // 初始化信号
        clk = 0;
        rst = 0;
        ena = 0;
        data_in = 32'hAABBCCDD;

        // 复位信号
        rst = 1; #5;
        rst = 0; #5;

        // 使能信号，更新数据
        ena = 1;
        #10;
        ena = 0; // 禁止更新

        // 更改输入数据
        data_in = 32'h11223344; 
        #10; // 在没有使能的情况下，输出应该保持不变

        // 使能信号，更新数据
        ena = 1; 
        #10;

    end

    // 生成时钟信号
    always #5 clk = ~clk;

endmodule
