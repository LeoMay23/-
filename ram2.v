`timescale 1ns / 1ps

module ram2 ( 
input clk,   //存储器时钟信号，上升沿时向ram内部写入数据 
input ena,   //存储器有效信号，高电平时存储器才运行，否则输出z 
input wena,  //存储器读写有效信号，高电平为写有效，低电平为读有效，与ena 同时有效时才可对存储器进行读写 
input [4:0] addr,   //输入地址，指定数据读写的地址 
inout [31:0] data  //存储器数据线，可传输存储器读出或写入的数据。写入的数据在clk上升沿时被写入 
);
    // 定义 1024 位的存储矩阵，每个存储单元 32 位
    reg [31:0] mem_array [31:0]; 
    reg [31:0] data_out;         // 用于存储读出数据


    assign data = (ena && ~wena) ? data_out : 32'bz; // 输出数据或高阻态

    always @(posedge clk) begin
        if (ena) begin
            if (wena) begin
                mem_array[addr] <= data; // 写入数据
            end 
        end
    end
    
    // 在读操作时更新 data_out
    always @(*) begin
        if (ena && ~wena) begin
            data_out = mem_array[addr]; // 读取数据
        end else if (~ena)
             data_out <= 32'bz; // 输出高阻态
    end
endmodule
