`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2018 01:53:43 PM
// Design Name: 
// Module Name: lifo
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


module lifo(
    input clk,
    input n_rst,
    input write,
    input read,
    input clear,
    input [31:0] in,
    output [31:0] out,
    output full,
    output empty
    );
    
    parameter p = 8;

    reg [p-1:0]write_reg;
    reg [p-1:0]read_reg;
    reg [2:0]write_posn;
    reg [2:0]read_posn;
 
    // Instantiate p Registers
    genvar pi;
    generate
        for(pi = 0; pi < p; pi = pi + 1) begin : genreg
            register regx(
                .clk(clk),
                .in(in),
                .write(write_reg[pi] & !{p{full}}),
                .read(read_reg[pi] & !{p{empty}}),
                .out(out)
            );
        end
    endgenerate

    always @(posedge clk) begin
        if(!n_rst) begin
            write_posn = 0;
            write_reg = 1;
            read_posn = 0;
            read_reg = 1;
        end
        else begin
            if(write && !full) begin
                write_posn <= write_posn + 1;
                write_reg <= {write_reg[p-2:0], write_reg[p-1]};
            end 
            if(read && !empty) begin
                read_posn <= read_posn + 1;
                read_reg <= {read_reg[p-2:0], read_reg[p-1]};
            end
        end 
    end

    assign empty = write_posn == read_posn;
    assign full = read_reg == {write_reg[p-2:0], write_reg[p-1]};
endmodule
