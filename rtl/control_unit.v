module control_unit(

input [6:0] opcode,

output reg RegWrite,
output reg MemRead,
output reg MemWrite,
output reg Branch,
output reg ALUSrc,
output reg Jump,
output reg MemToReg

);

always @(*) begin
    // Default values for control signals
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    ALUSrc = 0;
    Jump = 0;
    MemToReg = 0;

    case (opcode)
        7'b0110011: begin // R-type instructions
            RegWrite = 1;
            ALUSrc = 0;
            MemToReg = 0;
        end
        7'b0010011: begin // I-type instructions
            RegWrite = 1;
            ALUSrc = 1;
            MemToReg = 0;
        end
        7'b0000011: begin // Load instructions
            RegWrite = 1;
            MemRead = 1;
            ALUSrc = 1;
            MemToReg = 1;
        end
        7'b0100011: begin // Store instructions
            MemWrite = 1;
            ALUSrc = 1;
        end
        7'b1100011: begin // Branch instructions
            Branch = 1;
            ALUSrc = 0;
        end
        7'b1101111: begin // Jump instructions
            Jump = 1;
            RegWrite = 1;
        end
        default: begin
            // Default case for unrecognized opcodes
        
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUSrc = 0;
        Jump = 0;
        MemToReg = 0;

        
        end
    endcase

end


endmodule
