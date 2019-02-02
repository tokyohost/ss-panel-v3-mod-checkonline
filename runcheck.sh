#!/bin/bash
#此文件用于循环判断主脚本入口
#check.sh 用于判断进程是否存在并返回判断值
#check.txt 用于存放脚本运行时所有的日志信息
#runcheck.sh 用于循环判断主脚本
#脚本重启写入日志
	echo "$(date +"%Y-%m-%d %H:%M.%S") 脚本重启，开始运行！" >> check.txt
	echo "program is running now !"
#开始循环检测进程
number=1

while true
do
	checkget=$(bash check.sh)
	if [[ "$checkget" != "Running" ]]
		then 
		echo `cd&&./shadowsocks/run.sh`
		echo "$(date +"%Y-%m-%d %H:%M.%S") 检测返回值："$checkget" 检测进程不存在，执行 cd&&./shadowsocks/run.sh 进入持续监控模式.." >> check.txt
		#持续监控模式
			while(( $number<=3 ))
				do
					checkget=$(bash check.sh)
					if [[ "$checkget" != "Running" ]]
						then 
							echo `cd&&./shadowsocks/run.sh`
							let "number++"
							echo "$(date +"%Y-%m-%d %H:%M.%S") 检测返回值："$checkget" 持续监控第"$number"次" >> check.txt
							sleep 15s
						else
							echo "$(date +"%Y-%m-%d %H:%M.%S") 检测返回值："$checkget" 服务端已重新上线！持续监控第"$number"次 退出持续监控模式" >> check.txt
							number=1
							break 1
					fi
			done
			
		else 
		echo "$(date +"%Y-%m-%d %H:%M.%S") 检测返回值："$checkget" 检测进程存在，进程休眠，等待下一次检测..." >> check.txt
	fi
#初始化检测参数变量
		checkget=not test
	sleep 15m
done
