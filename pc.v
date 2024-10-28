module pc (
  input CLK,
  input nRST,
  output reg [4:0] OUT
);

always @(posedge CLK) begin
  if (nRST == 0) begin
    OUT <= 0;
  end else begin
    OUT <= OUT + 1;
  end
end

endmodule