`timescale 1ns / 1ps

module alu_tb;
    
    // 输入信号
    reg [31:0] a, b;
    reg [3:0] aluc;
    
    // 输出信号
    wire [31:0] r;
    wire zero;
    wire carry;
    wire negative;
    wire overflow;
    
    // 实例化 ALU 模块
    alu uut (
        .a(a),
        .b(b),
        .aluc(aluc),
        .r(r),
        .zero(zero),
        .carry(carry),
        .negative(negative),
        .overflow(overflow)
    );
    
    // 初始块进行测试
    initial begin
        // 初始化输入
        a = 32'h00000000;  // a = 0
        b = 32'h00000000;  // b = 0
        
        #40;
        aluc=4'b1110;
        a=32'h00000000;
        b=32'h00000000;
        // 测试用例
        
        #40;
        aluc = 4'b0000;  // Addu
        a = 32'h00000010;  // a = 16
        b = 32'h00000020;  // b = 32

        #40;
        aluc = 4'b0010;  // Add (有符号加法)
        a = 32'h7FFFFFFF;  // a = 最大有符号数
        b = 32'h00000001;  // b = 1
        
        #40;
        aluc = 4'b0001;  // Subu (无符号减法)
        a = 32'h00000020;  // a = 32
        b = 32'h00000010;  // b = 16
        
        #40;
        aluc = 4'b0011;  // Sub (有符号减法)
        a = 32'h80000000;  // a = 最小有符号数
        b = 32'h00000001;  // b = 1
        
        #40;
        aluc = 4'b0100;  // And
        a = 32'hFFFFFFFF;  // a = 全1
        b = 32'h0000FFFF;  // b = 低16位为1

        #40;
        aluc = 4'b0101;  // Or
        a = 32'h00000000;  // a = 全0
        b = 32'hFFFFFFFF;  // b = 全1

        #40;
        aluc = 4'b0110;  // Xor
        a = 32'hAAAAAAAA;  // a = 101010...
        b = 32'h55555555;  // b = 010101...

        #40;
        aluc = 4'b0111;  // Nor
        a = 32'hF0F0F0F0;  // a = F0F0F0F0
        b = 32'h0F0F0F0F;  // b = 0F0F0F0F
        
        #40;
        aluc = 4'b1000;  // Lui
        a = 32'h12345678;  // a = 任意值
        b = 32'h000000AB;  // b = 立即数低16位

        #40;
        aluc = 4'b1011;  // Slt
        a = 32'h00000010;  // a = 16
        b = 32'h00000020;  // b = 32

        #40;
        aluc = 4'b1010;  // Sltu
        a = 32'h00000010;  // a = 16
        b = 32'h00000020;  // b = 32

        #40;
        aluc = 4'b1100;  // Sra
        a = 5;  // 移位值
        b = 32'h80000000;  // 负数测试
        
        #40;
        aluc = 4'b1110;  // Sll/Sla
        a = 3;  // 移位值
        b = 32'h00000001;  // 小数值
        
        #40;
        aluc = 4'b1101;  // Srl
        a = 3;  // 移位值
        b = 32'hF0F0F0F0;  // 测试值
        
        #40;
        
    end
    
endmodule
