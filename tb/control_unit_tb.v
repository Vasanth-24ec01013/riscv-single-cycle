module control_unit_tb;

reg [6:0] opcode;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire Branch;
wire ALUSrc;
wire Jump;
wire MemToReg;

control_unit cu_inst (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUSrc(ALUSrc),
    .Jump(Jump),
    .MemToReg(MemToReg)
);



initial begin
    $dumpfile("waves/control_unit.vcd");
    $dumpvars(0, control_unit_tb);
    $monitor("Time: %0t | opcode: %b | RegWrite: %b | MemRead: %b | MemWrite: %b | Branch: %b | ALUSrc: %b | Jump: %b | MemToReg: %b", $time, opcode, RegWrite, MemRead, MemWrite, Branch, ALUSrc, Jump, MemToReg);

    // Test cases for different opcodes
    opcode = 7'b0110011; // R-type
    #10;
    opcode = 7'b0010011; // I-type
    #10;
    opcode = 7'b0000011; // Load
    #10;
    opcode = 7'b0100011; // Store
    #10;
    opcode = 7'b1100011; // Branch
    #10;
    opcode = 7'b1101111; // Jump
    #10;

    $finish;
end

endmodule