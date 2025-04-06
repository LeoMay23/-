`timescale 1ns/1ns 

module de_selector14_tb; 
 reg iC; //输入信号 c
 reg iS1; //选择信号 s1 
 reg iS0; //选择信号 s0
 wire oZ0; //输出信号 z0
 wire oZ1; //输出信号 z1
 wire oZ2; //输出信号 z2
 wire oZ3 ;//输出信号 z3
de_selector14 uut ( .iC(iC), .iS1(iS1), .iS0(iS0),.oZ0(oZ0),.oZ1(oZ1),.oZ2(oZ2),.oZ3(oZ3) );
initial 
begin
        iC = 0;  
        iS1 = 0;  
        iS0 = 0;  
        #40;  
        iC = 0; iS1 = 0; iS0 = 0; #40;
        iC = 0; iS1 = 0; iS0 = 1; #40;
        iC = 0 ;iS1 = 1; iS0 = 0; #40;
        iC = 0; iS1 = 1; iS0 = 1; #40;
        iC = 1; iS1 = 0; iS0 = 0; #40;
        iC = 1 ;iS1 = 0;iS0 = 1; #40;
        iC = 1; iS1 = 1; iS0 = 0; #40;
        iC = 1; iS1 = 1; iS0 = 1;#40;
end 
endmodule
