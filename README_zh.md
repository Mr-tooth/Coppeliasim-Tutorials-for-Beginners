# CoppeliaSim 动力学仿真新手实践课程

[中文](README_zh.md) | [English](README.md)

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](LICENSE)
[![CoppeliaSim](https://img.shields.io/badge/CoppeliaSim-v4.2.0-blue.svg)](https://www.coppeliarobotics.com/)
[![MATLAB](https://img.shields.io/badge/MATLAB-2021b%2B-orange.svg)](https://www.mathworks.com/)

> 一套新手友好的机器人动力学仿真完整课程——从模型搭建到算法验证，全程实战。已在北京理工大学本科教学中经过多轮迭代验证。

---

## 效果展示

<table>
<tr>
<td width="50%">
<img src="assets/lua_rand_run_gui.gif" alt="GUI 速度控制演示" />
<p align="center"><b>实时 GUI 速度控制</b></p>
</td>
<td width="50%">
<img src="assets/lua_collision_avoidance.gif" alt="避障演示" />
<p align="center"><b>自主避障运动</b></p>
</td>
</tr>
</table>

---

## 项目简介

本项目是一套完整的 **CoppeliaSim**（原 V-REP）教学资源库，涵盖机器人仿真环境搭建与算法验证的全流程，适用于机器人学、自动化等相关专业的本科生和研究生。

课程设计为 **6 学时实践教学**，分为两个阶段：

| 阶段 | 内容 | 学时 |
|------|------|------|
| **模型搭建** | 界面操作、动力学参数、传感器配置、关节设置 | ~3 学时 |
| **编程控制** | Lua 脚本、GUI 开发、MATLAB 联合仿真 | ~3 学时 |

完成课程后，学生能够独立搭建一个功能完整的**差速驱动小车**——包括车轮、车身、传感器和智能控制——并掌握使用 MATLAB 进行外部算法扩展的能力。

---

## 课程特色

- 📖 **中英双语课件** — 中文 55 页 + 英文 60 页 PPT，每步配有截图
- 🤖 **即用仿真模型** — 3 个 `.ttt` 模型：纯模型、GUI 控制、智能避障
- 🔧 **代码完全开放** — Lua 嵌入式脚本 + MATLAB Remote API 工具箱，注释详尽
- 🎓 **教学实践验证** — 经多轮本科教学迭代优化

---

## 快速开始

### 环境要求

| 工具 | 版本 | 下载地址 |
|------|------|---------|
| **CoppeliaSim Edu** | v4.2.0（推荐） | [官网下载](https://www.coppeliarobotics.com/downloads) · [百度网盘](https://pan.baidu.com/s/1oGO-ZvTQYAsmeKFp6rDbpA)（提取码：`5iwt`） |
| **MATLAB** | 2021b 及以上 | [MathWorks](https://www.mathworks.com/) |

> ⚠️ 建议使用 v4.2.0 版本。更高版本可能存在 API 差异导致兼容性问题。

### 一分钟上手

1. 下载模型文件，例如 `models/2_car_model_lua_random_run/Car_For_PC_Lua_RR.ttt`
2. 用 CoppeliaSim 打开
3. 点击 **播放** ▶ — 小车开始运动，GUI 控制面板出现

### 跟着课程学

| 步骤 | 操作 | 资源 |
|------|------|------|
| 1 | 阅读课件第一部分 | `docs/slides_zh.pptx` |
| 2 | 按课件逐步搭建小车模型 | 截图指导每一步操作 |
| 3 | 阅读课件第二部分——Lua 编程与 MATLAB | 课件 + `code/` 目录 |
| 4 | 运行并修改代码 | 各模块 README 提供详细说明 |

---

## 目录结构

```
├── README.md                  # English
├── README_zh.md               # 中文版（本文件）
├── LICENSE                    # CC BY-NC-SA 4.0
├── assets/
│   ├── lua_rand_run_gui.gif   # GUI 控制演示
│   └── lua_collision_avoidance.gif  # 避障演示
├── docs/
│   ├── slides_zh.pptx         # 55 页中文课件
│   └── slides_en.pptx         # 60 页英文课件
├── models/
│   ├── 1_car_model_pure/      # 基础小车模型（无脚本）
│   ├── 2_car_model_lua_random_run/  # GUI 控制小车
│   └── 3_car_model_lua_obstacle_avoidance/  # 避障小车
└── code/
    ├── 1_basic_control/       # Lua：基础电机控制
    ├── 2_gui_control/         # Lua：GUI 速度面板
    └── 3_matlab_cosenim/      # MATLAB：Remote API 联合仿真
```

---

## 课程大纲

### 第一部分：软件介绍
- CoppeliaSim 简介与发展历史
- 下载安装与界面环境
- 动力学仿真举例与意义

### 第二部分：差分小车建模
- 构建驱动轮（圆柱体 → 动力学参数 → 贴纸）
- 构建车身与万向轮
- 添加旋转关节并配置驱动模式
- 配置距离传感器与视觉传感器
- 合并为可复用模型（Model Base）

### 第三部分：Lua 编程与 GUI
- CoppeliaSim 脚本类型与生命周期函数
- 编写基础电机控制脚本
- 添加 Graph 实时数据可视化
- 构建自定义 GUI 控制面板
- 实现自主避障算法

### 第四部分：MATLAB 联合仿真
- Remote API 环境配置（需复制 `remoteApi.dll`，详见[指南](code/3_matlab_cosenim/remote_api/README.md)）
- 连通性测试与对象查询
- 同步仿真控制
- 将避障算法从 Lua 迁移到 MATLAB

---

## API 速查

### Lua 生命周期函数

| 函数 | 调用时机 | 用途 |
|------|---------|------|
| `sysCall_init()` | 仿真启动 | 获取句柄、初始化变量 |
| `sysCall_actuation()` | 每个控制步 | 设定电机速度、发送控制指令 |
| `sysCall_sensing()` | 每个感知步 | 读取传感器、更新状态 |
| `sysCall_cleanup()` | 仿真结束 | 销毁 UI、释放资源 |

### MATLAB Remote API 核心函数

| 函数 | 功能 |
|------|------|
| `simxStart(ip, port, ...)` | 连接 CoppeliaSim |
| `simxGetObjectHandle(clientID, name, ...)` | 获取对象句柄 |
| `simxSetJointTargetVelocity(clientID, handle, vel, ...)` | 控制电机速度 |
| `simxSynchronous(clientID, true)` | 启用同步模式 |
| `simxSynchronousTrigger(clientID)` | 推进一步仿真 |

📖 **完整文档：** [MATLAB Remote API 函数参考](https://manual.coppeliarobotics.com/en/remoteApiFunctionsMatlab.htm)

---

## 许可证

本项目采用 [CC BY-NC-SA 4.0](LICENSE) 许可协议。

允许非商业用途的共享和演绎，须署名且以相同协议共享。

---

## 作者

**赖俊杭 (Junhang Lai)**
北京理工大学

📧 junhang2000@qq.com

---

## 致谢

- 部分仿真模型和代码参考了 [CoppeliaSim 官方教程](https://manual.coppeliarobotics.com/en/bubbleRobTutorial.htm)
- 课件在北京理工大学机器人仿真课程教学中开发和完善
