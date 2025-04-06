`timescale 1ns / 1ps

module JK_FF( 
    input CLK,   // 时钟信号，上升沿有效 
    input J,      
    input K,      
    input RST_n, // 复位信号，低电平有效 
    output reg Q1, // 输出信号Q 
    output reg Q2  // 输出信号Q? 
);
    always @(posedge CLK or negedge RST_n) begin
        if (!RST_n) begin
            // 异步复位
            Q1 <= 1'b0;
            Q2 <= 1'b1;
        end else begin
            case ({J, K})
                2'b00: begin
                    // 保持状态
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
                    // 切换状态
                    Q1 <= ~Q1;
                    Q2 <= ~Q2;
                end
            endcase
        end
    end

endmodule
