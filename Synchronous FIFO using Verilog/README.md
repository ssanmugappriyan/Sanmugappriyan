
# Synchronous FIFO Design using Verilog HDL

A digital design project to implement and verify a synchronous First-In, First-Out (FIFO) buffer using Verilog HDL. This project is being developed step by step as part of my RTL design learning journey.

## Project Status

🚧 In Progress

## Objectives

- Understand FIFO architecture and data flow.
- Implement memory storage using a Verilog memory array.
- Design read and write pointers.
- Implement full and empty status flags.
- Handle read/write control and boundary conditions.
- Verify functionality through simulation and a testbench.

## Design Specifications

| Parameter | Description |
|---|---|
| HDL | Verilog HDL |
| Architecture | Synchronous FIFO |
| Clocking | Single clock domain |
| Storage | Configurable depth and data width (planned) |
| Simulation | Icarus Verilog |
| Waveform Viewer | GTKWave (optional) |

## Planned Architecture

- Input data interface
- Write enable and read enable
- Clock and reset
- FIFO memory array
- Read and write pointers
- Full and empty flags
- Data output interface

## Verification Plan

- [ ] Reset behavior
- [ ] Write and read operations
- [ ] FIFO ordering (first in, first out)
- [ ] Empty FIFO behavior
- [ ] Full FIFO behavior
- [ ] Simultaneous read and write
- [ ] Pointer wraparound
- [ ] Boundary and corner-case testing

## Tools

- Verilog HDL
- Icarus Verilog
- GTKWave (optional)
- Visual Studio Code

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

*The structure above is planned and may change as development progresses.*

## Development Progress

- [ ] Define FIFO specifications
- [ ] Design the block diagram
- [ ] Implement memory and write logic
- [ ] Implement read logic
- [ ] Implement full and empty flags
- [ ] Create the testbench
- [ ] Run simulation and inspect waveforms
- [ ] Test corner cases
- [ ] Document final results

## Learning Outcomes

This project aims to develop practical skills in RTL design, sequential logic, pointer management, control logic, simulation, and digital verification.

## Author

**Your Name**

GitHub: [Your GitHub Profile](https://github.com/)

---

*This project is currently under development. Features and verification results will be updated as implementation progresses.*
