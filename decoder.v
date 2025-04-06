module Decoder(
    input [4:0] addr,      // 5位输入地址
    input en,              // 使能信号
    output [31:0] sel      // 32位选择信号
);
     assign sel = (en ? (1 << addr) : 32'b0); // 将地址解码为对应的选择信号
endmodule

