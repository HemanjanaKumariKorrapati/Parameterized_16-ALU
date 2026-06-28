# Functional Verification Report

## Project

**Parameterized 16-bit ALU (Verilog HDL)**

---

# Verification Summary

| Test ID | Test Category   | Operation                     | Status |
| :-----: | --------------- | ----------------------------- | :----: |
|    1    | Directed Test   | Addition                      | ✅ Pass |
|    2    | Directed Test   | Subtraction                   | ✅ Pass |
|    3    | Directed Test   | AND                           | ✅ Pass |
|    4    | Directed Test   | OR                            | ✅ Pass |
|    5    | Directed Test   | XOR                           | ✅ Pass |
|    6    | Directed Test   | NOT                           | ✅ Pass |
|    7    | Directed Test   | Shift Left                    | ✅ Pass |
|    8    | Directed Test   | Shift Right                   | ✅ Pass |
|    9    | Directed Test   | Multiply                      | ✅ Pass |
|    10   | Directed Test   | Increment                     | ✅ Pass |
|    11   | Directed Test   | Decrement                     | ✅ Pass |
|    12   | Directed Test   | Pass A                        | ✅ Pass |
|    13   | Directed Test   | Pass B                        | ✅ Pass |
|    14   | Directed Test   | NAND                          | ✅ Pass |
|    15   | Directed Test   | NOR                           | ✅ Pass |
|    16   | Directed Test   | XNOR                          | ✅ Pass |
|    17   | Corner Test     | Addition (Zero Result)        | ✅ Pass |
|    18   | Corner Test     | Addition (Carry Out)          | ✅ Pass |
|    19   | Corner Test     | Addition (Signed Overflow)    | ✅ Pass |
|    20   | Corner Test     | Addition (Negative Overflow)  | ✅ Pass |
|    21   | Corner Test     | Subtraction (Zero Result)     | ✅ Pass |
|    22   | Corner Test     | Subtraction (Negative Result) | ✅ Pass |
|    23   | Corner Test     | Subtraction (Overflow)        | ✅ Pass |
|    24   | Corner Test     | AND (All Ones)                | ✅ Pass |
|    25   | Corner Test     | AND (Zero Output)             | ✅ Pass |
|    26   | Corner Test     | OR (Zero Output)              | ✅ Pass |
|    27   | Corner Test     | XOR (Same Inputs)             | ✅ Pass |
|    28   | Corner Test     | NOT (Zero Input)              | ✅ Pass |
|    29   | Corner Test     | Shift Left (MSB Boundary)     | ✅ Pass |
|    30   | Corner Test     | Shift Right (LSB Boundary)    | ✅ Pass |
|    31   | Corner Test     | Multiply (Zero Operand)       | ✅ Pass |
|    32   | Corner Test     | Multiply (Identity Operand)   | ✅ Pass |
|    33   | Corner Test     | Increment (Maximum Value)     | ✅ Pass |
|    34   | Corner Test     | Increment (Boundary Overflow) | ✅ Pass |
|    35   | Corner Test     | Decrement (Zero Input)        | ✅ Pass |
|    36   | Corner Test     | Pass A (Boundary Value)       | ✅ Pass |
|    37   | Corner Test     | Pass B (Boundary Value)       | ✅ Pass |
|    38   | Corner Test     | NAND (All Ones)               | ✅ Pass |
|    39   | Corner Test     | NOR (All Zeros)               | ✅ Pass |
|    40   | Corner Test     | XNOR (Same Inputs)            | ✅ Pass |
|  41-140 | Randomized Test | 100 Random Input Combinations | ✅ Pass |

---

# Verification Statistics

| Verification Type        |   Count | Status |
| ------------------------ | ------: | :----: |
| Directed Tests           |      16 | ✅ Pass |
| Corner Case Tests        |      24 | ✅ Pass |
| Randomized Tests         |     100 | ✅ Pass |
| **Total Tests Executed** | **140** | ✅ Pass |

---

# Simulation Result

```text
PASS = 140
FAIL = 0
```

---

# Conclusion

The Parameterized 16-bit ALU successfully passed all **140 verification tests**, including **16 directed tests**, **24 corner-case tests**, and **100 randomized tests**. All arithmetic, logical, shift, pass-through, and flag-generation operations behaved according to the design specification. No functional mismatches were observed during simulation, confirming that the RTL implementation is functionally correct and ready for synthesis.
