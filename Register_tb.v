`timescale 1ns / 1ps

module Regfiles_tb;
    // �����ź�����
    reg clk;
    reg rst;
    reg we;
    reg [4:0] raddr1, raddr2, waddr;
    reg [31:0] wdata;
    wire [31:0] rdata1, rdata2;

    // ʵ��������ģ��
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

    // ʱ���źŲ���
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; // ʱ������Ϊ10ns
    end

    // ��������
    initial begin
        // ��ʼ���ź�
        rst = 1'b1;
        we = 1'b0;
        raddr1 = 5'b0;
        raddr2 = 5'b0;
        waddr = 5'b0;
        wdata = 32'b0;

        // �ȴ���λ���
        #10;
        rst = 1'b0;

        // ����д����
        #10;
        we = 1'b1; waddr = 5'd1; wdata = 32'hA5A5A5A5; // д��Ĵ���1
        #10;
        we = 1'b1; waddr = 5'd2; wdata = 32'h5A5A5A5A; // д��Ĵ���2
        #10;
        we = 1'b0; // ֹͣд��

        // ���Զ�����
        #10;
        raddr1 = 5'd1; raddr2 = 5'd2; // ��ȡ�Ĵ���1�ͼĴ���2
        #10;

        // ���Ը�λ
        #10;
        rst = 1'b1; // ���λ�ź�
        #10;
        rst = 1'b0; // �����λ�ź�

        // �ٴζ�ȡ�Ĵ���������Ƿ��ѱ�����
        #10;
        raddr1 = 5'd1; raddr2 = 5'd2;
        #10;

        // ������Чд�루ʹ���ź���Чʱд�룩
        #10;
        we = 1'b0; waddr = 5'd3; wdata = 32'hFFFFFFFF; // ��ʱд��Ӧ��Ч
        #10;

        // ���д���Ƿ���Ч
        #10;
        raddr1 = 5'd3; // ��ȡ�Ĵ���3��Ԥ��ֵΪĬ��ֵ��0��
    end
endmodule
