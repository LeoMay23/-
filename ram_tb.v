`timescale 1ns / 1ps

module ram_tb;

    // �����ź�
    reg clk;                    // ʱ���ź�
    reg ena;                    // �洢����Ч�ź�
    reg wena;                   // ��д��Ч�ź�
    reg [4:0] addr;             // ��ַ�ź�
    reg [31:0] data_in;         // д������
    wire [31:0] data_out;       // ��������

    // RAM ʵ����
    ram uut (
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // ʱ������
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns ʱ������
    end

    // ��ʼ������
    initial begin
        // ��ʼ���ź�
        ena = 0;
        wena = 0;
        addr = 0;
        data_in = 0;

        // �ȴ�һ��ʱ���ʼ����
        #20;
        
        
        // д��������
        ena = 1;
        wena = 1;
        addr = 5'b00001; data_in = 32'hA5A5A5A5; // д���ַ 1
        #10; // �ȴ�һ��ʱ������

        addr = 5'b00010; data_in = 32'h5A5A5A5A; // д���ַ 2
        #10; // �ȴ�һ��ʱ������

        addr = 5'b00011; data_in = 32'h12345678; // д���ַ 3
        #10; // �ȴ�һ��ʱ������

        // ����������
        wena = 0; // �����ģʽ
        addr = 5'b00001; // ��ȡ��ַ 1
        #10; // �ȴ�һ��ʱ������

        addr = 5'b00010; // ��ȡ��ַ 2
        #10; // �ȴ�һ��ʱ������

        addr = 5'b00011; // ��ȡ��ַ 3
        #10; // �ȴ�һ��ʱ������

        // ������Ч״̬
        ena = 0; // ���ô洢��
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
