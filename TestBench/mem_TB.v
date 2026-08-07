`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2026 02:38:22
// Design Name: 
// Module Name: mem_TB
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


module mem_TB();
    reg [31:0]write_data,address;
    reg clk,write_en,reset_n;
    wire [31:0] read_data;
    dmemory dut(clk,address,write_data,write_en,reset_n,read_data);
    initial begin 
        clk =0;
        forever begin 
            clk = ~clk;
            #5;
        end
    end
    initial begin 
        #5;
        write_data =0;
        address =0;
        write_en = 0;
        reset_n = 1;
        #10;
        write_data = 32'hABCDEF12;
        write_en = 1;
        address =  32'd8;
        #10;
        write_data = 32'h12345678;
        write_en = 1;
        address =  32'd0;
        #10;
        write_data = 32'h12345678;
        write_en = 0;
        address =  32'd4;
        #10
        $finish;
   end
        
endmodule
