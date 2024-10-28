// reg_file ver 0.1
module reg_file (
  input [2:0] SEL,
  input [1:0] ADDR,
  input CLK,
  // input CE, // SEL jest CE dla poszczególnych reg
  input RZ,
  input [7:0] IN,
  output reg [7:0] OUT
);
  
  reg [7:0] R0;
  reg [7:0] R1;
  reg [7:0] R2;


always @(posedge CLK) begin

  if (SEL == 3'b001) begin
    R0 <= IN;
  end else if (SEL == 3'b010) begin
    R1 <= IN;
  end else if (SEL == 3'b100) begin
    R2 <= IN;
  end

  case (ADDR)
    2'b00 : begin
      OUT <= R0;
    end 
    2'b01 : begin
      OUT <= R1;
    end
    2'b10 : begin
      OUT <= R2;
    end
    2'b11 : begin
      OUT <= RZ;
    end
  endcase
end
endmodule