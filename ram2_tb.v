`timescale 1ns / 1ps

module ram2_tb;
    reg clk;
    reg ena;
    reg wena;
    reg [4:0] addr;
    reg [31:0] data_in;  // 用于输入数据
    wire [31:0] data;    // 连接到 RAM 的数据线

    // 实例化 RAM 模块
    ram2 uut (
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data(data)
    );

    always #5 clk = ~clk;

    // 将 data_in 驱动到 data 信号
    assign data = (ena && wena) ? data_in : 32'bz;

    initial begin
        // 初始化信号
        clk = 0;
        ena = 0;
        wena = 0;
        addr = 5'b0;
        data_in = 32'b0;

        // 初始化完毕后，执行测试
        #10;
        ena = 1;  // 启用存储器

        // 写操作：将 0x12345678 写入地址 0x00
        addr = 5'b00000;   // 地址 0x00
        data_in = 32'h12345678;  // 写入数据 0x12345678
        wena = 1;          // 启动写操作
        #10;
        wena = 0;          // 结束写操作

        // 读操作：从地址 0x00 读取数据
        #10;
        addr = 5'b00000;   // 地址 0x00
        ena = 1;           // 启用存储器
        wena = 0;          // 启动读操作
        #10;

        // 写操作：将 0xA5A5A5A5 写入地址 0x01
        #10;
        addr = 5'b00001;   // 地址 0x01
        data_in = 32'hA5A5A5A5;  // 写入数据 0xA5A5A5A5
        wena = 1;          // 启动写操作
        #10;
        wena = 0;          // 结束写操作

        // 读操作：从地址 0x01 读取数据
        #10;
        addr = 5'b00001;   // 地址 0x01
        ena = 1;           // 启用存储器
        wena = 0;          // 启动读操作
        #10;
        ena=1;
        wena=1;
        addr=5'h1b; 
        data_in=32'h77777777;
        #40
        ena=1;
        wena=0;
        addr=5'h1b; 
        data_in=32'h77777777;        
    end
endmodule

