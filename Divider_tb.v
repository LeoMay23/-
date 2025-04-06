`timescale 1ns / 1ps

module tb_Divider;

    // Testbench�ź�����
    reg I_CLK;      // ����ʱ��
    reg rst;         // ͬ����λ�ź�
    wire O_CLK;      // ���ʱ��

    // Dividerģ��ʵ����
    Divider uut (
        .I_CLK(I_CLK),
        .rst(rst),
        .O_CLK(O_CLK)
    );

    // ʱ�����ɹ���
    always begin
        #5 I_CLK = ~I_CLK; // 100 MHz ʱ�ӣ����� 10ns
    end

    // ���Թ���
    initial begin
        // ��ʼ���ź�
        I_CLK = 0;
        rst = 0;

        // ��λ����
        rst = 1;        // ���λ
        #10;            // ���ָ�λ 10ns
        rst = 0;        // �����λ

        // ����һ��ʱ�䣬�۲� O_CLK ���
        #2000;          // ���� 2000ns ��۲� O_CLK �Ĳ���

    end

endmodule
