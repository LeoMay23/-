`timescale 1ns / 1ps
module Synchronous_D_FF( 
input CLK,    //ʱ���źţ���������Ч
input D,      //�����ź�D 
input RST_n,  //��λ�źţ��͵�ƽ��Ч 
output reg Q1, //����ź�Q 
output reg Q2  //����ź�
); 
always @(posedge CLK) begin
    if (!RST_n) begin
        Q1 <= 1'b0; // ��λʱQ1���0
        Q2 <= 1'b1; // ��λʱQ2���1��Q�ķǣ�
    end else begin
        Q1 <= D;    // �Ǹ�λʱ��Q1��ʱ�������ز�������D��ֵ
        Q2 <= ~D;   // Q2��Q1�ķǣ�������ʱ�������ز���D�ķ�ֵ
    end
end
endmodule
