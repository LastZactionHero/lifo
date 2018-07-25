`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2018 01:58:10 PM
// Design Name: 
// Module Name: register_tb
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


module register_tb(

    );
    
    reg clk;
    reg [31:0]in;
    reg write;
    reg read;
    wire [31:0]out;
    
    register DUT(
        .clk(clk),
        .in(in),
        .write(write),
        .read(read),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        write = 0;
        read = 0;
        in = 32'hF0F0;
        #20;

        write = 1;
        #20;
        write = 0;
        #20;
        
        in = 32'h0000;
        #40;
        
        read = 1;
        #20;
        read = 0;
        #20;
        
        in = 32'h1010;
        #20;
        
        write = 1;
        #20;
        write = 0;
        #20;
        
        read = 1;
        #20;
        read = 0;
        #20;
 
        #40;        
    end
endmodule
