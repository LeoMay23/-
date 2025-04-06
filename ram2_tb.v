`timescale 1ns / 1ps

module ram2_tb;
    reg clk;
    reg ena;
    reg wena;
    reg [4:0] addr;
    reg [31:0] data_in;  // ������������
    wire [31:0] data;    // ���ӵ� RAM ��������

    // ʵ���� RAM ģ��
    ram2 uut (
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data(data)
    );

    always #5 clk = ~clk;

    // �� data_in ������ data �ź�
    assign data = (ena && wena) ? data_in : 32'bz;

    initial begin
        // ��ʼ���ź�
        clk = 0;
        ena = 0;
        wena = 0;
        addr = 5'b0;
        data_in = 32'b0;

        // ��ʼ����Ϻ�ִ�в���
        #10;
        ena = 1;  // ���ô洢��

        // д�������� 0x12345678 д���ַ 0x00
        addr = 5'b00000;   // ��ַ 0x00
        data_in = 32'h12345678;  // д������ 0x12345678
        wena = 1;          // ����д����
        #10;
        wena = 0;          // ����д����

        // ���������ӵ�ַ 0x00 ��ȡ����
        #10;
        addr = 5'b00000;   // ��ַ 0x00
        ena = 1;           // ���ô洢��
        wena = 0;          // ����������
        #10;

        // д�������� 0xA5A5A5A5 д���ַ 0x01
        #10;
        addr = 5'b00001;   // ��ַ 0x01
        data_in = 32'hA5A5A5A5;  // д������ 0xA5A5A5A5
        wena = 1;          // ����д����
        #10;
        wena = 0;          // ����д����

        // ���������ӵ�ַ 0x01 ��ȡ����
        #10;
        addr = 5'b00001;   // ��ַ 0x01
        ena = 1;           // ���ô洢��
        wena = 0;          // ����������
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

