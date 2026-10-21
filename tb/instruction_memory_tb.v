module instruction_memory_tb;

reg [31:0] addr;
wire [31:0] instruction;

instruction_memory uut (
    .addr(addr),
    .instruction(instruction)
);

initial begin
    // Initialize the instruction memory with some test instructions
    uut.memory[0] = 32'h00000013; // NOP
    uut.memory[1] = 32'h00000093; // ADDI x1, x0, 0
    uut.memory[2] = 32'h00100113; // ADDI x2, x0, 1
    uut.memory[3] = 32'h00208193; // ADDI x3, x1, 2
    uut.memory[4] = 32'h00310213; // ADDI x4, x2, 3
    uut.memory[5] = 32'h00418293; // ADDI x5, x3, 4
    uut.memory[6] = 32'h00520313; // ADDI x6, x4, 5
    uut.memory[7] = 32'h00628393; // ADDI x7, x5, 6
    uut.memory[8] = 32'h00730413; // ADDI x8, x6, 7
    uut.memory[9] = 32'h00838493; // ADDI x9, x7, 8
    uut.memory[10] = 32'h00940513; // ADDI x10, x8, 9
end


initial begin
    $dumpfile("waves/instruction_memory.vcd");
    $dumpvars(0, instruction_memory_tb);
    $monitor("Time: %0t | addr: %d | instruction: %h", $time, addr, instruction);
    
    // Test case 1: Read from address 0
    addr = 32'd0;
    #10;
    
    // Test case 2: Read from address 4
    addr = 32'd4;
    #10;
    
    // Test case 3: Read from address 8
    addr = 32'd8;
    #10;
    
    // Test case 4: Read from address 12
    addr = 32'd12;
    #10;
    
    // Test case 5: Read from address 16
    addr = 32'd16;
    #10;

    $finish;
end

endmodule
