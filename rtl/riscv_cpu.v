module riscv_cpu(input clk, input rst);

wire [31:0] instruction;
wire [31:0] pc_value;
wire [31:0] immediate;
reg [31:0] next_pc;

wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;

reg [31:0] write_reg_data;
wire [31:0] read_data1;
wire [31:0] read_data2;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire Branch;
wire ALUSrc;
wire Jump;
wire MemToReg;

wire [3:0] ALU_control;

wire [31:0] alu_input_b;

assign alu_input_b = ALUSrc ? immediate : read_data2;

wire alu_zero;
wire [31:0] alu_result;


wire [31:0] read_data_dm;





 pc pc_inst (
    .next_pc(next_pc),
    .rst(rst),
    .clk(clk),
    .pc(pc_value)
);

 instruction_memory instruction_memory_inst (
    .addr(pc_value),
    .instruction(instruction)
);

immediate_generator immediate_generator_inst (
    .instruction(instruction),
    .immediate(immediate)
);


assign opcode = instruction[6:0];
assign rd = instruction[11:7];
assign funct3 = instruction[14:12];
assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign funct7 = instruction[31:25];

regfile regfile_inst (
    .clk(clk),
    .rst(rst),
    .read_reg1(rs1),
    .read_reg2(rs2),
    .write_reg(rd),
    .write_data(write_reg_data),
    .write_enable(RegWrite), // 
    .read_data1(read_data1), // Values in the regfile
    .read_data2(read_data2)  // Values in the regfile
);


control_unit control_unit_inst (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUSrc(ALUSrc),
    .Jump(Jump),
    .MemToReg(MemToReg)
);

alu_control alu_control_inst (
    .funct7(funct7),
    .funct3(funct3),
    .opcode(opcode),
    .ALU_control(ALU_control)
);


alu alu_inst (
    .A(read_data1),
    .B(alu_input_b),
    .ALU_control(ALU_control),
    .zero(alu_zero),
    .ALU_result(alu_result)
);


data_memory data_memory_inst (
    .addr(alu_result),
    .write_data(read_data2),
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .read_data(read_data_dm)
);


always @(*) begin
    case (opcode)

        7'b0110011: begin // R-type instructions
            write_reg_data = alu_result;
        end

        7'b0010011: begin // I-type instructions
            write_reg_data = alu_result;
        end

        7'b0000011: begin // Load instructions
                write_reg_data = read_data_dm;
        end

        7'b1101111: begin // Jump instructions
            write_reg_data = pc_value + 4; // Store the return address in rd
        end

        default: begin
            write_reg_data = 32'b0; // Default case for unrecognized opcodes
        end

    endcase
end


always @(*) begin
    // Default next_pc value
    next_pc = pc_value + 4;

    case (opcode)

        // Branch instructions
        7'b1100011: begin
            case (funct3)

                // BEQ
                3'b000: begin
                    if (alu_zero) begin
                        next_pc = pc_value + immediate;
                    end
                end

                // BNE
                3'b001: begin
                    if (!alu_zero) begin
                        next_pc = pc_value + immediate;
                    end
                end

                default: begin
                    next_pc = pc_value + 4;
                end

            endcase
        end

        // JAL
        7'b1101111: begin
            next_pc = pc_value + immediate;
        end

        default: begin
            next_pc = pc_value + 4;
        end

    endcase
end



endmodule