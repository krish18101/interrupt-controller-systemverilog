# Interrupt Controller with Programmable Timer (SystemVerilog)

This project is a **SystemVerilog-based interrupt controller** designed as a learning project to understand how interrupts are handled in a basic SoC.  
It includes a **programmable timer**, external interrupts, masking, priority resolution, and CPU acknowledge logic.

The design was written in **SystemVerilog**, simulated at RTL level, and then synthesized and verified using **post-synthesis gate-level simulation in Vivado**.

---

## Features

- Programmable timer interrupt  
- Multiple external interrupt inputs  
- Interrupt pending logic (latched until cleared)  
- Interrupt enable and mask support  
- Fixed-priority interrupt resolver  
- CPU acknowledge and interrupt clear mechanism  
- Parameterized design (number of interrupts can be changed)  

---

## Block Overview

The interrupt system is divided into small modules:

- **Timer IP**  
  Generates an interrupt when a programmable counter reaches a compare value.

- **Interrupt Pending Logic**  
  Stores interrupt requests until they are cleared by the CPU.

- **Interrupt Enable / Mask Logic**  
  Allows software to enable or temporarily mask interrupts.

- **Priority Resolver**  
  Selects the highest-priority active interrupt.

- **Interrupt Acknowledge / Clear Logic**  
  Clears the interrupt once the CPU has serviced it.

- **Top-Level Controller**  
  Connects all sub-modules together.

---



## Simulation and Verification

- RTL simulation was done using **Vivado XSim**.
- After synthesis, **post-synthesis functional gate-level simulation (GLS)** was performed.
- The synthesized gate-level schematic was inspected to observe LUTs, flip-flops, and clock buffers.

This helped in understanding how SystemVerilog RTL maps to actual hardware primitives.

---

## Tools Used

- SystemVerilog  
- Xilinx Vivado (XSim)  
- Post-synthesis functional simulation  

---

## Notes

- This is an **FPGA-based project**, not an ASIC tape-out.
- Gate-level view shown in screenshots is FPGA synthesized logic, not physical ASIC layout.
- The project was created for **learning and practice purposes**.

---

## What I Learned

- How interrupt controllers are structured internally  
- Difference between RTL simulation and gate-level simulation  
- How synthesis converts RTL into hardware primitives  
- Importance of clean modular design in SystemVerilog  

---

## Future Improvements

- Add assertions (SVA) for better verification  
- Add an AXI-lite interface for configuration  
- Support nested or programmable priorities  

---

## Author

Student VLSI / Digital Design learner  

