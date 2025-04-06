module Divider ( 
input I_CLK,  //输入时钟信号，上升沿有效 
input rst,    //同步复位信号，高电平有效 
output O_CLK  //输出时钟 
);
    parameter DIVISOR = 10000000; // 默认分频倍数为20
    reg [26:0] counter=0; // 计数器，用于计数到DIVISOR
    reg tO_CLK = 0;           
    // 复位和分频逻辑
    always @(posedge I_CLK) begin
            if (rst) begin
                tO_CLK <= 0;   // 复位输出时钟
            end else begin
            if (counter == DIVISOR) begin
                tO_CLK <= ~tO_CLK; // 翻转输出时钟
                counter <= 0;     // 重置计数器
            end else 
                counter <= counter + 1; // 计数
        end
    end
    assign O_CLK=tO_CLK;
endmodule
