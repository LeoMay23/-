module ram(
    input clk,              // 时钟信号
    input rst,              // 异步复位信号
    input en,               // 使能信号
    input [31:0] in,      // 输入数据
    output reg [31:0] out // 输出数据
);
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            out <= 32'b0; // 异步复位
        end else if (en) begin
            out <= in;  // 写操作在使能和写使能均有效时执行
        end
    end
endmodule
