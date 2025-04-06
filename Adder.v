`timescale 1ns / 1ps
module FA(
     input iA, //1 位二进制加数
     input iB, //1 位二进制被加数
     input iC, //低位的进位信号
     output oS, //1 位和数
     output oC //向高位的进位信号
);
    assign oS = iA ^ iB ^ iC;
    assign oC = (iA & iB) | ((iA ^ iB) & iC);
endmodule

module Adder( 
input [7:0] iData_a, //8 位二进制加数 
input [7:0] iData_b, //8 位二进制被加数 
input iC,            //低位的进位信号 
output [7:0] oData,  //8位和数 
output oData_C        
//向高位的进位信号 
); 
   wire [7:0] carry;
   wire [7:0] sum;

   FA fa0 (
       .iA(iData_a[0]),
       .iB(iData_b[0]),
       .iC(iC),
       .oS(sum[0]),
       .oC(carry[0])
   );

   FA fa1 (
       .iA(iData_a[1]),
       .iB(iData_b[1]),
       .iC(carry[0]),
       .oS(sum[1]),
       .oC(carry[1])
   );

   FA fa2 (
       .iA(iData_a[2]),
       .iB(iData_b[2]),
       .iC(carry[1]),
       .oS(sum[2]),
       .oC(carry[2])
   );

   FA fa3 (
       .iA(iData_a[3]),
       .iB(iData_b[3]),
       .iC(carry[2]),
       .oS(sum[3]),
       .oC(carry[3])
   );

   FA fa4 (
       .iA(iData_a[4]),
       .iB(iData_b[4]),
       .iC(carry[3]),
       .oS(sum[4]),
       .oC(carry[4])
   );

   FA fa5 (
       .iA(iData_a[5]),
       .iB(iData_b[5]),
       .iC(carry[4]),
       .oS(sum[5]),
       .oC(carry[5])
   );

   FA fa6 (
       .iA(iData_a[6]),
       .iB(iData_b[6]),
       .iC(carry[5]),
       .oS(sum[6]),
       .oC(carry[6])
   );

   FA fa7 (
       .iA(iData_a[7]),
       .iB(iData_b[7]),
       .iC(carry[6]),
       .oS(sum[7]),
       .oC(carry[7])
   );
   assign oData = sum;
   assign oData_C = carry[7];
endmodule
