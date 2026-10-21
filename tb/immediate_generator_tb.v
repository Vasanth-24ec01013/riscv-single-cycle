module immediate_generator_tb;

reg [31:0] instruction;
wire [31:0] immediate;

immediate_generator uut (
    .instruction(instruction),
    .immediate(immediate)
);

initial begin

$dumpfile("waves/immediate_generator.vcd");
$dumpvars(0, immediate_generator_tb);
$monitor("Time: %0t | instruction: %h | immediate: %d", $time, instruction, immediate);

    instruction = 32'h00000013; // NOP
    #10;
    instruction = 32'h00000093; // ADDI x1, x0, 0
    #10;    
    instruction = 32'h00100113; // ADDI x2, x0, 1
    #10;
    instruction = 32'h00200193; // ADDI x3, x0, 2
    #10;
    instruction = 32'h00300213; // ADDI x4, x0, 3
    #10;
    instruction = 32'h00400293; // ADDI x5, x0, 4
    #10;
    instruction = 32'h00500313; // ADDI x6, x0, 5
    #10;
    $finish;

end



endmodule