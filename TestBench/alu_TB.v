`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2026 23:34:06
// Design Name: 
// Module Name: alu_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_TB();
    reg [2:0]alu_ctrl;
    reg [31:0]a,b;
    wire [31:0]result;
    wire zero;
    alu a1(alu_ctrl,a,b,result,zero);
    initial begin
        a=0;
        b=0;
        alu_ctrl = 3'b010;
        #20;
        a = 10;
        b=20;
        #10;
        a=1;
        b=15;
        #10;
        alu_ctrl = 3'b000;
        a=1;
        b=15;
        #30;
        $finish;
    end
endmodule
