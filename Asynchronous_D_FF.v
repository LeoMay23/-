`timescale 1ns / 1ps
module Asynchronous_D_FF( 
    input CLK,    
    input D,      
    input RST_n,     
    output reg Q1,   
    output reg Q2   
); 
always @(posedge CLK or negedge RST_n) begin
    if (!RST_n) begin
        Q1 <= 1'b0; // 复位时Q1输出0
        Q2 <= 1'b1; // 复位时Q2输出1（Q的非）
    end else begin
        Q1 <= D;    // 非复位时，Q1在时钟上升沿捕获输入D的值
        Q2 <= ~D;   // Q2是Q1的非，所以在时钟上升沿捕获D的非值
    end
end

endmodule