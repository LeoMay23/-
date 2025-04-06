`timescale 1ns / 1ps

module alu( 
input [31:0] a,   //32 位输入，操作数1 
input [31:0] b,   //32 位输入，操作数2 
input [3:0] aluc, //4位输入，控制 alu 的操作 
output reg [31:0] r, //32 位输出，由a、b经过aluc指定的操作生成 
output reg zero,        //0 标志位 
output reg carry,    // 进位标志位 
output reg negative,   // 负数标志位 
output reg overflow   // 溢出标志位 
); 
    
    // 计算零标志位
    always @(*) begin
        if(aluc == 4'b1011|| aluc == 4'b1010)
            assign zero = (a - b == 0 );
        else
            assign zero = (r == 0);
    end
    
    // 进位标志位和负数标志位需要根据操作来计算
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
            default: r = 32'b0;               // 默认情况
        endcase
    end

    // Carry, Negative 和 Overflow 标志位
    always @(*) begin
        case (aluc)
            4'b0000: begin // Addu
                carry = (a + b) < a;  // 无符号加法溢出
                //如果发生溢出，结果 a + b 会被截断为32位，并且值会变得比 a 更小（因为高位丢失了）
                overflow = 0;         // 无符号加法不影响overflow
                negative = r[31];
            end
            4'b0010: begin // Add
                carry = 0;  // 有符号加法不影响
                overflow = (a[31] == b[31]) && (r[31] != a[31]); // 检测溢出
                negative = r[31];      // 检测负数标志位
            end
            4'b0001: begin // Subu
                carry = (a < b);      // 无符号减法下溢出
                overflow = 0;         // 无符号减法不影响overflow
                negative = r[31];
            end
            4'b0011: begin // Sub
                carry = 0;      // 有符号减法下无影响
                overflow = (a[31] != b[31]) && (r[31] != a[31]); // 检测溢出
                negative = r[31];      // 检测负数标志位
            end
            4'b0100: begin // And
                carry = 0;             // 与运算不影响carry
                overflow = 0;          // 与运算不影响overflow
                negative = r[31];      // 与运算根据结果来判断负数标志
            end
            4'b0101: begin // Or
                carry = 0;             // 或运算不影响carry
                overflow = 0;          // 或运算不影响overflow
                negative = r[31];      // 或运算根据结果来判断负数标志
            end
            4'b0110: begin // Xor
                carry = 0;             // 异或运算不影响carry
                overflow = 0;          // 异或运算不影响overflow
                negative = r[31];      // 异或运算根据结果来判断负数标志
            end
            4'b0111: begin // Nor
                carry = 0;             // Nor运算不影响carry
                overflow = 0;          // Nor运算不影响overflow
                negative = r[31];      // Nor运算根据结果来判断负数标志
            end
            4'b1000: begin // Lui
                carry = 0;             // Lui不影响进位
                overflow = 0;          // Lui不影响溢出
                negative = r[31];          // Lui不会产生负数
            end
            4'b1001: begin // Lui
                            carry = 0;             // Lui不影响进位
                            overflow = 0;          // Lui不影响溢出
                            negative = r[31];          // Lui不会产生负数
                        end
            4'b1011: begin // Slt
                carry = 0;             // Slt不影响carry
                overflow = 0;          // Slt不影响overflow
                negative = ($signed(a) < $signed(b)) ? 1 : 0; // 如果a小于b，negative=1，否则为0
            end
            4'b1010: begin // Sltu
                carry = (a < b) ? 1 : 0;
                overflow = 0;          // Sltu不影响overflow
                negative = r[31];          // Sltu不影响negative标志
            end
            4'b1100: begin // Sra
            if(a==0)
                carry = 0;
            else
                carry = b[a-1];            // 最后一次被移出的位是b[a-1]
                overflow = 0;          // 算术右移不产生溢出
                negative = r[31];      // 算术右移后根据最高位判断负数
            end
            4'b1110: begin // Sll/Sla
            if(a==0)
                carry = 0;
            else
                carry = b[32-a];         // 移位时进位标志由移出位决定
                overflow = 0;          // 左移不会产生溢出
                negative = r[31];      // 左移后根据最高位判断负数
            end
            4'b1111: begin // Sll/Sla
            if(a==0)
                carry = 0;
            else
                carry = b[32-a];         // 移位时进位标志由移出位决定
                overflow = 0;          // 左移不会产生溢出
                negative = r[31];      // 左移后根据最高位判断负数
                        end
            4'b1101: begin // Srl
            if(a==0)
                carry = 0;
            else
                carry = b[a-1];          // 逻辑右移进位由移出位决定
                overflow = 0;          // 逻辑右移不产生溢出
                negative = r[31];          // 逻辑右移不影响负数标志位
            end
            default: begin
                carry = 0;
                overflow = 0;
                negative = 0;
            end
        endcase
    end

endmodule
