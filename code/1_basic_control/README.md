# Part 1: Basic Motor Control / 基础电机控制

## Overview / 概述

This script demonstrates the most fundamental concept in CoppeliaSim scripting: driving a differential drive robot by setting joint target velocities.

本脚本演示 CoppeliaSim 脚本编程的最基本概念：通过设定关节目标速度驱动差速小车。

## What You'll Learn / 学习内容

- How to get object handles (pointers to scene objects)
- How to set joint target velocities in a simulation loop
- The `sysCall_init` / `sysCall_actuation` lifecycle pattern

- 获取对象句柄（场景对象的"指针"）
- 在仿真循环中设定关节目标速度
- `sysCall_init` / `sysCall_actuation` 生命周期模式

## How to Use / 使用方法

1. Open the corresponding model: `models/1_car_model_pure/Car_For_P.ttt`
2. Open the script attached to the car model
3. Paste or type the code from `control_one.lua`
4. Start the simulation — the car will drive in a curve

## Related Model / 关联模型

`models/1_car_model_pure/Car_For_P.ttt`
