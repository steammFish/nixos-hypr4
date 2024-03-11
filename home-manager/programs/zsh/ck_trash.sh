ck_del() {
    local trash_dir="$HOME/.ck_trash"
    local max_size=10737418240 # 10GB in bytes

    # 检查垃圾箱目录是否存在，如果不存在，则创建它
    if [[ ! -d "$trash_dir" ]]; then
        mkdir -p "$trash_dir"
    fi

    # 计算垃圾箱目录的当前大小
    local current_size=$(du -sb "$trash_dir" | cut -f1)

    for target in "$@"; do
        if [[ -e $target ]]; then
            # 计算目标文件/目录的大小
            local target_size=$(du -sb "$target" | cut -f1)
            # 计算添加目标文件/目录后垃圾箱的总大小
            local new_size=$((current_size + target_size))

            # 检查是否超过最大大小限制
            if [[ $new_size -le $max_size ]]; then
                local timestamp=$(date +%Y%m%d%H%M%S)
                local base_target=$(basename "$target")
                mv "$target" "$trash_dir/${base_target}_$timestamp"
                echo "$target has been moved to trash."
                current_size=$new_size
            else
                echo "Error: Moving $target to trash would exceed the maximum allowed trash size of 10GB."
            fi
        else
            echo "Warning: $target not found."
        fi
    done
}
