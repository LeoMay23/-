`timescale 1ns / 1ps
module FA(
     input iA, //1 λ�����Ƽ���
     input iB, //1 λ�����Ʊ�����
     input iC, //��λ�Ľ�λ�ź�
     output oS, //1 λ����
     output oC //���λ�Ľ�λ�ź�
);
    assign oS = iA ^ iB ^ iC;
    assign oC = (iA & iB) | ((iA ^ iB) & iC);
endmodule
