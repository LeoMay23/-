`timescale 1ns / 1ps

module Regfiles( 
input clk, //�Ĵ�����ʱ���źţ��½���д������ 
input rst, //�첽��λ�źţ��ߵ�ƽʱȫ���Ĵ������� 
input we, //�Ĵ�����д��Ч�źţ��ߵ�ƽʱ����Ĵ���д�����ݣ��͵�ƽʱ����Ĵ����������� 
input [4:0] raddr1, //�����ȡ�ļĴ����ĵ�ַ 
input [4:0] raddr2, //�����ȡ�ļĴ����ĵ�ַ 
input [4:0] waddr, //д�Ĵ����ĵ�ַ 
input [31:0] wdata, //д�Ĵ������ݣ�������clk�½���ʱ��д�� 
output [31:0] rdata1, //raddr1����Ӧ�Ĵ������������ 
output [31:0] rdata2  //raddr2 ����Ӧ�Ĵ������������ 
); 
    wire [31:0] write_enable;         // дʹ���ź�
    wire [31:0] regs_out[31:0];       // ���мĴ������������

    // ������ʵ����������дʹ���ź�
    Decoder write_decoder (
        .en(we),                     // ʹ���ź�
        .addr(waddr),
        .sel(write_enable)
    );

    // 32���Ĵ���ʵ����
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : register_block
            ram reg_inst (
                .clk(clk),
                .rst(rst),
                .en(write_enable[i]),              // ��ʹ���ź�
                .in(wdata),
                .out(regs_out[i])
            );
        end
    endgenerate

    // ��ȡ����ѡ����ʵ����
    selector read_mux1 (
        .en(~we),                      // ��ʹ���ź�
        .in0(regs_out[0]),  .in1(regs_out[1]),  .in2(regs_out[2]),  .in3(regs_out[3]),
        .in4(regs_out[4]),  .in5(regs_out[5]),  .in6(regs_out[6]),  .in7(regs_out[7]),
        .in8(regs_out[8]),  .in9(regs_out[9]),  .in10(regs_out[10]),.in11(regs_out[11]),
        .in12(regs_out[12]),.in13(regs_out[13]),.in14(regs_out[14]),.in15(regs_out[15]),
        .in16(regs_out[16]),.in17(regs_out[17]),.in18(regs_out[18]),.in19(regs_out[19]),
        .in20(regs_out[20]),.in21(regs_out[21]),.in22(regs_out[22]),.in23(regs_out[23]),
        .in24(regs_out[24]),.in25(regs_out[25]),.in26(regs_out[26]),.in27(regs_out[27]),
        .in28(regs_out[28]),.in29(regs_out[29]),.in30(regs_out[30]),.in31(regs_out[31]),
        .sel(raddr1),
        .out(rdata1)
    );

    selector read_mux2 (
        .en(~we),                      // ��ʹ���ź�
        .in0(regs_out[0]),  .in1(regs_out[1]),  .in2(regs_out[2]),  .in3(regs_out[3]),
        .in4(regs_out[4]),  .in5(regs_out[5]),  .in6(regs_out[6]),  .in7(regs_out[7]),
        .in8(regs_out[8]),  .in9(regs_out[9]),  .in10(regs_out[10]),.in11(regs_out[11]),
        .in12(regs_out[12]),.in13(regs_out[13]),.in14(regs_out[14]),.in15(regs_out[15]),
        .in16(regs_out[16]),.in17(regs_out[17]),.in18(regs_out[18]),.in19(regs_out[19]),
        .in20(regs_out[20]),.in21(regs_out[21]),.in22(regs_out[22]),.in23(regs_out[23]),
        .in24(regs_out[24]),.in25(regs_out[25]),.in26(regs_out[26]),.in27(regs_out[27]),
        .in28(regs_out[28]),.in29(regs_out[29]),.in30(regs_out[30]),.in31(regs_out[31]),
        .sel(raddr2),
        .out(rdata2)
    );
endmodule
