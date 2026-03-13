--[[
  lua_obstacle_avoidance.lua — 小车避障控制 / Obstacle Avoidance Control

  功能：使用距离传感器检测障碍物，检测到后后退转向避开
  Purpose: Use proximity sensor to detect obstacles, then back up and turn

  章节 / Chapter: Part 3 — Lua 编程与 GUI / Lua Scripting & GUI
  软件 / Software: CoppeliaSim v4.2.0
  作者 / Author: 赖俊杭 (Junhang Lai)
  许可 / License: CC BY-NC-SA 4.0

  算法说明 / Algorithm:
    1. 默认前进，速度由 GUI 滑条控制
       Default: move forward, speed controlled by GUI slider
    2. 距离传感器检测到障碍物 → 进入后退模式 4 秒
       Proximity sensor detects obstacle → enter backup mode for 4s
    3. 后退时左轮快右轮慢，实现曲线后退（转向）
       During backup: left wheel fast, right wheel slow (curved retreat)
--]]

function sysCall_init()
    -- 获取自身句柄和电机句柄 / Get self handle and motor handles
    CarBase     = sim.getObjectAssociatedWithScript(sim.handle_self)
    leftMotor   = sim.getObjectHandle("LeftMotor")
    rightMotor  = sim.getObjectHandle("RightMotor")

    -- 获取距离传感器句柄 / Get proximity sensor handle
    P_sensor    = sim.getObjectHandle("Proximity_sensor")

    -- 速度范围：50°/s ~ 300°/s / Speed range: 50~300 deg/s
    minMaxSpeed = {50 * math.pi / 180, 300 * math.pi / 180}

    -- 后退模式截止时间（-1 表示不在后退模式）/ Backup mode deadline (-1 = not backing up)
    backUntilTime = -1

    -- 创建速度控制 GUI / Create speed control GUI
    xml = '<ui title="' .. sim.getObjectName(CarBase) .. ' speed" closeable="false" resizeable="false" activate="false">' ..
        [[<hslider minimum="0" maximum="100" on-change="speedChange_callback" id="1"/>
          <label text="" style="* {margin-left: 300px;}"/></ui>]]
    ui = simUI.create(xml)

    -- 初始化速度为中间值 / Initialize speed to midpoint
    speed = (minMaxSpeed[1] + minMaxSpeed[2]) * 0.5
    simUI.setSliderValue(ui, 1, 100 * (speed - minMaxSpeed[1]) / (minMaxSpeed[2] - minMaxSpeed[1]))
end

function speedChange_callback(ui, id, newVal)
    -- GUI 滑条回调：映射滑条值到速度范围
    -- Slider callback: map slider value to speed range
    speed = minMaxSpeed[1] + (minMaxSpeed[2] - minMaxSpeed[1]) * newVal / 100
end

function sysCall_actuation()
    -- 读取距离传感器 / Read proximity sensor
    result = sim.readProximitySensor(P_sensor)

    -- 检测到障碍物 → 进入后退模式 4 秒
    -- Obstacle detected → enter backup mode for 4 seconds
    if (result > 0) then
        backUntilTime = sim.getSimulationTime() + 4
    end

    if (backUntilTime < sim.getSimulationTime()) then
        -- 前进模式：双轮同速前进
        -- Forward mode: both wheels same speed
        sim.setJointTargetVelocity(leftMotor, speed)
        sim.setJointTargetVelocity(rightMotor, speed)
    else
        -- 后退模式：左轮快右轮慢，曲线后退转向
        -- Backup mode: left fast, right slow — curved retreat
        sim.setJointTargetVelocity(leftMotor, -speed / 2)
        sim.setJointTargetVelocity(rightMotor, -speed / 8)
    end
end

function sysCall_sensing()
    -- 感知逻辑（本脚本未使用）/ Sensing logic (not used in this script)
end

function sysCall_cleanup()
    -- 销毁 GUI 资源 / Destroy GUI resources
    simUI.destroy(ui)
end
