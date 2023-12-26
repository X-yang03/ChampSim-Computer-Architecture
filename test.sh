#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./test.sh [trace_code]"
    exit 1
fi

l3_pre=(next_line no)
l2_pre=(ip_stride next_line no)
l1_pre=(next_line no)

replacement=(lru ship srrip drrip)

target_trace=${1}

traces_dir="./traces" #将traces放在traces文件夹下

traces=($(find "$traces_dir" -maxdepth 1 -type f))
for trace in "${traces[@]}"
do
    trace_index=${trace:9:3}
    #如果trace_index不等于target_trace，则跳过
    if [ ${target_trace} != ${trace_index} ]
    then
        continue
    fi
    echo "Processing trace: ${trace}"
    for l3 in "${l3_pre[@]}"
    do
        for l2 in "${l2_pre[@]}"
        do
            if [ $l3 == "ip_stride" ] && [ $l2 == "ip_stride" ]
            then
                continue
            fi
            for l1 in "${l1_pre[@]}"
            do
                for rep in "${replacement[@]}"
                do
                    ./build_champsim.sh ${l1} ${l2} ${l3} ${rep}
                    bin_name="bin/perceptron-${l1}-${l2}-${l3}-${rep}-1core"
                    log_name="res/res_${trace_index}/${trace_index}-${l1}-${l2}-${l3}-${rep}.log"
                    ./run_champsim.sh ${bin_name} 100 100 ${trace} > ${log_name}
                    echo "Trace ${trace_index}-${l1}-${l2}-${l3}-${rep} done!"
                done
            done
        done
    done
done
echo "All traces done!"

### Author : Xyang 2113301