--[[
  control_gui_random_run.lua — GUI 控制面板 + 随机运行 / GUI Control Panel + Random Run

  功能：通过图形界面控制小车左右轮速度，支持启停和速度滑条
  Purpose: Control left/right wheel speeds via GUI, with start/stop and spinboxes

  章节 / Chapter: Part 3 — Lua 编程与 GUI / Lua Scripting & GUI
  软件 / Software: CoppeliaSim v4.2.0
  作者 / Author: 赖俊杭 (Junhang Lai)
  许可 / License: CC BY-NC-SA 4.0
--]]

-- ============================================================
-- GUI 定义 / GUI Definition
-- ============================================================
xml = [[
<ui closeable="true" onclose="closeEventHandler" resizable="true">
    <label text="Car Control Panel" wordwrap="true" />
    <group>
        <label text="Right wheel speed:" wordwrap="true" />
        <spinbox minimum="-30" maximum="30" on-change="Right_speed_set" />
        <label text="Left wheel speed:" wordwrap="true" />
        <spinbox minimum="-30" maximum="30" on-change="Left_speed_set" />
        <stretch />
    </group>
    <group>
        <button text="Start" on-click="Start_move" />
        <button text="Stop" on-click="Stop_move" />
        <stretch />
    </group>
</ui>
]]

-- ============================================================
-- GUI 回调函数 / GUI Callback Functions
-- ============================================================

function Start_move(h)
    -- 启动运动 / Start movement
    Start_flag = true
end

function Stop_move(h)
    -- 停止运动 / Stop movement
    Start_flag = false
end

function Right_speed_set(ui, id, newVal)
    -- 设置右轮速度 / Set right wheel speed
    Right_vel = newVal
end

function Left_speed_set(ui, id, newVal)
    -- 设置左轮速度 / Set left wheel speed
    Left_vel = newVal
end

function closeEventHandler(h)
    -- 关闭窗口时隐藏 GUI / Hide GUI on window close
    sim.addStatusbarMessage('Window ' .. h .. ' is closing...')
    simUI.hide(h)
end

-- ============================================================
-- 仿真生命周期回调 / Simulation Lifecycle Callbacks
-- ============================================================

function sysCall_init()
    -- 获取电机句柄 / Get motor handles
    MotorHandle_Left  = sim.getObjectHandle('Left_Motor')
    MotorHandle_Right = sim.getObjectHandle('Right_Motor')

    -- 创建 GUI 界面 / Create GUI
    ui = simUI.create(xml)

    -- 初始化速度和启停标志 / Initialize velocities and start flag
    Left_vel    = 0
    Right_vel   = 0
    Start_flag  = false
end

function sysCall_actuation()
    -- 根据启停标志控制电机 / Control motors based on start flag
    if Start_flag then
        sim.setJointTargetVelocity(MotorHandle_Left, Left_vel)
        sim.setJointTargetVelocity(MotorHandle_Right, Right_vel)
    else
        sim.setJointTargetVelocity(MotorHandle_Left, 0)
        sim.setJointTargetVelocity(MotorHandle_Right, 0)
    end
end

function sysCall_sensing()
    -- 感知逻辑（本脚本未使用）/ Sensing logic (not used in this script)
end

function sysCall_cleanup()
    -- 销毁 GUI 资源 / Destroy GUI resources
    simUI.destroy(ui)
end
