`timescale 1ns / 1ps
module encoder83_tb;
reg [7:0] iData;
wire [2:0] oData;
encoder83 uut(
.iData(iData),
.oData(oData)
);//สตภýปฏ
initial
begin
iData=8'b00000001;
#40
iData=8'b00000010;
#40
iData=8'b00000100;
#40
iData=8'b00001000;
#40
iData=8'b00010000;
#40
iData=8'b00100000;
#40
iData=8'b01000000;
#40
iData=8'b10000000;
end
endmodule
