# Design Small Projects

A collection of small, hands-on Verilog projects designed to strengthen your foundational skills in FPGA and digital circuit design, offering practical insights into RTL modeling and hardware implementation.

---

## Table of Contents

- [Introduction](#introduction)
- [Projects](#projects)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [License](#license)

---

## Introduction

This repository includes a set of focused Verilog design exercises, each demonstrating a fundamental digital design concept. Testbenches are included for select modules to validate functionality through simulation. The projects are ideal for FPGA learners and students seeking hands-on digital system design experience.

---

## Projects

### 1. Button Debouncer and Controller

Implements input debouncing logic for mechanical buttons, combined with a controller module for reliable user interaction on FPGA boards.

- ✅ Includes testbench
- 🛠️ Demonstrates edge detection and signal cleaning

### 2. Memory Swapper

Executes a custom memory swap operation between two memory locations.

- ✅ Includes testbench
- 🧠 Useful for understanding low-level memory control and instruction behavior

### 3. PWM Generator

Generates a PWM signal with an adjustable duty cycle for controlling peripherals like LEDs or motors.

- ⚡ Demonstrates counter-based timing and duty cycle control

### 4. Traffic Light Controller

Uses finite state machines (FSMs) to simulate traffic light behavior at a basic intersection.

- ✅ Includes testbench
- 🚦 Models real-time control and state transitions

---

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Ammar-Wahidi/Design-Small-Projects.git
   cd Design-Small-Projects
   ```

2. Open the files in your preferred Verilog IDE or simulation environment (e.g., ModelSim, Vivado, Quartus).

---

## Usage

- Simulate individual modules using the provided testbenches (where available).
- Deploy synthesized designs to your FPGA development board (optional).
- Customize parameters (e.g., PWM duty cycle) to explore design flexibility.

---

## Features

- RTL-compliant Verilog code
- Educational and modular design
- Testbenches included for validation
- Covers practical HDL design patterns: FSMs, counters, debouncers, memory logic

---

## Dependencies

- Verilog simulator (e.g., ModelSim, Icarus Verilog, Vivado Simulator)
- Optional: FPGA development board (e.g., Basys 3)
- Optional: Xilinx Vivado or Intel Quartus for synthesis

---


## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


> 🎓 Reference:  [ECE 3300 - Digital Circuits Design Using Verilog – Dr. Anas](https://www.youtube.com/playlist?list=PL-iIOnHwN7NXw01eBDR7wI8KzGK4mu8Sr)  
