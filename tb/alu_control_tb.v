module alu_control_tb;

reg [6:0] opcode;
reg [2:0] funct3;  
reg [6:0] funct7;
wire [3:0] ALU_control;

alu_control alu_control_inst (
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .ALU_control(ALU_control)
);

initial begin

    $dumpfile("waves/alu_control.vcd");
    $dumpvars(0, alu_control_tb);
    $monitor("Time: %0t | opcode: %b | funct3: %b | funct7: %b | ALU_control: %b", $time, opcode, funct3, funct7, ALU_control);

    // Test cases for different opcodes and funct3/funct7 combinations
    opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0000000; // ADD
    #10;
    opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0100000; // SUB
    #10;
    opcode = 7'b0110011; funct3 = 3'b111; funct7 = 7'b0000000; // AND
    #10;
    opcode = 7'b0110011; funct3 = 3'b110; funct7 = 7'b0000000; // OR
    #10;
    opcode = 7'b0110011; funct3 = 3'b010; funct7 = 7'b0000000; // SLT
    #10;
    opcode = 7'b0010011; funct3 = 3'b000; funct7 = 7'b0000000; // ADDI
    #10;
    opcode = 7'b0010011; funct3 = 3'b111; funct7 = 7'b0000000; // ANDI
    #10;
    opcode = 7'b0010011; funct3 = 3'b110; funct7 = 7'b0000000; // ORI
    #10;
    opcode = 7'b0110011; funct3 = 3'b100; funct7 = 7'b0000000; // XOR
    #10;
    opcode = 7'b0000011; funct3 = 3'b010; funct7 = 7'b0000000; // LW
    #10;
    opcode = 7'b0100011; funct3 = 3'b010; funct7 = 7'b0000000; // SW
    #10;
    opcode = 7'b1100011; funct3 = 3'b000; funct7 = 7'b0000000; // BEQ
    #10;


end




endmodule