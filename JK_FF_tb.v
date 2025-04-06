`timescale 1ns / 1ps

module JK_FF_tb;
    reg CLK;
    reg J;
    reg K;
    reg RST_n;
    wire Q1;
    wire Q2;
    // ʵ���� JK_FF ģ��
    JK_FF uut (
        .CLK(CLK),
        .J(J),
        .K(K),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );

    // ʱ������
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // ÿ5ns��תһ��
    end

    // ���Թ���
    initial begin
        // ��ʼ�������ź�
        J = 0;
        K = 0;
        RST_n = 0; // ��λ������
        #10;
        // �����λ
        RST_n = 1;
        #10;
        // ���Բ�ͬ�� J �� K �������
        // J=0, K=0 (����״̬)
        J = 0; K = 0;
        #10;
        // J=0, K=1 (��λ)
        J = 0; K = 1;
        #10;
        // J=1, K=0 (����)
        J = 1; K = 0;
        #10;
        // J=1, K=1 (�л�״̬)
        J = 1; K = 1;
        #10;
        // J=0, K=0 (����״̬)
        J = 0; K = 0;
        #10;
    end
endmodule
