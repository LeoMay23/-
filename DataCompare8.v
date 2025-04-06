`timescale 1ns / 1ps
module DataCompare4(
input [3:0] iData_a, //�������� a
input [3:0] iData_b, //�������� b
input [2:0] iData, //��������a>b��a<b��a=b
output reg [2:0] oData //������ A>B��A<B��A=B
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
input [7:0] iData_a, //�������� a
input [7:0] iData_b, //�������� b
output [2:0] oData //������
);
wire [2:0]part1_oData;
DataCompare4 part1(
.iData_a(iData_a[3:0]), //�������� a
.iData_b(iData_b[3:0]), //�������� b
.iData(3'b001), //��������a>b��a<b��a=b
.oData(part1_oData) //������ A>B��A<B��A=B
);

DataCompare4 part2(
.iData_a(iData_a[7:4]), //�������� a
.iData_b(iData_b[7:4]), //�������� b
.iData(part1_oData), //��������a>b��a<b��a=b
.oData(oData) //������ A>B��A<B��A=B
);
endmodule
