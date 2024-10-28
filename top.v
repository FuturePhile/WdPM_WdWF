module top (
    input wire CLK,
    input wire nRST,
    input wire [7:0] RZ,
    output wire [7:0] RESULT
);

  wire [4:0] pc_out;
  wire [5:0] pd_out;
  wire acc_ce;
  wire [2:0] alu_op;
  wire [1:0] rf_a;
  wire [2:0] rf_sel;
  wire [7:0] rf_out;
  wire [7:0] acc_in;
  wire [7:0] acc_out;

  pc u_pc(
    .CLK(CLK),
    .nRST(nRST),
    .OUT(pc_out)
  );

  program_data u_program_data(
    .ADDR(pc_out),
    .DATA(pd_out)
  );

  instruction_decoder u_instruction_decoder(
    .DATA(pd_out),
    .ACC_CE(acc_ce),
    .ALU_OP(alu_op),
    .RF_A(rf_a),
    .RF_SEL(rf_sel)
  );

  reg_file u_reg_file(
    .CLK(CLK),
    .SEL(rf_sel),
    .ADDR(rf_a),
    .RZ(RZ),
    .IN(acc_out),
    .OUT(rf_out)
  );

  alu u_alu(
    .OP(alu_op),
    .A(acc_out),
    .R(rf_out),
    .CY(),
    .OUT(acc_in)
  );

  accumulator u_accumulator(
    .IN(acc_in),
    .CE(acc_ce),
    .CLK(CLK),
    .OUT(acc_out)
  );

endmodule