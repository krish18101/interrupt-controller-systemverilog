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

## Project Structure

