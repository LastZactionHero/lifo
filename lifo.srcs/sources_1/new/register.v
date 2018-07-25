`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2018 01:53:43 PM
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input [31:0] in,
    input write,
    input read,
    output [31:0]out
    );
    
    reg [31:0]data;
    reg state_read;

    always @(posedge clk) begin
        if(write)
            data = in;
            
        state_read = read;    
    end
    
    assign out = state_read ? data : 'bz;
endmodule
