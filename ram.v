module ram(
    input clk,              // ʱ���ź�
    input rst,              // �첽��λ�ź�
    input en,               // ʹ���ź�
    input [31:0] in,      // ��������
    output reg [31:0] out // �������
);
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            out <= 32'b0; // �첽��λ
        end else if (en) begin
            out <= in;  // д������ʹ�ܺ�дʹ�ܾ���Чʱִ��
        end
    end
endmodule
