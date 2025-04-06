module JK_FF(
    input CLK,   // ʱ���źţ���������Ч 
    input J,      
    input K,      
    input RST_n, // ��λ�źţ��͵�ƽ��Ч 
    output reg Q // ����ź�Q 
);
    always @(posedge CLK or negedge RST_n) begin
        if (!RST_n) begin
            // �첽��λ
            Q <= 1'b0;
        end else begin
            case ({J, K})
                2'b00: begin
                    // ����״̬
                    Q <= Q;
                end
                2'b01: begin
                    Q <= 1'b0; // ����
                end
                2'b10: begin
                    Q <= 1'b1; // ����
                end
                2'b11: begin
                    Q <= ~Q; // �л�״̬
                end
            endcase
        end
    end
endmodule

module display7(
    input [2:0] iData,
    output reg [6:0] oData
);
    always @(*) begin
        case(iData)
            3'b000: oData = 7'b1000000; // 0
            3'b001: oData = 7'b1111001; // 1
            3'b010: oData = 7'b0100100; // 2
            3'b011: oData = 7'b0110000; // 3
            3'b100: oData = 7'b0011001; // 4
            3'b101: oData = 7'b0010010; // 5
            3'b110: oData = 7'b0000010; // 6
            3'b111: oData = 7'b1111000; // 7
            default: oData = 7'b1111111; // Ĭ����������ж�Ϩ��
        endcase
    end
endmodule

module Counter8(
    input CLK,        // ����ʱ���źţ����磬100 MHz��
    input rst_n,      // �첽��λ�źţ��͵�ƽ��Ч
    output [2:0] oQ,  // �����Ƽ��������
    output [6:0] oDisplay // �߶�������ʾ�����
);
    wire [2:0] count; // ����JK�����������

    // ʵ����3��JK������
    JK_FF jk0 (
        .CLK(CLK),
        .J(1'b1),
        .K(1'b1),
        .RST_n(rst_n),
        .Q(count[0]) // ���������λ
    );

    JK_FF jk1 (
        .CLK(CLK), // �������λ�����仯ʱ�Ŵ���
        .J(count[0]),
        .K(count[0]),
        .RST_n(rst_n),
        .Q(count[1]) // �������м�λ
    );

    JK_FF jk2 (
        .CLK(CLK), // �����м�λ�����λΪ1ʱ����
        .J(count[1] & count[0]),
        .K(count[1] & count[0]),
        .RST_n(rst_n),
        .Q(count[2]) // ���������λ
    );

    // ����������������ӵ�����˿�
    assign oQ = count; // oQ���ΪJK�����������

    // ʵ�����߶��������ʾ
    display7 seg_display (
        .iData(oQ),    // ��������Ϊ�����������
        .oData(oDisplay) // �߶���������
    );

endmodule
