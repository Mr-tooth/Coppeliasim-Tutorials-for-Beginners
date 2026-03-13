--[[
  vision_sensor_setup.lua — 视觉传感器边缘检测配置 / Vision Sensor Edge Detection Setup

  功能：对视觉传感器图像进行边缘检测处理
  Purpose: Apply edge detection on vision sensor image

  章节 / Chapter: Part 2 — 差分小车建模 / Differential Drive Car Modeling
  软件 / Software: CoppeliaSim v4.2.0
  作者 / Author: 赖俊杭 (Junhang Lai)
  许可 / License: CC BY-NC-SA 4.0
--]]

function sysCall_vision(inData)
    -- 将传感器图像复制到工作缓冲区 / Copy sensor image to work buffer
    simVision.sensorImgToWorkImg(inData.handle)

    -- 执行边缘检测（阈值 0.2）/ Apply edge detection (threshold 0.2)
    simVision.edgeDetectionOnWorkImg(inData.handle, 0.2)

    -- 将处理后的图像写回传感器缓冲区 / Write processed image back to sensor buffer
    simVision.workImgToSensorImg(inData.handle)
end

function sysCall_init()
    -- 初始化逻辑（本脚本无需特殊初始化）/ Init (nothing special needed)
end

function sysCall_actuation()
    -- 驱动逻辑（本脚本无需特殊驱动）/ Actuation (nothing special needed)
end

function sysCall_sensing()
    -- 感知逻辑（本脚本无需特殊感知）/ Sensing (nothing special needed)
end

function sysCall_cleanup()
    -- 清理资源（本脚本无需特殊清理）/ Cleanup (nothing special needed)
end
