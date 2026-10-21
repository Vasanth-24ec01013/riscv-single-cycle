module regfile(
      input [4:0] read_reg1,
      input [4:0] read_reg2,
      input [4:0] write_reg,
      input [31:0] write_data,
      input write_enable,   
      input clk   ,
      input rst   ,
      output reg [31:0] read_data1,
      output reg [31:0] read_data2
);

reg [31:0] registers [0:31]; // 32 registers of 32 bits each

always @(*) begin
    read_data1 = (read_reg1 == 5'b0) ? 32'b0 : registers[read_reg1];
    read_data2 = (read_reg2 == 5'b0) ? 32'b0 : registers[read_reg2];
end

integer i;

always @(posedge clk) begin
    if (rst) begin
        for (i = 0; i < 32; i = i + 1)
            registers[i] <= 32'b0;
    end else if (write_enable && write_reg != 5'b0) begin
        registers[write_reg] <= write_data;
    end
end


endmodule