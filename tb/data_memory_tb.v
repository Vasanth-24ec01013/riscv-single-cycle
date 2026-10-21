module data_memory_tb;

reg [31:0] addr;
reg [31:0] write_data;
reg clk;
reg MemRead;
reg MemWrite;
wire [31:0] read_data;

data_memory uut (
    .addr(addr),
    .write_data(write_data),
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .read_data(read_data)
);

always  #5 clk = ~clk; // Clock generation



initial begin
    $dumpfile("waves/data_memory.vcd");
    $dumpvars(0, data_memory_tb);
    // Initialize signals
    clk = 0;
    addr = 0;
    write_data = 0;
    MemRead = 0;
    MemWrite = 0;

    // Write data to memory
    #6 MemWrite = 1; write_data = 32'hDEADBEEF; addr = 4; // Write to address 4
    #10 MemWrite = 0; // Stop writing

    // Read data from memory
    #6 MemRead = 1; addr = 4; // Read from address 4
    #10 MemRead = 0; // Stop reading

    // Finish simulation
    #10 $finish;
end


endmodule