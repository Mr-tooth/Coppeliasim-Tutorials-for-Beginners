# Part 2: GUI Speed Control Panel / GUI 速度控制面板

## Overview / 概述

This script extends the basic control by adding a custom GUI with spinboxes and buttons, allowing real-time speed adjustment during simulation.

本脚本在基础控制之上增加了自定义 GUI（含数值框和按钮），实现仿真中实时调速。

## What You'll Learn / 学习内容

- Creating custom UI elements with XML markup
  使用 XML 标记创建自定义 UI 元素
- Handling UI callbacks (`on-change`, `on-click`)
  处理 UI 回调（`on-change`、`on-click`）
- Conditional motor control (start/stop logic)
  条件电机控制（启停逻辑）

## How to Use / 使用方法

1. Open the model: `models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
   打开模型：`models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
2. Attach `control_gui_random_run.lua` to the car's child script
   将 `control_gui_random_run.lua` 挂载到小车的子脚本上
3. Start simulation — the control panel will appear
   启动仿真——控制面板将自动弹出
4. Adjust left/right wheel speeds with the spinboxes, then click Start
   用数值框调节左右轮速度，点击 Start 开始运动

## GUI Controls / GUI 控件

| Control / 控件 | Function / 功能 |
|----------------|-----------------|
| Left wheel spinbox / 左轮数值框 | Set left motor velocity (-30 to 30) / 设定左轮速度 |
| Right wheel spinbox / 右轮数值框 | Set right motor velocity (-30 to 30) / 设定右轮速度 |
| Start button / 启动按钮 | Begin motor rotation / 开始转动 |
| Stop button / 停止按钮 | Stop all motors / 停止所有电机 |

## Related Model / 关联模型

`models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
