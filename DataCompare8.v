`timescale 1ns / 1ps
module DataCompare4(
input [3:0] iData_a, //输入数据 a
input [3:0] iData_b, //输入数据 b
input [2:0] iData, //级联输入a>b、a<b、a=b
output reg [2:0] oData //结果输出 A>B、A<B、A=B
);
always @(*) begin
    if(iData_a[3]>iData_b[3]) oData=3'b100;
    else if(iData_a[3]<iData_b[3]) oData=3'b010;
    else if(iData_a[2]>iData_b[2]) oData=3'b100;
    else if(iData_a[2]<iData_b[2]) oData=3'b010;
    else if(iData_a[1]>iData_b[1]) oData=3'b100;
    else if(iData_a[1]<iData_b[1]) oData=3'b010;
    else if(iData_a[0]>iData_b[0]) oData=3'b100;
    else if(iData_a[0]<iData_b[0]) oData=3'b010;
    else begin
        case(iData) 
        3'b100:oData=3'b100;
        3'b010:oData=3'b010;
        3'b001:oData=3'b001;
        endcase
    end
end
endmodule

module DataCompare8(
input [7:0] iData_a, //输入数据 a
input [7:0] iData_b, //输入数据 b
output [2:0] oData //结果输出
);
wire [2:0]part1_oData;
DataCompare4 part1(
.iData_a(iData_a[3:0]), //输入数据 a
.iData_b(iData_b[3:0]), //输入数据 b
.iData(3'b001), //级联输入a>b、a<b、a=b
.oData(part1_oData) //结果输出 A>B、A<B、A=B
);

DataCompare4 part2(
.iData_a(iData_a[7:4]), //输入数据 a
.iData_b(iData_b[7:4]), //输入数据 b
.iData(part1_oData), //级联输入a>b、a<b、a=b
.oData(oData) //结果输出 A>B、A<B、A=B
);
endmodule
