# Synchronous FIFO Design Using Verilog HDL

A digital design project to implement and verify a synchronous First-In, First-Out (FIFO) buffer using Verilog HDL. This project is part of my RTL design learning journey, focusing on sequential logic, memory management, pointer control, and functional verification.

## Project Status

🚧 **In Progress**

## Overview

A synchronous FIFO is a memory buffer in which data is read in the same order it was written (First-In, First-Out). Read and write operations are synchronized to a common clock.

The objective of this project is to design a parameterized FIFO, implement its control logic, and verify its functionality through simulation using Icarus Verilog.

## Design Specifications

| Parameter | Specification |
|---|---|
| Hardware Description Language | Verilog HDL |
| Architecture | Synchronous FIFO |
| Clock | Single clock domain |
| Data Width | 8 bits (planned) |
| FIFO Depth | 16 entries (planned) |
| Reset | Synchronous, active-high (planned) |
| Simulation Tool | Icarus Verilog |
| Waveform Viewer | GTKWave (optional) |

*Specifications may be refined during development.*

## Key Features

- Memory storage using a Verilog register array
- Read and write pointer management
- Full and empty status flag generation
- Synchronous read and write control
- FIFO ordering and data integrity checks
- Pointer wraparound handling
- Boundary and corner-case verification

## Block Diagram
<img width="1672" height="941" alt="image" src="https://github.com/user-attachments/assets/7e46a95c-d7a7-4dda-96bb-4e015ae7dea2" />

## Verification Plan

The FIFO will be tested using a Verilog testbench.

- [ ] Reset behavior
- [ ] Basic write operation
- [ ] Basic read operation
- [ ] FIFO ordering (first in, first out)
- [ ] Empty FIFO handling
- [ ] Full FIFO handling
- [ ] Simultaneous read and write
- [ ] Pointer wraparound
- [ ] Boundary and corner cases

Verification results will be documented after the simulations are completed.

## Tools and Technologies

- **Verilog HDL** — RTL implementation
- **Icarus Verilog** — compilation and simulation
- **GTKWave** — waveform inspection (optional)
- **Visual Studio Code** — development environment
- **Git and GitHub** — version control and project documentation

## Repository Structure

```text
sync-fifo-verilog/
├── rtl/
│   └── sync_fifo.v
├── tb/
│   └── tb_sync_fifo.v
├── sim/
├── waveforms/
└── README.md
```

*The repository structure is planned and may evolve during development.*

## Development Roadmap

- [ ] Define FIFO architecture and specifications
- [ ] Implement FIFO memory and write logic
- [ ] Implement read logic
- [ ] Design full and empty flag logic
- [ ] Develop the testbench
- [ ] Compile and run simulations
- [ ] Inspect waveforms and debug failures
- [ ] Verify corner cases
- [ ] Document simulation results

## Learning Outcomes

Through this project, I aim to strengthen my understanding of:

- RTL design using Verilog HDL
- Sequential logic and clocked processes
- Memory arrays and pointer arithmetic
- FIFO control logic and status flags
- Testbench development and simulation
- Functional verification and debugging

## Author

**Sanmugappriyan S**

GitHub: [Your GitHub Profile](https://github.com/)

## Project Note

This project is currently under development. RTL implementation, simulation results, and verification evidence will be added as development progresses.

