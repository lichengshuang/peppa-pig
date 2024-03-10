#!/bin/bash

# 检查输入参数是否为空
if [ -z "$1" ]; then
    echo "Usage: $0 input_directory"
    exit 1
fi

input_directory="$1"

# 检查输入目录是否存在
if [ ! -d "$input_directory" ]; then
    echo "Error: Input directory $input_directory does not exist."
    exit 1
fi

# 进入输入目录
cd "$input_directory"

# 循环处理所有的 MP4 文件
for mp4_file in *.mp4; do
    # 跳过非文件的情况
    if [ ! -f "$mp4_file" ]; then
        continue
    fi
    
    # 生成对应的 MP3 文件名
    mp3_file="${mp4_file%.mp4}.mp3"
    
    # 使用 ffmpeg 进行转换
    ffmpeg -i "$mp4_file" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "$mp3_file"
done

echo "Conversion complete."

