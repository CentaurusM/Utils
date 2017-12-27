#!/bin/bash


#kill all
killall iostat
killall free
killall nvidia-smi


#get io info
nohup iostat -m -x -t 10 >> io.log &

#get mem info
nohup free -h -s 30 >> mem.log &

#get gpu info
nohup nvidia-smi -a -l 300 >> gpu-all-info.log &

nohup nvidia-smi --query-gpu=timestamp,temperature.gpu,fan.speed,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used,pcie.link.width.current,pcie.link.width.max,power.draw,clocks.current.video,gom.current,pstate,clocks_throttle_reasons.active,clocks_throttle_reasons.sw_power_cap,clocks_throttle_reasons.hw_slowdown --format=csv  -l 30 >> gpu.log &

#nohup nvidia-smi -a -l 30 >> gpu.log &
