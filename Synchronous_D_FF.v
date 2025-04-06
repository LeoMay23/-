`timescale 1ns / 1ps
module Synchronous_D_FF( 
input CLK,    //时钟信号，上升沿有效
input D,      //输入信号D 
input RST_n,  //复位信号，低电平有效 
output reg Q1, //输出信号Q 
output reg Q2  //输出信号
); 
always @(posedge CLK) begin
    if (!RST_n) begin
        Q1 <= 1'b0; // 复位时Q1输出0
        Q2 <= 1'b1; // 复位时Q2输出1（Q的非）
    end else begin
        Q1 <= D;    // 非复位时，Q1在时钟上升沿捕获输入D的值
        Q2 <= ~D;   // Q2是Q1的非，所以在时钟上升沿捕获D的非值
    end
end
endmodule
