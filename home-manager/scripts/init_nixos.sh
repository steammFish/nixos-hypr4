# 创建目录的函数
create_directory() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "目录 $1 创建成功"
    else
        echo "目录 $1 已存在，跳过创建"
    fi
}

# 创建文件的函数
create_file() {
    if [ ! -e "$1" ]; then
        touch "$1"
        echo "文件 $1 创建成功"
    else
        echo "文件 $1 已存在，跳过创建"
    fi
}

# 创建图片目录
create_directory ~/Pictures/wallpapers

# 创建配置文件目录
create_directory ~/.config/hypr

# 创建额外配置文件
create_file ~/.config/hypr/extra.conf

