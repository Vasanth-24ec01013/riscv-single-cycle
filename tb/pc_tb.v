module pc_tb;
 reg clk;
 reg rst;
 reg [31:0] next_pc;

wire [31:0] pc;


always begin
    #5 clk = ~clk;
end



pc uut (
    .next_pc(next_pc),
    .rst(rst),
    .clk(clk),
    .pc(pc)
);
initial begin
    $dumpfile("waves/pc.vcd");
    $dumpvars(0, pc_tb);
   $monitor("Time: %0t | rst: %b | next_pc: %d | pc: %d", $time, rst, next_pc, pc);
    clk = 0;
    rst = 1;
    next_pc = 32'b0;
    #10 rst = 0;
    #10 next_pc = 32'd4;
    #10 next_pc = 32'd8;
    #10 next_pc = 32'd12;
    #10 next_pc = 32'd16;
    #10 $finish;
end
endmodule