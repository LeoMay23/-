`timescale 1ns / 1ps

module alu( 
input [31:0] a,   //32 λ���룬������1 
input [31:0] b,   //32 λ���룬������2 
input [3:0] aluc, //4λ���룬���� alu �Ĳ��� 
output reg [31:0] r, //32 λ�������a��b����alucָ���Ĳ������� 
output reg zero,        //0 ��־λ 
output reg carry,    // ��λ��־λ 
output reg negative,   // ������־λ 
output reg overflow   // �����־λ 
); 
    
    // �������־λ
    always @(*) begin
        if(aluc == 4'b1011|| aluc == 4'b1010)
            assign zero = (a - b == 0 );
        else
            assign zero = (r == 0);
    end
    
    // ��λ��־λ�͸�����־λ��Ҫ���ݲ���������
    always @(*) begin
        case (aluc)
            4'b0000: r = a + b;               // Addu
            4'b0010: r = $signed(a) + $signed(b);               // Add
            4'b0001: r = a - b;               // Subu
            4'b0011: r = $signed(a) - $signed(b);               // Sub
            4'b0100: r = a & b;               // And
            4'b0101: r = a | b;               // Or
            4'b0110: r = a ^ b;               // Xor
            4'b0111: r = ~(a | b);            // Nor
            4'b1000: r = {b[15:0], 16'b0};    // Lui
            4'b1001: r = {b[15:0], 16'b0};    // Lui
            4'b1011: r = ($signed(a) < $signed(b)) ? 1 : 0;     // Slt
            4'b1010: r = (a < b) ? 1 : 0;     // Sltu
            4'b1100: r = $signed(b) >>> a;             // Sra
            4'b1110: r = b << a;              // Sll/Sla
            4'b1111: r = b << a;              // Sll/Sla
            4'b1101: r = b >> a;              // Srl
            default: r = 32'b0;               // Ĭ�����
        endcase
    end

    // Carry, Negative �� Overflow ��־λ
    always @(*) begin
        case (aluc)
            4'b0000: begin // Addu
                carry = (a + b) < a;  // �޷��żӷ����
                //��������������� a + b �ᱻ�ض�Ϊ32λ������ֵ���ñ� a ��С����Ϊ��λ��ʧ�ˣ�
                overflow = 0;         // �޷��żӷ���Ӱ��overflow
                negative = r[31];
            end
            4'b0010: begin // Add
                carry = 0;  // �з��żӷ���Ӱ��
                overflow = (a[31] == b[31]) && (r[31] != a[31]); // ������
                negative = r[31];      // ��⸺����־λ
            end
            4'b0001: begin // Subu
                carry = (a < b);      // �޷��ż��������
                overflow = 0;         // �޷��ż�����Ӱ��overflow
                negative = r[31];
            end
            4'b0011: begin // Sub
                carry = 0;      // �з��ż�������Ӱ��
                overflow = (a[31] != b[31]) && (r[31] != a[31]); // ������
                negative = r[31];      // ��⸺����־λ
            end
            4'b0100: begin // And
                carry = 0;             // �����㲻Ӱ��carry
                overflow = 0;          // �����㲻Ӱ��overflow
                negative = r[31];      // ��������ݽ�����жϸ�����־
            end
            4'b0101: begin // Or
                carry = 0;             // �����㲻Ӱ��carry
                overflow = 0;          // �����㲻Ӱ��overflow
                negative = r[31];      // ��������ݽ�����жϸ�����־
            end
            4'b0110: begin // Xor
                carry = 0;             // ������㲻Ӱ��carry
                overflow = 0;          // ������㲻Ӱ��overflow
                negative = r[31];      // ���������ݽ�����жϸ�����־
            end
            4'b0111: begin // Nor
                carry = 0;             // Nor���㲻Ӱ��carry
                overflow = 0;          // Nor���㲻Ӱ��overflow
                negative = r[31];      // Nor������ݽ�����жϸ�����־
            end
            4'b1000: begin // Lui
                carry = 0;             // Lui��Ӱ���λ
                overflow = 0;          // Lui��Ӱ�����
                negative = r[31];          // Lui�����������
            end
            4'b1001: begin // Lui
                            carry = 0;             // Lui��Ӱ���λ
                            overflow = 0;          // Lui��Ӱ�����
                            negative = r[31];          // Lui�����������
                        end
            4'b1011: begin // Slt
                carry = 0;             // Slt��Ӱ��carry
                overflow = 0;          // Slt��Ӱ��overflow
                negative = ($signed(a) < $signed(b)) ? 1 : 0; // ���aС��b��negative=1������Ϊ0
            end
            4'b1010: begin // Sltu
                carry = (a < b) ? 1 : 0;
                overflow = 0;          // Sltu��Ӱ��overflow
                negative = r[31];          // Sltu��Ӱ��negative��־
            end
            4'b1100: begin // Sra
            if(a==0)
                carry = 0;
            else
                carry = b[a-1];            // ���һ�α��Ƴ���λ��b[a-1]
                overflow = 0;          // �������Ʋ��������
                negative = r[31];      // �������ƺ�������λ�жϸ���
            end
            4'b1110: begin // Sll/Sla
            if(a==0)
                carry = 0;
            else
                carry = b[32-a];         // ��λʱ��λ��־���Ƴ�λ����
                overflow = 0;          // ���Ʋ���������
                negative = r[31];      // ���ƺ�������λ�жϸ���
            end
            4'b1111: begin // Sll/Sla
            if(a==0)
                carry = 0;
            else
                carry = b[32-a];         // ��λʱ��λ��־���Ƴ�λ����
                overflow = 0;          // ���Ʋ���������
                negative = r[31];      // ���ƺ�������λ�жϸ���
                        end
            4'b1101: begin // Srl
            if(a==0)
                carry = 0;
            else
                carry = b[a-1];          // �߼����ƽ�λ���Ƴ�λ����
                overflow = 0;          // �߼����Ʋ��������
                negative = r[31];          // �߼����Ʋ�Ӱ�츺����־λ
            end
            default: begin
                carry = 0;
                overflow = 0;
                negative = 0;
            end
        endcase
    end

endmodule
