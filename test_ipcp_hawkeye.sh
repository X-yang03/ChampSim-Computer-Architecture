#!/bin/bash

traces_dir="./traces" #将traces放在traces文件夹下
bin_name="bin/perceptron-ipcp-ip_stride-next_line-hawkeye-1core"

traces=($(find "$traces_dir" -maxdepth 1 -type f))
for trace in "${traces[@]}"
do
    trace_index=${trace:9:3}
    log_name="advance/${trace_index}-ipcp-ip_stride-next_line-hawkeye.log"
    echo "Running trace ${trace_index}"
    ./run_champsim.sh ${bin_name} 100 100 ${trace} > ${log_name}
    
done