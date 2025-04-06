`timescale 1ns / 1ps

module ram_tb;

    // 测试信号
    reg clk;                    // 时钟信号
    reg ena;                    // 存储器有效信号
    reg wena;                   // 读写有效信号
    reg [4:0] addr;             // 地址信号
    reg [31:0] data_in;         // 写入数据
    wire [31:0] data_out;       // 读出数据

    // RAM 实例化
    ram uut (
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns 时钟周期
    end

    // 初始化测试
    initial begin
        // 初始化信号
        ena = 0;
        wena = 0;
        addr = 0;
        data_in = 0;

        // 等待一段时间后开始测试
        #20;
        
        
        // 写操作测试
        ena = 1;
        wena = 1;
        addr = 5'b00001; data_in = 32'hA5A5A5A5; // 写入地址 1
        #10; // 等待一个时钟周期

        addr = 5'b00010; data_in = 32'h5A5A5A5A; // 写入地址 2
        #10; // 等待一个时钟周期

        addr = 5'b00011; data_in = 32'h12345678; // 写入地址 3
        #10; // 等待一个时钟周期

        // 读操作测试
        wena = 0; // 进入读模式
        addr = 5'b00001; // 读取地址 1
        #10; // 等待一个时钟周期

        addr = 5'b00010; // 读取地址 2
        #10; // 等待一个时钟周期

        addr = 5'b00011; // 读取地址 3
        #10; // 等待一个时钟周期

        // 测试无效状态
        ena = 0; // 禁用存储器
        addr = 5'b00001;
        
        #40
        ena=1;
        wena=1;
        data_in=32'h77777777;
        addr=5'b00000;
        
        #40;
        ena=1;
        wena=0;
        addr=5'b00000;
        data_in=32'h77777777;
    end

endmodule
