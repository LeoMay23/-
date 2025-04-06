`timescale 1ns / 1ps

module Synchronous_D_FF_tb;
    reg CLK;
    reg D;
    reg RST_n;
    wire Q1;
    wire Q2;

    Synchronous_D_FF uut (
        .CLK(CLK),
        .D(D),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );

    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;
    end

    initial begin
        RST_n = 0;
        D = 0;

        #20 RST_n = 0;
        #20 RST_n = 1;

        #20 D = 1;
        #20 D = 0;
        #40 D = 1;

        #30 RST_n = 0;
        #20 RST_n = 1;

        #20 D = 1;
        #40 D = 0;
    end

endmodule
