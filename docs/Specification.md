# Parameterized 16-bit ALU Specification

## Project Overview

The Parameterized 16-bit Arithmetic Logic Unit (ALU) is a combinational digital circuit designed to perform arithmetic and logical operations on two input operands based on a 4-bit opcode.

The ALU is parameterized, allowing the data width to be easily changed by modifying a single parameter without changing the internal logic.

---

# Objectives

- Design a synthesizable parameterized ALU.
- Support arithmetic and logical operations.
- Generate useful status flags.
- Follow industry coding practices.
- Verify functionality using a self-checking testbench.
- Make the project suitable for GitHub, LinkedIn, and resume.

---

# Design Parameter

| Parameter | Value |
|-----------|-------|
| WIDTH | 16 (Default) |

Changing WIDTH should automatically change the ALU size.

Examples:

WIDTH = 8

WIDTH = 16

WIDTH = 32

WIDTH = 64

---

# Inputs

| Signal | Width | Description |
|---------|------|-------------|
| A | WIDTH | First Operand |
| B | WIDTH | Second Operand |
| opcode | 4 | Operation Selection |

---

# Outputs

| Signal | Width | Description |
|---------|------|-------------|
| result | WIDTH | ALU Output |
| carry_out | 1 | Carry generated during arithmetic operations |
| zero_flag | 1 | HIGH when result equals zero |
| overflow_flag | 1 | Signed overflow indicator |
| negative_flag | 1 | HIGH when MSB of result is 1 |

---

# Supported Operations

| Opcode | Operation |
|---------|-----------|
|0000|Addition|
|0001|Subtraction|
|0010|Bitwise AND|
|0011|Bitwise OR|
|0100|Bitwise XOR|
|0101|Bitwise NOT (A)|
|0110|Logical Left Shift|
|0111|Logical Right Shift|
|1000|Multiplication (Lower WIDTH bits)|
|1001|Increment A|
|1010|Decrement A|
|1011|Pass A|
|1100|Pass B|
|1101|NAND|
|1110|NOR|
|1111|XNOR|

---

# Status Flags

## Carry Flag

Generated during arithmetic operations when a carry is produced.

---

## Zero Flag

Set to 1 whenever

result == 0

---

## Negative Flag

Equal to the Most Significant Bit (MSB) of result.

negative_flag = result[WIDTH-1]

---

## Overflow Flag

Indicates signed overflow during addition and subtraction.

---

# Design Requirements

- Parameterized design
- Pure combinational logic
- Synthesizable RTL
- Verilator lint clean
- Self-checking verification
- Comprehensive corner test cases
- Randomized testing
- RTL schematic generation
- Gate-level schematic generation
- Yosys synthesis compatible

---

# Verification Requirements

The verification environment shall include:

- Directed test cases
- Corner test cases
- Randomized testing
- PASS/FAIL reporting
- Waveform generation (.vcd)

---

# Tools

- Visual Studio Code
- Verilator
- Icarus Verilog
- GTKWave
- Yosys
- Graphviz
- Git
- GitHub

---

# Expected Deliverables

- RTL Design
- Testbench
- Waveforms
- RTL Schematic
- Gate-Level Schematic
- Synthesized Netlist
- Synthesis Report
- GitHub Repository
- Professional README
- LinkedIn Project Post