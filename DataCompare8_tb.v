`timescale 1ns / 1ps
module DataCompare8_tb;
    // �����ź�
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    // ����ź�
    wire [2:0] oData;

    // ʵ����������ģ��
    DataCompare8 uut (
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData)
    );

    initial begin
        // ��ʼ������
        iData_a = 0;
        iData_b = 0;

        // ��������
        #10 iData_a = 8'b00000000; iData_b = 8'b00000000; // ���
        #10 iData_a = 8'b00000001; iData_b = 8'b00000000; // a > b
        #10 iData_a = 8'b00000000; iData_b = 8'b00000001; // a < b
        #10 iData_a = 8'b11110000; iData_b = 8'b11110001; // a < b
        #10 iData_a = 8'b11110000; iData_b = 8'b11110000; // ���
        #10 iData_a = 8'b11110001; iData_b = 8'b11110000; // a > b
        #10 iData_a = 8'b11010001; iData_b = 8'b11110000; // a < b
    end
endmodule
