module regfile_tb;

reg [4:0]read_reg1;
reg [4:0] read_reg2;
reg [4:0] write_reg;
reg [31:0] write_data;
reg write_enable;
reg clk;
wire [31:0] read_data1;
wire [31:0] read_data2;



regfile uut (
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(write_data),
    .write_enable(write_enable),
    .clk(clk),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

initial begin
clk = 0;
end

always begin
    #5 clk = ~clk;
end

initial begin

$dumpfile("waves/regfile.vcd");
$dumpvars(0, regfile_tb);
$monitor("Time: %0t | clk: %b | write_enable: %b | write_reg: %d | write_data: %d | read_reg1: %d | read_data1: %d | read_reg2: %d | read_data2: %d", $time, clk, write_enable, write_reg, write_data, read_reg1, read_data1, read_reg2, read_data2);


#1 write_enable = 1;
write_reg = 5'd1;
write_data = 32'd10;

#6 write_enable = 0;

#3 read_reg1 = 5'd1;

#20;
$finish;



end





endmodule
