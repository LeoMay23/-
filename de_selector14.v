`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/30 16:13:32
// Design Name: 
// Module Name: de_selector14
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module de_selector14(
    input iC, //输入信号 c
    input iS1, //选择信号 s1 
    input iS0, //选择信号 s0
    output oZ0, //输出信号 z0
    output oZ1, //输出信号 z1
    output oZ2, //输出信号 z2
    output oZ3 //输出信号 z3
);
assign oZ0=(iC==0&iS0==0&iS1==0)?0:1;
assign oZ1=(iC==0&iS0==1&iS1==0)?0:1;
assign oZ2=(iC==0&iS0==0&iS1==1)?0:1;
assign oZ3=(iC==0&iS0==1&iS1==1)?0:1;
endmodule
