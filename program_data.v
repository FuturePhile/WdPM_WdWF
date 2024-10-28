module program_data (
  input wire [4:0] ADDR,
  output reg [5:0] DATA
);
  
  reg [5:0] MEM [0:31];

initial begin
  MEM[0] = 6'b000000;
  //Pamięć programu
end

always @(ADDR) begin
  DATA <= MEM[ADDR];
end

endmodule