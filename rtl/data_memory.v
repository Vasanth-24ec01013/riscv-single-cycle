module data_memory(
    input [31:0] addr,
    input [31:0] write_data,
    input clk,
    input MemRead,
    input MemWrite,
    output reg [31:0] read_data
);

reg [31:0] memory [0:255]; // 256 words of 32-bit data memory

always @(*) begin
    if (MemRead) begin
        read_data = memory[addr[31:2]];
    end else begin
        read_data = 32'b0;
    end
end

always @(posedge clk) begin
    if (MemWrite) begin
        memory[addr[31:2]] <= write_data;
    end
    else begin
        memory[addr[31:2]] <= memory[addr[31:2]];
    end
end

endmodule