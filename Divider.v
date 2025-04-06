module Divider ( 
input I_CLK,  //����ʱ���źţ���������Ч 
input rst,    //ͬ����λ�źţ��ߵ�ƽ��Ч 
output O_CLK  //���ʱ�� 
);
    parameter DIVISOR = 10000000; // Ĭ�Ϸ�Ƶ����Ϊ20
    reg [26:0] counter=0; // �����������ڼ�����DIVISOR
    reg tO_CLK = 0;           
    // ��λ�ͷ�Ƶ�߼�
    always @(posedge I_CLK) begin
            if (rst) begin
                tO_CLK <= 0;   // ��λ���ʱ��
            end else begin
            if (counter == DIVISOR) begin
                tO_CLK <= ~tO_CLK; // ��ת���ʱ��
                counter <= 0;     // ���ü�����
            end else 
                counter <= counter + 1; // ����
        end
    end
    assign O_CLK=tO_CLK;
endmodule
