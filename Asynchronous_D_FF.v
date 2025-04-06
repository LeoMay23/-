`timescale 1ns / 1ps
module Asynchronous_D_FF( 
    input CLK,    
    input D,      
    input RST_n,     
    output reg Q1,   
    output reg Q2   
); 
always @(posedge CLK or negedge RST_n) begin
    if (!RST_n) begin
        Q1 <= 1'b0; // ��λʱQ1���0
        Q2 <= 1'b1; // ��λʱQ2���1��Q�ķǣ�
    end else begin
        Q1 <= D;    // �Ǹ�λʱ��Q1��ʱ�������ز�������D��ֵ
        Q2 <= ~D;   // Q2��Q1�ķǣ�������ʱ�������ز���D�ķ�ֵ
    end
end

endmodule