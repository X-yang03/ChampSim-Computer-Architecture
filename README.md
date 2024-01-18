# ChampSim
ChampSim is a trace-based simulator for a microarchitecture study

# How To
Please read the handout in detail to know more.

# How to download data traces?
You can download two application traces via [Baidu Cloud](https://pan.baidu.com/s/1HGR2XD61YRDWr4a6fh8Ugw?pwd=nkcs).

# How to test the traces?
## ./test.sh [trace_code]   
## attention: you need to put the traces under ./traces
if : bash: ./test.sh: Permission denied
chmod +x test.sh

## 使用./build_champsim.sh ipcp ip_stride next_line hawkeye 构建提高部分的预取器

# Test Results
## 所有测试结果存放于res文件夹下, 分析结果存放于analysis文件夹下

## advance文件夹中是提高部分的测试结果
