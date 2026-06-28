# Parameterized 16-bit ALU (Verilog HDL)

## Project Overview

This project implements a parameterized 16-bit Arithmetic Logic Unit (ALU) in Verilog HDL. The ALU performs arithmetic, logical, shift, comparison, and data transfer operations based on a 4-bit opcode. The design has been functionally verified using directed, corner-case, and random test cases and synthesized using Yosys.

---

## Features

- Parameterized 16-bit architecture
- 16 ALU operations
- Carry Flag
- Zero Flag
- Overflow Flag
- Negative Flag
- Synthesizable RTL
- Gate-level netlist generation
- Functional verification
- Random verification

---

## Supported Operations

| Opcode | Operation |
|---------|-----------|
|0000|Addition|
|0001|Subtraction|
|0010|AND|
|0011|OR|
|0100|XOR|
|0101|NOT A|
|0110|Shift Left|
|0111|Shift Right|
|1000|Multiply|
|1001|Increment|
|1010|Decrement|
|1011|Pass A|
|1100|Pass B|
|1101|NAND|
|1110|NOR|
|1111|XNOR|

---

## Project Structure

```
Parameterized_16-ALU/
│
├── docs/
├── images/
├── lint/
├── rtl/
├── schematic/
├── scripts/
├── sim/
├── synthesis/
├── tb/
├── waveforms/
└── README.md
```

---

## Verification Summary

- Directed Tests : 16/16 Passed
- Corner Cases : 24/24 Passed
- Random Tests : 100/100 Passed

Total PASS = **140**

Total FAIL = **0**

---

## Tools Used

- Verilog HDL
- GTKWave
- Yosys
- Verilator
- Graphviz
- OSS CAD Suite
- Visual Studio Code

---

## Results

- RTL Schematic Generated
- Gate-Level Netlist Generated
- Gate-Level Schematic Generated
- Functional Verification Passed
- Random Verification Passed
- Lint Check Passed

---

## Author

**Korrapati Hemanjana Kumari**

B.Tech (ECE)

Aspiring RTL Design / Design Verification Engineer