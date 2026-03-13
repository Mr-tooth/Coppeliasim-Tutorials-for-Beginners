# Part 2: GUI Speed Control Panel / GUI 速度控制面板

## Overview / 概述

This script extends the basic control by adding a custom GUI with spinboxes and buttons, allowing real-time speed adjustment during simulation.

本脚本在基础控制之上增加了自定义 GUI（含数值框和按钮），实现仿真中实时调速。

## What You'll Learn / 学习内容

- Creating custom UI elements with XML markup
- Handling UI callbacks (`on-change`, `on-click`)
- Conditional motor control (start/stop logic)

- 使用 XML 标记创建自定义 UI 元素
- 处理 UI 回调（`on-change`、`on-click`）
- 条件电机控制（启停逻辑）

## How to Use / 使用方法

1. Open `models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
2. Attach `control_gui_random_run.lua` to the car's child script
3. Start simulation — the control panel will appear
4. Adjust left/right wheel speeds with the spinboxes, click Start

## GUI Controls / GUI 控件

| Control / 控件 | Function / 功能 |
|----------------|-----------------|
| Left wheel spinbox | Set left motor velocity (-30 to 30) |
| Right wheel spinbox | Set right motor velocity (-30 to 30) |
| Start button | Begin motor rotation |
| Stop button | Stop all motors |

## Related Model / 关联模型

`models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
