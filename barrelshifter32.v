`timescale 1ns / 1ps
module barrelshifter32(
input [31:0] a,
input [4:0] b, input [1:0] aluc, output reg [31:0] c
);
reg [31:0] tc;
reg [4:0] counter;
reg [4:0] plus;
always@(*)
    begin
        if (aluc[0]) c = (a << b);
        else if (aluc[1]) c = (a >> b);
        else if (!a[31]) c = (a >> b);
        else c = (a >> b) |(~(32'b11111111111111111111111111111111 >> b));
    end
endmodule
