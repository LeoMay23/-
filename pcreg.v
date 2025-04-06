module D_FF(
    input clk,
    input d,
    input rst,
    input ena,
    output reg Q
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 0; // 使用非阻塞赋值
        end else begin
            if (ena) 
               Q <= d; // 使用非阻塞赋值
        end
    end
endmodule

module pcreg(
    input clk,
    input rst,
    input ena,
    input [31:0] data_in,
    output [31:0] data_out
);
    // 实例化32个D触发器
    D_FF dff0(.clk(clk), .d(data_in[0]), .rst(rst), .ena(ena), .Q(data_out[0]));
    D_FF dff1(.clk(clk), .d(data_in[1]), .rst(rst), .ena(ena), .Q(data_out[1]));
    D_FF dff2(.clk(clk), .d(data_in[2]), .rst(rst), .ena(ena), .Q(data_out[2]));
    D_FF dff3(.clk(clk), .d(data_in[3]), .rst(rst), .ena(ena), .Q(data_out[3]));
    D_FF dff4(.clk(clk), .d(data_in[4]), .rst(rst), .ena(ena), .Q(data_out[4]));
    D_FF dff5(.clk(clk), .d(data_in[5]), .rst(rst), .ena(ena), .Q(data_out[5]));
    D_FF dff6(.clk(clk), .d(data_in[6]), .rst(rst), .ena(ena), .Q(data_out[6]));
    D_FF dff7(.clk(clk), .d(data_in[7]), .rst(rst), .ena(ena), .Q(data_out[7]));
    D_FF dff8(.clk(clk), .d(data_in[8]), .rst(rst), .ena(ena), .Q(data_out[8]));
    D_FF dff9(.clk(clk), .d(data_in[9]), .rst(rst), .ena(ena), .Q(data_out[9]));
    D_FF dff10(.clk(clk), .d(data_in[10]), .rst(rst), .ena(ena), .Q(data_out[10]));
    D_FF dff11(.clk(clk), .d(data_in[11]), .rst(rst), .ena(ena), .Q(data_out[11]));
    D_FF dff12(.clk(clk), .d(data_in[12]), .rst(rst), .ena(ena), .Q(data_out[12]));
    D_FF dff13(.clk(clk), .d(data_in[13]), .rst(rst), .ena(ena), .Q(data_out[13]));
    D_FF dff14(.clk(clk), .d(data_in[14]), .rst(rst), .ena(ena), .Q(data_out[14]));
    D_FF dff15(.clk(clk), .d(data_in[15]), .rst(rst), .ena(ena), .Q(data_out[15]));
    D_FF dff16(.clk(clk), .d(data_in[16]), .rst(rst), .ena(ena), .Q(data_out[16]));
    D_FF dff17(.clk(clk), .d(data_in[17]), .rst(rst), .ena(ena), .Q(data_out[17]));
    D_FF dff18(.clk(clk), .d(data_in[18]), .rst(rst), .ena(ena), .Q(data_out[18]));
    D_FF dff19(.clk(clk), .d(data_in[19]), .rst(rst), .ena(ena), .Q(data_out[19]));
    D_FF dff20(.clk(clk), .d(data_in[20]), .rst(rst), .ena(ena), .Q(data_out[20]));
    D_FF dff21(.clk(clk), .d(data_in[21]), .rst(rst), .ena(ena), .Q(data_out[21]));
    D_FF dff22(.clk(clk), .d(data_in[22]), .rst(rst), .ena(ena), .Q(data_out[22]));
    D_FF dff23(.clk(clk), .d(data_in[23]), .rst(rst), .ena(ena), .Q(data_out[23]));
    D_FF dff24(.clk(clk), .d(data_in[24]), .rst(rst), .ena(ena), .Q(data_out[24]));
    D_FF dff25(.clk(clk), .d(data_in[25]), .rst(rst), .ena(ena), .Q(data_out[25]));
    D_FF dff26(.clk(clk), .d(data_in[26]), .rst(rst), .ena(ena), .Q(data_out[26]));
    D_FF dff27(.clk(clk), .d(data_in[27]), .rst(rst), .ena(ena), .Q(data_out[27]));
    D_FF dff28(.clk(clk), .d(data_in[28]), .rst(rst), .ena(ena), .Q(data_out[28]));
    D_FF dff29(.clk(clk), .d(data_in[29]), .rst(rst), .ena(ena), .Q(data_out[29]));
    D_FF dff30(.clk(clk), .d(data_in[30]), .rst(rst), .ena(ena), .Q(data_out[30]));
    D_FF dff31(.clk(clk), .d(data_in[31]), .rst(rst), .ena(ena), .Q(data_out[31]));
endmodule
