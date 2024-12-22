# EE6361---Advance-Topics-in-VLSI
# VLSI Assignments Repository

This repository contains solutions to a series of VLSI assignments focused on designing and simulating a simple processor (IIT6361-µP101) using Verilog. The assignments progressively build components of the processor, including memory design, an execution unit, and a control unit, with each step validated through testbench simulations.

---

## Assignments Overview

### **Assignment 1: Register Memory Design**
- **Objective**: 
  - Design a memory with 32 registers of 8 bits each.
  - Control read and write operations using enable signals.
  - Use a 5:32 decoder to manage address lines.
- **Tasks**:
  - Implement read/write operations on selected registers.
  - Move data between registers.
  - Verify the implementation using a testbench.
- **Verilog Features**:
  - Flip-flop and register design.
  - Address decoding logic.
- **Key Concepts**:
  - Memory hierarchy in processors.
  - Signal-driven operations for data movement.

---

### **Assignment 2: Execution Unit Design**
- **Objective**:
  - Develop an execution unit for the processor using Verilog.
  - Implement a 4-function ALU with the following operations:
    - ADD
    - SUBTRACT
    - COMPARE
    - INCREMENT
- **Tasks**:
  - Use the register memory from Assignment 1.
  - Implement a flag register to track conditions (e.g., carry, zero, comparison results).
  - Write testbench code to execute a series of instructions:
    1. Load values into registers.
    2. Move data between registers.
    3. Perform arithmetic and logical operations.
    4. Execute loops for sum accumulation.
    5. Find the largest value among multiple registers.
- **Key Concepts**:
  - ALU design and function select lines.
  - Flag register implementation.
  - Simulation and debugging using testbenches.

---

### **Assignment 3: Control Unit Design**
- **Objective**:
  - Design a control unit to automate instruction execution for the processor.
- **Tasks**:
  - Define opcodes for instructions (`LOAD`, `MOV`, `ADD`, `SUB`, `INC`, `CMP`, `JMP`).
  - Combine the control unit with the execution unit from Assignment 2.
  - Implement modules:
    - Program Counter
    - Program Memory
    - Execution Unit Control Logic (EUCL)
    - Program Flow Control Logic (PFCL)
  - Simulate instructions for tasks such as data movement, arithmetic operations, and condition checking.
- **Key Concepts**:
  - Instruction decoding and control signals.
  - Modular processor design.

---


