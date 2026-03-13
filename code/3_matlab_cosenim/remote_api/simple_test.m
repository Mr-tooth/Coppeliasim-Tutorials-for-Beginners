%% simple_test.m — Remote API 基础连通性测试 / Basic Connection Test
%
% 功能：验证 MATLAB 与 CoppeliaSim 的 Remote API 连接
% Purpose: Verify Remote API connection between MATLAB and CoppeliaSim
%
% 前置条件 / Prerequisites:
%   1. CoppeliaSim v4.2.0 已启动 / CoppeliaSim v4.2.0 is running
%   2. 场景脚本中执行：simRemoteApi.start(19999)
%   3. remoteApi.dll 已复制到 remote_api/ 目录
%
% 作者 / Author: 赖俊杭 (Junhang Lai)
% 许可 / License: CC BY-NC-SA 4.0

function simple_test()
    disp('Program started');

    % 加载 Remote API / Load Remote API
    sim = remApi('remoteApi');
    sim.simxFinish(-1);

    % 建立连接 / Connect (port 19999, blocking, timeout 5s)
    clientID = sim.simxStart('127.0.0.1', 19999, true, true, 5000, 5);

    if (clientID > -1)
        disp('Connected to remote API server');

        % 获取场景中所有对象 / Get all objects in the scene
        [res, objs] = sim.simxGetObjects(clientID, sim.sim_handle_all, sim.simx_opmode_blocking);
        if (res == sim.simx_return_ok)
            fprintf('Number of objects in the scene: %d\n', length(objs));
        else
            fprintf('Remote API function call returned with error code: %d\n', res);
        end

        pause(2);

        % 流式获取鼠标 X 坐标 (5秒) / Stream mouse X position (5s)
        t = clock;
        startTime   = t(6);
        currentTime = t(6);
        sim.simxGetIntegerParameter(clientID, sim.sim_intparam_mouse_x, sim.simx_opmode_streaming);

        while (currentTime - startTime < 5)
            [returnCode, data] = sim.simxGetIntegerParameter(clientID, sim.sim_intparam_mouse_x, sim.simx_opmode_buffer);
            if (returnCode == sim.simx_return_ok)
                fprintf('Mouse position x: %d\n', data);
            end
            t = clock;
            currentTime = t(6);
        end

        % 发送测试消息到 CoppeliaSim 状态栏 / Send test message to CoppeliaSim statusbar
        sim.simxAddStatusbarMessage(clientID, 'Hello CoppeliaSim!', sim.simx_opmode_oneshot);

        % 确保最后命令已到达 / Ensure last command arrived
        sim.simxGetPingTime(clientID);

        % 关闭连接 / Close connection
        sim.simxFinish(clientID);
    else
        disp('Failed connecting to remote API server');
    end

    % 清理 / Cleanup
    sim.delete();
    disp('Program ended');
end
