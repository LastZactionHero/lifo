`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2018 02:30:50 PM
// Design Name: 
// Module Name: lifo_tb
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


module lifo_tb(

    );
    
    reg clk;
    reg n_rst;
    reg write;
    reg read;
    reg clear;
    reg [31:0]in;
    wire [31:0]out;
    wire full;
    wire empty;
    
    lifo DUT(
        .clk(clk),
        .n_rst(n_rst),
        .write(write),
        .read(read),
        .clear(clear),
        .in(in),
        .out(out),
        .full(full),
        .empty(empty)
    );
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        n_rst = 0;
        in = 32'h0000;
        write = 0;
        read = 0;
        clear = 0;
        
        #40;
        n_rst = 1;
        #20;
        
        in = 32'hF0F0;
        write = 1;
        #20;
        write = 0;
        #20;
        
        write = 1;
        in = 32'h000F;
        #20;
        in = 32'h00F0;
        #20
        in = 32'h0F00;
        #20;
        in = 32'hF000;
        #20;
        in = 32'h0001;
        #20;
        in = 32'h0010;
        #20;
        in = 32'h0100;
        #20;
        in = 32'h1000;
        #20;
        in = 32'hFFFF;
        #20;
        write = 0;
        #20;
        
        read = 1;
        #100;
        
        write = 1;
        #200;
    end
endmodule
