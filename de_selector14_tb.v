`timescale 1ns/1ns 

module de_selector14_tb; 
 reg iC; //�����ź� c
 reg iS1; //ѡ���ź� s1 
 reg iS0; //ѡ���ź� s0
 wire oZ0; //����ź� z0
 wire oZ1; //����ź� z1
 wire oZ2; //����ź� z2
 wire oZ3 ;//����ź� z3
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
