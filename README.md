# Single-Cycle RISC-V CPU in Verilog

A 32-bit single-cycle RISC-V processor implemented in Verilog HDL, with a self-checking testbench for functional verification.

## Project Overview

This project implements a simple RISC-V CPU with instruction decoding, arithmetic and logical operations, register-file access, memory operations, and control-flow handling.

## Architecture

The processor consists of the following modules:

- Program Counter (PC)
- Instruction Memory
- Register File
- Immediate Generator
- Control Unit
- ALU Control
- Arithmetic Logic Unit (ALU)
- Data Memory
- Next-PC Logic

## Supported Instructions

The current implementation includes selected instructions:

- Arithmetic: `ADD`, `SUB`, `ADDI`
- Logical: `AND`, `OR`, `XOR`, `ANDI`, `ORI`
- Comparison: `SLT`
- Memory: `LW`, `SW`
- Control flow: `BEQ`, `BNE`, `JAL`

This is a learning project and does not implement the complete RISC-V instruction set.

## Project Structure

```text
riscv-single-cycle/
├── rtl/       # CPU Verilog modules
├── tb/        # Testbenches
├── programs/  # Test programs
├── sim/       # Simulation files and scripts
├── waves/     # Generated waveforms
└── README.md
```

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- Git and GitHub

## Run the Testbench

From the project root, run:

```powershell
iverilog -g2012 -s riscv_cpu_tb -o sim/cpu_sim rtl/*.v tb/riscv_cpu_tb.v
vvp sim/cpu_sim
```

A successful test run should display:

```text
ALL TESTS PASSED
```

## Future Improvements

- Expand instruction-level verification.
- Add support for additional RISC-V instructions, including `JALR`.
- Improve automated regression testing.
- Explore FPGA synthesis, resource utilization, and timing analysis.

## Author

Vasanth-24ec01013
