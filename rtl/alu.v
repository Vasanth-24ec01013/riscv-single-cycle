module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_control,
    output reg [31:0] ALU_result,
    output reg zero
);

always @(*) begin
    case (ALU_control)
        4'b0000: ALU_result = A & B; // AND
        4'b0001: ALU_result = A | B; // OR
        4'b0010: ALU_result = A + B; // ADD
        4'b0110: ALU_result = A - B; // SUBTRACT
        4'b0111: ALU_result = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0; // SLT
        4'b1100: ALU_result = ~(A | B); // NOR
        4'b0011: ALU_result = A ^ B; // XOR
        default: ALU_result = 32'b0; // Default case
    endcase

    zero = (ALU_result == 32'b0) ? 1'b1 : 1'b0;
end



endmodule
