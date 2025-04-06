`timescale 1ns / 1ps
module encoder83_Pri_tb;
reg [7:0] iData;
reg iEI;
wire [2:0] oData;
wire oEO;
encoder83_Pri uut(
.iData(iData),
.iEI(iEI),
.oData(oData),
.oEO(oEO)
);//สตภýปฏ
initial
begin
iEI=1;
#40
iData=8'b11111111;
#40
iEI=0;
iData=8'b01010010;
#40
iData=8'b10101001;
#40
iData=8'b11001001;
#40
iData=8'b11101001;
#40
iData=8'b11110011;
#40
iData=8'b11111010;
#40
iData=8'b11111110;
end
endmodule
