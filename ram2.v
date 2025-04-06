`timescale 1ns / 1ps

module ram2 ( 
input clk,   //�洢��ʱ���źţ�������ʱ��ram�ڲ�д������ 
input ena,   //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У��������z 
input wena,  //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����ena ͬʱ��Чʱ�ſɶԴ洢�����ж�д 
input [4:0] addr,   //�����ַ��ָ�����ݶ�д�ĵ�ַ 
inout [31:0] data  //�洢�������ߣ��ɴ���洢��������д������ݡ�д���������clk������ʱ��д�� 
);
    // ���� 1024 λ�Ĵ洢����ÿ���洢��Ԫ 32 λ
    reg [31:0] mem_array [31:0]; 
    reg [31:0] data_out;         // ���ڴ洢��������


    assign data = (ena && ~wena) ? data_out : 32'bz; // ������ݻ����̬

    always @(posedge clk) begin
        if (ena) begin
            if (wena) begin
                mem_array[addr] <= data; // д������
            end 
        end
    end
    
    // �ڶ�����ʱ���� data_out
    always @(*) begin
        if (ena && ~wena) begin
            data_out = mem_array[addr]; // ��ȡ����
        end else if (~ena)
             data_out <= 32'bz; // �������̬
    end
endmodule
