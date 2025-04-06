`timescale 1ns / 1ps

module FA_tb;
    reg iA;
    reg iB;
    reg iC;
    wire oS;
    wire oC;
    FA uut (
        .iA(iA),
        .iB(iB),
        .iC(iC),
        .oS(oS),
        .oC(oC)
    );
    initial begin
        // ≥ı ºªØ ‰»Î
        iA = 0; iB = 0; iC = 0;
        #40;
        iA = 0; iB = 0; iC = 1;
        #40;
        iA = 0; iB = 1; iC = 0;
        #40;
        iA = 0; iB = 1; iC = 1;
        #40;
        iA = 1; iB = 0; iC = 0;
        #40;
        iA = 1; iB = 0; iC = 1;
        #40;
        iA = 1; iB = 1; iC = 0;
        #40;
        iA = 1; iB = 1; iC = 1;
        #40;
    end
endmodule