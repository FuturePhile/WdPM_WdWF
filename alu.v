`timescale 1ns/100ps

module alu (
    input [3:0] OP,
    input [7:0] A,
    input [7:0] R,
    output reg  CY,
    output reg [7:0] OUT
);

always @(*) begin
    casex (OP)
        4'bx000 : begin
            {CY,OUT} <= A + R;
        end 
        4'bx001 : begin
            {CY,OUT} <= A - R;
        end
        4'bx010 : begin
            OUT <= A & R;
            CY <= 1'b0;
        end
        4'bx011 : begin
            OUT <= A | R;
            CY <= 1'b0;
        end
        4'bx100 : begin
            OUT <= A ^ R;
            CY <= 1'b0;
        end
        4'bx101 : begin
            OUT <= ~A;
            CY <= 1'b0;
        end
        4'bx110 : begin
            OUT <= R;
        end
    endcase
end
    
endmodule

// module tb_alu;
    
// reg [7:0] A, R;
// reg [3:0] OP;

// wire [7:0] OUT;
// wire CY;

// alu uut(
//     .A(A),
//     .R(R),
//     .OP(OP),
//     .OUT(OUT),
//     .CY(CY)
// );

// initial begin
//     A = 8'h0A;
//     R = 8'h02;
//     OP = 4'h0;
//     #10 
//     OP = 4'h1;
//     #10 $finish;
// end

// initial begin
//     $dumpfile("alu.vcd");
//     $dumpvars();
//     $dumpon;
// end

// endmodule