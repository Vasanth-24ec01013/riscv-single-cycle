module alu_tb;

reg [31:0] A;
reg [31:0] B;
reg [3:0] ALU_control;
wire [31:0] ALU_result;
wire zero;


alu alu_inst (
    .A(A),
    .B(B),
    .ALU_control(ALU_control),
    .ALU_result(ALU_result),
    .zero(zero)
);

initial begin
    $dumpfile("waves/alu.vcd");
    $dumpvars(0, alu_tb);
    $monitor("Time: %0t | A: %d | B: %d | ALU_control: %b | ALU_result: %d | zero: %b", $time, A, B, ALU_control, ALU_result, zero);

    // Test cases
    A = 32'd3; B = 32'd4; ALU_control = 4'b0010; // ADD
    #10;
    A = 32'd10; B = 32'd5; ALU_control = 4'b0110; // SUBTRACT
    #10;
    A = 32'd10; B = 32'd5; ALU_control = 4'b0000; // AND
    #10;
    A = 32'd10; B = 32'd5; ALU_control = 4'b0001; // OR
    #10;
    A = -32'd10; B = 32'd5; ALU_control = 4'b0111; // SLT
    #10;
    A = 32'd10; B = 32'd5; ALU_control = 4'b1100; // NOR
    #10;

    $finish;

end


endmodule