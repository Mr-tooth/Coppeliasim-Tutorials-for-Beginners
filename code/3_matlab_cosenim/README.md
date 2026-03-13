# Part 3: MATLAB Co-simulation / MATLAB 联合仿真

## Overview / 概述

This module demonstrates how to control a CoppeliaSim simulation externally from MATLAB using the Remote API. This enables powerful co-simulation workflows: sensor data processing, trajectory planning, and control algorithms in MATLAB while the physics runs in CoppeliaSim.

本模块演示如何通过 Remote API 从 MATLAB 外部控制 CoppeliaSim 仿真。这支持强大的联合仿真工作流：在 MATLAB 中处理传感器数据、规划轨迹和控制算法，而物理仿真在 CoppeliaSim 中运行。

## Prerequisites / 前置条件

1. **CoppeliaSim v4.2.0** with a scene running
2. **MATLAB** 2021b or later
3. **remoteApi binary** — copy from your CoppeliaSim installation (see [remote_api/README.md](remote_api/README.md))

## Files / 文件说明

| File | Description / 说明 |
|------|-------------------|
| `test_connection.m` | Full synchronous motor control test / 完整同步电机控制测试 |
| `remote_api/` | Remote API library files (MEX wrappers) / Remote API 库文件 |
| `obstacle_avoidance/` | Lua obstacle avoidance scripts for reference / Lua 避障脚本（参考） |

## Quick Start / 快速开始

```matlab
% 1. Copy remoteApi.dll from CoppeliaSim installation to remote_api/
% 2. In CoppeliaSim, add simRemoteApi.start(19997) to a scene script
% 3. Start the simulation in CoppeliaSim
% 4. In MATLAB:
cd code/3_matlab_cosenim
test_connection
```

## How It Works / 工作原理

```
MATLAB (Remote API Client)  ←→  CoppeliaSim (Remote API Server)
         │                                    │
  remApi.m / remoteApiProto.m          simRemoteApi.start(19997)
         │                                    │
  simxStart('127.0.0.1', 19997)  →  TCP Connection Established
         │                                    │
  simxSetJointTargetVelocity()   →  Motor Control
  simxGetObjectHandle()          ←  Object Handles
  simxSynchronous() / Trigger()  →  Synchronous Step
```

## API Reference / API 参考

| Function / 函数 | Purpose / 用途 |
|----------------|----------------|
| `simxStart` | Establish connection / 建立连接 |
| `simxFinish` | Close connection / 关闭连接 |
| `simxGetObjectHandle` | Get object handle by name / 按名称获取对象句柄 |
| `simxSetJointTargetVelocity` | Set joint motor speed / 设定关节电机速度 |
| `simxSynchronous` | Enable/disable synchronous mode / 启用/禁用同步模式 |
| `simxSynchronousTrigger` | Trigger one simulation step / 触发一个仿真步 |

## Related Model / 关联模型

`models/3_car_model_lua_obstacle_avoidance/Car_For_PC_Lua_ObstacleAvoidance.ttt`
