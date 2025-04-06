`timescale 1ns / 1ps

module JK_FF( 
    input CLK,   // ʱ���źţ���������Ч 
    input J,      
    input K,      
    input RST_n, // ��λ�źţ��͵�ƽ��Ч 
    output reg Q1, // ����ź�Q 
    output reg Q2  // ����ź�Q? 
);
    always @(posedge CLK or negedge RST_n) begin
        if (!RST_n) begin
            // �첽��λ
            Q1 <= 1'b0;
            Q2 <= 1'b1;
        end else begin
            case ({J, K})
                2'b00: begin
                    // ����״̬
                    Q1 <= Q1;
                    Q2 <= Q2;
                end
                2'b01: begin
                    Q1 <= 1'b0;
                    Q2 <= 1'b1;
                end
                2'b10: begin
                    Q1 <= 1'b1;
                    Q2 <= 1'b0;
                end
                2'b11: begin
                    // �л�״̬
                    Q1 <= ~Q1;
                    Q2 <= ~Q2;
                end
            endcase
        end
    end

endmodule
