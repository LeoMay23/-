`timescale 1ns / 1ps

module DataCompare4_tb;
    reg [3:0] iData_a;
    reg [3:0] iData_b;
    reg [2:0] iData;
    wire [2:0] oData;
    // ʵ����������ģ��
DataCompare4 uut (
    .iData_a(iData_a),
    .iData_b(iData_b),
    .iData(iData),
    .oData(oData)
    );

initial begin
        // ��ʼ������
        iData_a = 4'b0000;
        iData_b = 4'b0000;
        iData = 3'b000;
        #40;
        // ���� A > B �����
        iData_a = 4'b1010;
        iData_b = 4'b0101;
        #40;
        // ���� A < B �����
        iData_a = 4'b0101;
        iData_b = 4'b1010;
        #40;
        // ���� A = B �����
        iData_a = 4'b1100;
        iData_b = 4'b1100;
        iData = 3'b100;
        #40;
        // ���� A = B �����
        iData_a = 4'b1001;
        iData_b = 4'b1001;
        iData = 3'b010;
        #40;
        // ���� A = B �����
        iData_a = 4'b1101;
        iData_b = 4'b1101;
        iData = 3'b001;
    end
endmodule