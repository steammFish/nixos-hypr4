if [ $# -ne 1 ]; then
    echo "Usage: $0 <keyword>"
    echo "  <keyword>: 文件名关键字"
    exit 1
fi

# 创建临时项目文件夹
temp_project_dir=$(mktemp -d) || { echo "Error: 无法创建临时项目文件夹"; exit 1; }
echo "创建临时项目文件夹: $temp_project_dir"

# 复制文件到临时项目文件夹中
keyword="$1"
find . -type f -name "*$keyword*" -exec cp -r {} "$temp_project_dir" \;

# 使用VSCode打开项目
code "$temp_project_dir"