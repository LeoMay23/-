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
    input iC, //�����ź� c
    input iS1, //ѡ���ź� s1 
    input iS0, //ѡ���ź� s0
    output oZ0, //����ź� z0
    output oZ1, //����ź� z1
    output oZ2, //����ź� z2
    output oZ3 //����ź� z3
);
assign oZ0=(iC==0&iS0==0&iS1==0)?0:1;
assign oZ1=(iC==0&iS0==1&iS1==0)?0:1;
assign oZ2=(iC==0&iS0==0&iS1==1)?0:1;
assign oZ3=(iC==0&iS0==1&iS1==1)?0:1;
endmodule
