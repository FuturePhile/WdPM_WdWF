`define OP_ADD  4'bx000
`define OP_SUB  4'bx001
`define OP_LD   4'bx110
`define OP_ST   4'b0111
`define OP_AND  4'bx010
`define OP_OR   4'bx011
`define OP_XOR  4'bx100
`define OP_NOP  4'b1111
`define OP_NOT  4'bx101

`define R0 2'b00
`define R1 2'b01
`define R2 2'b10
`define RZ 2'b11

module instruction_decoder (
  input wire [5:0] DATA,
  output reg ACC_CE,
  output reg [2:0] ALU_OP,
  output reg [1:0] RF_A,
  output reg [2:0] RF_SEL
);
  
  reg [3:0] opcode;
  reg [1:0] adR;

always @(*) begin
  {opcode, adR} = DATA[5:0];
  ACC_CE = 1'b0;
  ALU_OP = 3'b000;
  RF_A = 2'b00;
  RF_SEL = 3'b000;

  casex (opcode)
    `OP_ADD, `OP_SUB, `OP_LD, `OP_AND, `OP_OR, `OP_XOR, `OP_NOT : 
    begin 
      case (adR)
        `R0 : begin RF_A = 2'b00; end 
        `R1 : begin RF_A = 2'b01; end
        `R2 : begin RF_A = 2'b10; end
        `RZ : begin RF_A = 2'b11; end
      endcase
      ALU_OP = opcode[2:0]; 
      ACC_CE = 1'b1;
    end
    `OP_ST : begin
      case (adR)
        `R0 : begin RF_SEL = 3'b001; end 
        `R1 : begin RF_SEL = 3'b010; end
        `R2 : begin RF_SEL = 3'b100; end
        default: begin RF_SEL = 3'b000; end
      endcase
     end
     `OP_NOP : begin end
     default: begin
      ACC_CE = 1'b0; 
     end
  endcase

end
  
endmodule