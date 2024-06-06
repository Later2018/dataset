#!/bin/bash

# 检查命令行参数的数量
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 a_file b_file c_file"
    exit 1
fi

# 从命令行参数获取文件名
a_file="$1"
b_file="$2"
c_file="$3"

# 清空输出文件
echo "" > $c_file

# 读取a文件中的每一行
while read -r vertex_count; do
    # 初始化一个空字符串来存储超边的顶点
    vertices=""

    # 根据顶点数量从b文件中读取顶点
    for ((i=1; i<=vertex_count; i++)); do
        # 读取b文件的下一行，并将其添加到vertices字符串中
        read -r vertex <&3
        vertices="$vertices $vertex"
    done

    # 将超边的顶点写入c文件
    echo "$vertices" >> $c_file
done < $a_file 3<$b_file
