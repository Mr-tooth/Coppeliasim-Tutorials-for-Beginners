%% simple_test.m — 简单同步测试 / Simple Synchronous Test
%
% 功能：以同步模式连接 CoppeliaSim，驱动电机运行预设轨迹
% Purpose: Connect in synchronous mode, drive motors along a preset trajectory
%
% 前置条件 / Prerequisites:
%   1. CoppeliaSim v4.2.0 已启动，场景中包含 LeftMotor / RightMotor
%   2. simRemoteApi.start(19997) 已在场景脚本中执行
%   3. remoteApi.dll 已复制到 remote_api/ 目录
%
% 作者 / Author: 赖俊杭 (Junhang Lai)
% 许可 / License: CC BY-NC-SA 4.0

% 添加 Remote API 库路径 / Add Remote API library path
addpath('remote_api');

% 仿真参数 / Simulation parameters
sim_t = 10;      % 总时长 (s) / Total duration
sim_T = 0.05;    % 步长 (s) / Time step
sim_N = round(sim_t / sim_T);

disp('Program started');

% 加载 Remote API / Load Remote API
sim = remApi('remoteApi');
sim.simxFinish(-1);

% 建立连接（端口 19997 = 同步模式）/ Connect (port 19997 = synchronous mode)
ClientID = sim.simxStart('127.0.0.1', 19997, true, true, 5000, sim_T * 1000);

if (ClientID > -1)
    disp('Connected to remote API server');

    % 启用同步模式 / Enable synchronous mode
    sim.simxSynchronous(ClientID, true);
    sim.simxStartSimulation(ClientID, sim.simx_opmode_oneshot);
    sim.simxSynchronousTrigger(ClientID);

    % 获取电机句柄 / Get motor handles
    [~, MotorHandle_Left]  = sim.simxGetObjectHandle(ClientID, 'LeftMotor', sim.simx_opmode_blocking);
    [~, MotorHandle_Right] = sim.simxGetObjectHandle(ClientID, 'RightMotor', sim.simx_opmode_blocking);

    % 定义速度轨迹 / Define velocity trajectory
    % 左轮：恒定 2 rad/s / Left: constant 2 rad/s
    % 右轮：前半程 2 rad/s，后半程 1 rad/s（实现转向）
    % Right: first half 2 rad/s, second half 1 rad/s (turning)
    Left_vel  = 2 * ones(sim_N, 1);
    Right_vel = [2 * ones(sim_N / 2, 1); ones(sim_N / 2, 1)];

    % 执行仿真步进 / Execute simulation steps
    for i = 1:sim_N
        sim.simxSetJointTargetVelocity(ClientID, MotorHandle_Left,  Left_vel(i),  sim.simx_opmode_oneshot);
        sim.simxSetJointTargetVelocity(ClientID, MotorHandle_Right, Right_vel(i), sim.simx_opmode_oneshot);
        sim.simxSynchronousTrigger(ClientID);
    end

    % 停止仿真 / Stop simulation
    sim.simxStopSimulation(ClientID, sim.simx_opmode_oneshot_wait);

    % 关闭连接 / Close connection
    sim.simxFinish(ClientID);
else
    disp('Failed connecting to remote API server');
end

% 清理 / Cleanup
sim.delete();
disp('Program ended');
