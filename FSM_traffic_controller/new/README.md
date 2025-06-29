# 🚦 FSM-Based Adaptive Traffic Light Controller

This project implements a **Finite State Machine (FSM)**-based traffic light controller in **Verilog**, which dynamically adjusts green light durations for a two-way traffic intersection based on real-time traffic density. A comprehensive testbench is included to simulate multiple traffic scenarios.

---

## 📁 Files

- `FSM_advanced_controller.v` – Verilog module implementing the FSM-based traffic light controller  
- `tb_FSM_advanced_controller.v` – Testbench module simulating and verifying controller behavior

---

## 🔌 Inputs and Outputs

### Inputs (to `FSM_advanced_controller`)

| Signal     | Width | Description                                      |
|------------|--------|--------------------------------------------------|
| `clk`      | 1 bit  | System clock                                     |
| `reset`    | 1 bit  | Asynchronous reset                               |
| `high_ns`  | 1 bit  | High traffic input for North-South direction     |
| `high_ew`  | 1 bit  | High traffic input for East-West direction       |

### Outputs (from `FSM_advanced_controller`)

| Signal     | Width | Description                                          |
|------------|--------|------------------------------------------------------|
| `ns_light` | 3 bits | North-South light status: `{Red, Yellow, Green}`     |
| `ew_light` | 3 bits | East-West light status: `{Red, Yellow, Green}`       |

Each light output uses 3 bits where only one bit is high at a time (Red = `3'b100`, Yellow = `3'b010`, Green = `3'b001`).

---

## ✨ Features

- **Four FSM States**:
  - `S0`: NS Green, EW Red  
  - `S1`: NS Yellow, EW Red  
  - `S2`: NS Red, EW Green  
  - `S3`: NS Red, EW Yellow  

- **Adaptive Green Duration**:
  - Green time is either short (5 cycles) or long (10 cycles) based on `high_ns` or `high_ew`
  - Yellow time is fixed at 2 cycles

- **Real-Time Traffic Handling**:
  - Dynamically adjusts signal durations based on sensor input  
  - Ensures fairness between directions  

- **Comprehensive Testbench**:
  - Simulates 5 real-world scenarios:
    1. Low traffic  
    2. High traffic on North-South  
    3. High traffic on East-West  
    4. High traffic on both  
    5. Return to low traffic  
  - Uses `$display` to log current state and traffic inputs

---
