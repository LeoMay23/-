`timescale 1ns / 1ps

module Regfiles_tb;
    // 测试信号声明
    reg clk;
    reg rst;
    reg we;
    reg [4:0] raddr1, raddr2, waddr;
    reg [31:0] wdata;
    wire [31:0] rdata1, rdata2;

    // 实例化待测模块
    Regfiles uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .raddr1(raddr1),
        .raddr2(raddr2),
        .waddr(waddr),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    // 时钟信号产生
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; // 时钟周期为10ns
    end

    // 测试向量
    initial begin
        // 初始化信号
        rst = 1'b1;
        we = 1'b0;
        raddr1 = 5'b0;
        raddr2 = 5'b0;
        waddr = 5'b0;
        wdata = 32'b0;

        // 等待复位解除
        #10;
        rst = 1'b0;

        // 测试写操作
        #10;
        we = 1'b1; waddr = 5'd1; wdata = 32'hA5A5A5A5; // 写入寄存器1
        #10;
        we = 1'b1; waddr = 5'd2; wdata = 32'h5A5A5A5A; // 写入寄存器2
        #10;
        we = 1'b0; // 停止写入

        // 测试读操作
        #10;
        raddr1 = 5'd1; raddr2 = 5'd2; // 读取寄存器1和寄存器2
        #10;

        // 测试复位
        #10;
        rst = 1'b1; // 激活复位信号
        #10;
        rst = 1'b0; // 解除复位信号

        // 再次读取寄存器，检查是否已被清零
        #10;
        raddr1 = 5'd1; raddr2 = 5'd2;
        #10;

        // 测试无效写入（使能信号无效时写入）
        #10;
        we = 1'b0; waddr = 5'd3; wdata = 32'hFFFFFFFF; // 此时写入应无效
        #10;

        // 检查写入是否生效
        #10;
        raddr1 = 5'd3; // 读取寄存器3，预期值为默认值（0）
    end
endmodule
