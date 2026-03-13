--[[
  control_one.lua — 差速小车基础控制 / Differential Drive Basic Control

  功能：设置左右轮不同速度，实现小车曲线运动
  Purpose: Set different left/right wheel velocities for curved motion

  章节 / Chapter: Part 1 — Lua 入门 / Getting Started with Lua
  软件 / Software: CoppeliaSim v4.2.0
  作者 / Author: 赖俊杭 (Junhang Lai)
  许可 / License: CC BY-NC-SA 4.0
--]]

function sysCall_init()
    -- 获取左右电机句柄（类似 C 语言中的指针）
    -- Get motor handles (similar to pointers in C)
    MotorHandle_Left  = simGetObjectHandle('LeftMotor')
    MotorHandle_Right = simGetObjectHandle('RightMotor')

    -- 设定目标角速度 (rad/s) / Set target angular velocities (rad/s)
    Left_Vel  = 1
    Right_Vel = 2
end

function sysCall_actuation()
    -- 驱动电机以设定速度旋转 / Drive motors at target velocities
    simSetJointTargetVelocity(MotorHandle_Left, Left_Vel)
    simSetJointTargetVelocity(MotorHandle_Right, Right_Vel)
end

function sysCall_sensing()
    -- 感知逻辑（本脚本未使用）/ Sensing logic (not used in this script)
end

function sysCall_cleanup()
    -- 清理资源（本脚本无需特殊清理）/ Cleanup (nothing special here)
end
