module alu_control( 
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] ALU_control
);

always @(*) begin
    case (opcode)
        7'b0110011: begin // R-type instructions
            case ({funct7, funct3})
                10'b0000000000: ALU_control = 4'b0010; // ADD
                10'b0100000000: ALU_control = 4'b0110; // SUB
                10'b0000000111: ALU_control = 4'b0000; // AND
                10'b0000000110: ALU_control = 4'b0001; // OR
                10'b0000000010: ALU_control = 4'b0111; // SLT
                10'b0000000100: ALU_control = 4'b0011; // XOR
                default: ALU_control = 4'b1111; // Default case for unrecognized funct3/funct7 combinations
            endcase
        end
        7'b0010011: begin // I-type instructions
            case (funct3)
                3'b000: ALU_control = 4'b0010; // ADDI
                3'b111: ALU_control = 4'b0000; // ANDI
                3'b110: ALU_control = 4'b0001; // ORI
                default: ALU_control = 4'b1111; // Default case for unrecognized funct3 combinations
            endcase
        end
        7'b0000011: ALU_control = 4'b0010; // Load instructions (ADD for address calculation)
        7'b0100011: ALU_control = 4'b0010; // Store instructions (ADD for address calculation)
        7'b1100011: ALU_control = 4'b0110; // Branch instructions (SUB for comparison)
        7'b1101111: ALU_control = 4'b0010; // Jump instructions (ADD for address calculation)
        7'b1100111: ALU_control = 4'b0010; // JALR instructions (ADD for address calculation)
               


        default: ALU_control = 4'b1111; // Default case for unrecognized opcodes
    endcase
end



endmodule