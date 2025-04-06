`timescale 1ns / 1ps

module pcreg_tb;
    reg clk;
    reg rst;
    reg ena;
    reg [31:0] data_in;
    wire [31:0] data_out;

    // ʵ����PC�Ĵ���
    pcreg uut (
        .clk(clk),
        .rst(rst),
        .ena(ena),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        // ��ʼ���ź�
        clk = 0;
        rst = 0;
        ena = 0;
        data_in = 32'hAABBCCDD;

        // ��λ�ź�
        rst = 1; #5;
        rst = 0; #5;

        // ʹ���źţ���������
        ena = 1;
        #10;
        ena = 0; // ��ֹ����

        // ������������
        data_in = 32'h11223344; 
        #10; // ��û��ʹ�ܵ�����£����Ӧ�ñ��ֲ���

        // ʹ���źţ���������
        ena = 1; 
        #10;

    end

    // ����ʱ���ź�
    always #5 clk = ~clk;

endmodule
