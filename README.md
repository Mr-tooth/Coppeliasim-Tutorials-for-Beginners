# CoppeliaSim Tutorials for Beginners

[中文](README_zh.md) | English

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](LICENSE)
[![CoppeliaSim](https://img.shields.io/badge/CoppeliaSim-v4.2.0-blue.svg)](https://www.coppeliarobotics.com/)
[![MATLAB](https://img.shields.io/badge/MATLAB-2021b%2B-orange.svg)](https://www.mathworks.com/)

> A hands-on robotics simulation course — from model building to algorithm verification — powered by CoppeliaSim. Battle-tested at Beijing Institute of Technology.

---

## Demo Preview

<table>
<tr>
<td width="50%">
<img src="assets/lua_rand_run_gui.gif" alt="GUI Speed Control Demo" />
<p align="center"><b>Real-time GUI Speed Control</b></p>
</td>
<td width="50%">
<img src="assets/lua_collision_avoidance.gif" alt="Obstacle Avoidance Demo" />
<p align="center"><b>Autonomous Obstacle Avoidance</b></p>
</td>
</tr>
</table>

---

## About This Project

This repository contains a complete teaching resource kit for **CoppeliaSim** (formerly V-REP), covering the full pipeline from robot model construction to control algorithm verification. It was developed and refined through multiple semesters of undergraduate robotics courses at **Beijing Institute of Technology (BIT)**.

The course is designed as a **6-hour practical curriculum** split into two parts:

| Part | Focus | Duration |
|------|-------|----------|
| **Modeling** | Interface, physics, sensors, joints | ~3 hours |
| **Programming** | Lua scripting, GUI, MATLAB co-simulation | ~3 hours |

By the end, students build a functional **differential drive car** from scratch — including wheels, chassis, sensors, and intelligent control — and learn to extend it with external MATLAB algorithms.

---

## Features

- 📖 **Bilingual Courseware** — 55-slide Chinese and 60-slide English PPTs with step-by-step screenshots
- 🤖 **Ready-to-Run Models** — 3 `.ttt` simulation models: pure model, GUI control, obstacle avoidance
- 🔧 **Open Code** — Lua embedded scripts and MATLAB Remote API toolkit, fully commented
- 🎓 **Proven Pedagogy** — Tested with real students, refined through multiple semesters

---

## Getting Started

### Prerequisites

| Tool | Version | Download |
|------|---------|----------|
| **CoppeliaSim Edu** | v4.2.0 (recommended) | [Official](https://www.coppeliarobotics.com/downloads) · [Baidu Cloud](https://pan.baidu.com/s/1oGO-ZvTQYAsmeKFp6rDbpA) (code: `5iwt`) |
| **MATLAB** | 2021b or later | [MathWorks](https://www.mathworks.com/) |

> ⚠️ Version 4.2.0 is recommended. Newer versions may have API differences that affect compatibility.

### Quick Try (1 minute)

1. Download a model file, e.g., `models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
2. Open it with CoppeliaSim
3. Click **Play** ▶ — the car moves with the GUI control panel

### Follow the Curriculum

| Step | Action | Resource |
|------|--------|----------|
| 1 | Read Part 1 of the slides | `docs/slides_zh.pptx` or `docs/slides_en.pptx` |
| 2 | Build the car model following the slides | Step-by-step screenshots included |
| 3 | Read Part 2 — Lua scripting & MATLAB | Slides + `code/` directory |
| 4 | Run and modify the code | See `code/*/README.md` for each module |

---

## Project Structure

```
├── README.md                  # English (this file)
├── README_zh.md               # 中文版
├── LICENSE                    # CC BY-NC-SA 4.0
├── assets/
│   ├── lua_rand_run_gui.gif   # GUI control demo
│   └── lua_collision_avoidance.gif  # Obstacle avoidance demo
├── docs/
│   ├── slides_zh.pptx         # 55-slide Chinese courseware
│   └── slides_en.pptx         # 60-slide English courseware
├── models/
│   ├── 1_car_model_pure/      # Basic car model (no script)
│   ├── 2_car_model_lua_random_run/  # GUI-controlled car
│   └── 3_car_model_lua_obstacle_avoidance/  # Obstacle avoidance car
└── code/
    ├── 1_basic_control/       # Lua: basic motor control
    ├── 2_gui_control/         # Lua: GUI speed panel
    └── 3_matlab_cosenim/      # MATLAB: Remote API co-simulation
```

---

## Course Outline

### Part 1: Introduction to CoppeliaSim
- What is CoppeliaSim and why use it
- Installation and interface walkthrough
- Dynamics simulation examples

### Part 2: Differential Drive Car Modeling
- Build drive wheels (cylinder → physics → texture)
- Build chassis and omni-wheel
- Add revolute joints with actuation
- Configure proximity and vision sensors
- Merge into a reusable model base

### Part 3: Lua Scripting & GUI
- CoppeliaSim script types and lifecycle
- Basic motor control via Lua
- Adding Graph for real-time data visualization
- Building a custom GUI control panel
- Implementing autonomous obstacle avoidance

### Part 4: MATLAB Co-simulation
- Remote API setup (copy `remoteApi.dll`, see [guide](code/3_matlab_cosenim/remote_api/README.md))
- Connection test and object querying
- Synchronous simulation control
- Migrating obstacle avoidance algorithm from Lua to MATLAB

---

## API Quick Reference

### Lua Lifecycle Functions

| Function | Called When | Typical Use |
|----------|------------|-------------|
| `sysCall_init()` | Simulation starts | Get handles, initialize variables |
| `sysCall_actuation()` | Each control step | Set motor velocities, send commands |
| `sysCall_sensing()` | Each sensing step | Read sensors, update state |
| `sysCall_cleanup()` | Simulation ends | Destroy UI, release resources |

### MATLAB Remote API Essentials

| Function | Purpose |
|----------|---------|
| `simxStart(ip, port, ...)` | Connect to CoppeliaSim |
| `simxGetObjectHandle(clientID, name, ...)` | Get object handle |
| `simxSetJointTargetVelocity(clientID, handle, vel, ...)` | Control motor |
| `simxSynchronous(clientID, true)` | Enable step-by-step mode |
| `simxSynchronousTrigger(clientID)` | Advance one simulation step |

---

## License

This project is licensed under [CC BY-NC-SA 4.0](LICENSE).

You are free to share and adapt for non-commercial purposes with attribution and under the same license.

---

## Author

**Junhang Lai (赖俊杭)**
Beijing Institute of Technology

📧 junhang2000@qq.com

---

## Acknowledgments

- Simulation models and some code snippets reference the [CoppeliaSim Official Tutorial](https://manual.coppeliarobotics.com/en/bubbleRobTutorial.htm)
- Courseware developed for the robotics simulation curriculum at BIT
