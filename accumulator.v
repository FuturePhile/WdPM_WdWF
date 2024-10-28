module accumulator (
  input [7:0] IN,
  input CE,
  input CLK,
  output reg [7:0] OUT
);

always @(posedge CLK) begin
  if(CE) begin
    OUT <= IN;
  end
end

endmodule