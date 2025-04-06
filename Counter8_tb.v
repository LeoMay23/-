`timescale 1ns / 1ps

module Counter8_tb;

    // �����ź�
    reg CLK;
    reg rst_n;
    wire [2:0] oQ;
    wire [6:0] oDisplay;

    // ʵ���������Ե�Counter8ģ��
    Counter8 uut (
        .CLK(CLK),
        .rst_n(rst_n),
        .oQ(oQ),
        .oDisplay(oDisplay)
    );

    // ʱ������
    initial begin
        CLK = 0;
        forever #20
        CLK = ~CLK; // 10ns���ڵ�ʱ��
    end

    // ���Թ���
    initial begin
        rst_n = 0; // ��λ
        #10;
        rst_n = 1; // �����λ
    end
endmodule
