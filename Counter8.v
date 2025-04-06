module JK_FF(
    input CLK,   // 时钟信号，上升沿有效 
    input J,      
    input K,      
    input RST_n, // 复位信号，低电平有效 
    output reg Q // 输出信号Q 
);
    always @(posedge CLK or negedge RST_n) begin
        if (!RST_n) begin
            // 异步复位
            Q <= 1'b0;
        end else begin
            case ({J, K})
                2'b00: begin
                    // 保持状态
                    Q <= Q;
                end
                2'b01: begin
                    Q <= 1'b0; // 重置
                end
                2'b10: begin
                    Q <= 1'b1; // 设置
                end
                2'b11: begin
                    Q <= ~Q; // 切换状态
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
            default: oData = 7'b1111111; // 默认情况，所有段熄灭
        endcase
    end
endmodule

module Counter8(
    input CLK,        // 输入时钟信号（例如，100 MHz）
    input rst_n,      // 异步复位信号，低电平有效
    output [2:0] oQ,  // 二进制计数器输出
    output [6:0] oDisplay // 七段数字显示管输出
);
    wire [2:0] count; // 三个JK触发器的输出

    // 实例化3个JK触发器
    JK_FF jk0 (
        .CLK(CLK),
        .J(1'b1),
        .K(1'b1),
        .RST_n(rst_n),
        .Q(count[0]) // 计数器最低位
    );

    JK_FF jk1 (
        .CLK(CLK), // 仅在最低位发生变化时才触发
        .J(count[0]),
        .K(count[0]),
        .RST_n(rst_n),
        .Q(count[1]) // 计数器中间位
    );

    JK_FF jk2 (
        .CLK(CLK), // 仅在中间位和最低位为1时触发
        .J(count[1] & count[0]),
        .K(count[1] & count[0]),
        .RST_n(rst_n),
        .Q(count[2]) // 计数器最高位
    );

    // 将计数器的输出连接到输出端口
    assign oQ = count; // oQ输出为JK触发器的输出

    // 实例化七段数码管显示
    display7 seg_display (
        .iData(oQ),    // 输入数据为计数器的输出
        .oData(oDisplay) // 七段数码管输出
    );

endmodule
