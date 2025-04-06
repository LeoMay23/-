`timescale 1ns / 1ps

module alu_tb;
    
    // �����ź�
    reg [31:0] a, b;
    reg [3:0] aluc;
    
    // ����ź�
    wire [31:0] r;
    wire zero;
    wire carry;
    wire negative;
    wire overflow;
    
    // ʵ���� ALU ģ��
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
    
    // ��ʼ����в���
    initial begin
        // ��ʼ������
        a = 32'h00000000;  // a = 0
        b = 32'h00000000;  // b = 0
        
        #40;
        aluc=4'b1110;
        a=32'h00000000;
        b=32'h00000000;
        // ��������
        
        #40;
        aluc = 4'b0000;  // Addu
        a = 32'h00000010;  // a = 16
        b = 32'h00000020;  // b = 32

        #40;
        aluc = 4'b0010;  // Add (�з��żӷ�)
        a = 32'h7FFFFFFF;  // a = ����з�����
        b = 32'h00000001;  // b = 1
        
        #40;
        aluc = 4'b0001;  // Subu (�޷��ż���)
        a = 32'h00000020;  // a = 32
        b = 32'h00000010;  // b = 16
        
        #40;
        aluc = 4'b0011;  // Sub (�з��ż���)
        a = 32'h80000000;  // a = ��С�з�����
        b = 32'h00000001;  // b = 1
        
        #40;
        aluc = 4'b0100;  // And
        a = 32'hFFFFFFFF;  // a = ȫ1
        b = 32'h0000FFFF;  // b = ��16λΪ1

        #40;
        aluc = 4'b0101;  // Or
        a = 32'h00000000;  // a = ȫ0
        b = 32'hFFFFFFFF;  // b = ȫ1

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
        a = 32'h12345678;  // a = ����ֵ
        b = 32'h000000AB;  // b = ��������16λ

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
        a = 5;  // ��λֵ
        b = 32'h80000000;  // ��������
        
        #40;
        aluc = 4'b1110;  // Sll/Sla
        a = 3;  // ��λֵ
        b = 32'h00000001;  // С��ֵ
        
        #40;
        aluc = 4'b1101;  // Srl
        a = 3;  // ��λֵ
        b = 32'hF0F0F0F0;  // ����ֵ
        
        #40;
        
    end
    
endmodule
