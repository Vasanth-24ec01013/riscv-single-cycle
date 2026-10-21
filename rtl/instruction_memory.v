module instruction_memory(
    input [31:0] addr,
    output reg [31:0] instruction
);
reg [31:0] memory [0:255]; // 256 words of 32-bit instruction memory

always @(*) begin
    instruction = memory[addr[31:2]];
end

endmodule