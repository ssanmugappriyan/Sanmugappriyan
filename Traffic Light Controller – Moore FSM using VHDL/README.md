# Traffic Light Controller using VHDL

## Project Overview

A digital Traffic Light Controller designed using **VHDL (VHSIC Hardware Description Language)** based on a four-state Moore Finite State Machine (FSM).

The design controls a two-road intersection (North-South and East-West) by managing traffic signal transitions through sequential state logic and combinational output decoding.

A self-checking VHDL testbench is developed to verify FSM state transitions, output signals, and reset functionality.

## Objectives

- Design a Moore FSM-based traffic light controller.
- Implement state register and next-state logic.
- Develop combinational output decoding.
- Implement reset functionality.
- Verify state transitions using a self-checking testbench.
- Analyze simulation waveforms using ModelSim.

## Architecture

The controller consists of three main blocks:

1. **State Register:** Stores the current FSM state and updates on the rising edge of the clock.
2. **Next State Logic:** Determines the next state based on the current state.
3. **Output Logic:** Generates traffic light outputs based exclusively on the current state.

## FSM State Diagram

The controller operates through four states in a continuous sequence:

| State | North-South | East-West |
|---|---|---|
| S0 | Green | Red |
| S1 | Yellow | Red |
| S2 | Red | Green |
| S3 | Red | Yellow |

**State Transition Sequence:**

`S0 → S1 → S2 → S3 → S0`

## Design Specifications

| Parameter | Description |
|---|---|
| Design Type | Moore Finite State Machine |
| HDL | VHDL |
| Number of States | 4 |
| Clock | Rising-edge triggered |
| Reset | Asynchronous active-high |
| State Encoding | Enumerated type |
| Verification | Self-checking testbench |
| Simulation | ModelSim |

## Repository Structure

```text
Traffic-Light-Controller-VHDL/
│
├── rtl/
│   └── traffic_light.vhd
│
├── testbench/
│   └── tb_traffic_light.vhd
│
├── simulation/
│   └── waveform.png
│
└── README.md
```

## Simulation

The design is verified using a self-checking VHDL testbench.

**Test Scenarios:**
- Reset initialization to S0.
- S0 to S1 transition.
- S1 to S2 transition.
- S2 to S3 transition.
- S3 to S0 transition.
- Output verification for all four states.

### ModelSim Commands

```tcl
vlib work

vcom rtl/traffic_light.vhd
vcom testbench/tb_traffic_light.vhd

vsim work.tb_traffic_light

add wave *
run 100 ns
```

### Expected Verification Result

```text
PASS: All traffic light FSM tests passed!
```

## Tools & Technologies

- VHDL
- ModelSim
- Digital Logic Design
- Finite State Machines (FSM)
- RTL Design
- Functional Verification

## Future Enhancements

- Implement programmable traffic light timing using clock counters.
- Add pedestrian crossing functionality.
- Introduce emergency vehicle priority control.
- Implement parameterized timing for each traffic signal.
- Expand verification with randomized test scenarios and FSM coverage.

## Key Learning Outcomes

- Understanding Moore FSM architecture.
- Designing sequential and combinational logic in VHDL.
- Implementing state transition logic.
- Writing self-checking testbenches.
- Debugging RTL designs through waveform analysis.

---

**Author:** Sanmugappriyan S

**GitHub:** [ssanmugappriyan](https://github.com/ssanmugappriyan/Sanmugappriyan)

*This project is part of my learning journey in RTL Design and Digital Hardware Design.*
