`timescale 1ns/1ps
module riscv_cpu_tb;
reg clk = 0;
reg rst = 0;
integer errors = 0;
integer i;
riscv_cpu dut (.clk(clk), .rst(rst));
always #5 clk = ~clk;

task check_reg;
input integer index;
input [31:0] expected;
begin
  if (dut.regfile_inst.registers[index] !== expected) begin
    $display("FAIL x%0d: got %h expected %h", index, dut.regfile_inst.registers[index], expected);
    errors = errors + 1;
  end else $display("PASS x%0d = %h", index, expected);
end
endtask

initial begin
  $dumpfile("waves/riscv_cpu.vcd");
  $dumpvars(0, riscv_cpu_tb);
  for (i=0; i<32; i=i+1) dut.regfile_inst.registers[i] = 0;
  for (i=0; i<256; i=i+1) begin
    dut.instruction_memory_inst.memory[i] = 32'h00000013; // NOP
    dut.data_memory_inst.memory[i] = 0;
  end
  $readmemh("programs/test_program.hex", dut.instruction_memory_inst.memory);
  #2;
    // Generate a real rising edge on reset
  #1;
  rst = 1'b1;
  #1;

  if (dut.pc_value !== 32'b0) begin
      $display("FAIL reset PC: got %h expected 00000000",
               dut.pc_value);
      errors = errors + 1;
  end else begin
      $display("PASS reset PC");
  end

  // Keep reset active until the falling clock edge
  @(negedge clk);
  rst = 1'b0;
  repeat (18) @(negedge clk);
  #1;
  check_reg(1, 32'd10);
  check_reg(2, 32'd3);
  check_reg(3, 32'd13);
  check_reg(4, 32'd7);
  check_reg(5, 32'd2);
  check_reg(6, 32'd11);
  check_reg(7, 32'd9);
  check_reg(8, 32'd1);
  check_reg(9, 32'd13);
  check_reg(10, 32'd0);
  check_reg(11, 32'd0);
  check_reg(12, 32'd60);
  check_reg(13, 32'd0);
  check_reg(14, 32'd5);
  if (dut.data_memory_inst.memory[0] !== 32'd13) begin
    $display("FAIL memory[0]"); errors=errors+1;
  end else $display("PASS memory[0] = 13");
  if (errors == 0) $display("ALL TESTS PASSED");
  else $display("TESTS FAILED: %0d errors", errors);
  $finish;
end
endmodule
