`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2026 12:22:23
// Design Name: 
// Module Name: single_cycle_TB
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

module single_cycle_TB;

    logic clk;
    logic reset_n;
    
    always #5 clk = ~clk;
    datapath dut ( .clk(clk),.reset_n(reset_n));

    initial begin
        clk    = 0;
        reset_n = 1; 
        repeat (2) @(posedge clk);
        reset_n = 0;
        @(posedge clk);
        repeat (3) @(posedge clk);
        if (dut.register.register[18] !== 32'hDEADBEEF) begin
            $error("FAIL: x18 = %h, expected DEADBEEF", dut.register.register[18]);
        end else begin
            $display("PASS: x18 = %h as expected", dut.register.register[18]);
        end

        #20;
        $finish;
    end

endmodule