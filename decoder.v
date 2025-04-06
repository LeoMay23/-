module Decoder(
    input [4:0] addr,      // 5λ�����ַ
    input en,              // ʹ���ź�
    output [31:0] sel      // 32λѡ���ź�
);
     assign sel = (en ? (1 << addr) : 32'b0); // ����ַ����Ϊ��Ӧ��ѡ���ź�
endmodule

