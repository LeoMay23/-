`timescale 1ns / 1ps
module decoder_tb;
reg [2:0] iData;//��λ���� D2,D1,D0
reg [1:0] iEna; //ʹ���ź� G1,G2
wire [7:0] oData;
decoder uut(
.iData(iData),
.iEna(iEna),
.oData(oData)
);//ʵ����
initial
begin
iEna=2'b00;
iData=3'b110;
#20
iEna=2'b11;
iData=3'b110;
#20
iEna=2'b01;
iData=3'b110;
//��Ч
#20
iEna=2'b10;
iData=3'b000;
#20
iEna=2'b10;
iData=3'b001;
#20
iEna=2'b10;
iData=3'b010;
#20
iEna=2'b10;
iData=3'b011;
#20
iEna=2'b10;
iData=3'b100;
#20
iEna=2'b10;
iData=3'b101;
#20
iEna=2'b10;
iData=3'b110;
#20
iEna=2'b10;
iData=3'b111;
end
endmodule
