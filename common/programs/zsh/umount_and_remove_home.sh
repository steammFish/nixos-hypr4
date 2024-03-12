umount_and_remove_home() {
    # 定义需要卸载的挂载点
    # MOUNT_POINTS=("/home/ck/dotfiles" "/home/ck/virtualMachine")
    MOUNT_POINTS=("/home/ck/dotfiles")

    # 定义要删除的目录
    TARGET_DIR="/home/ck"

    # 标记，用于检测所有挂载点是否成功卸载
    all_unmounted=true

    # 遍历挂载点并尝试卸载
    for mount_point in "${MOUNT_POINTS[@]}"; do
        echo "尝试卸载: $mount_point"
        sudo umount "$mount_point"
        if [ $? -eq 0 ]; then
            echo "$mount_point 卸载成功。"
        else
            echo "$mount_point 卸载失败。"
            all_unmounted=false
            break
        fi
    done

    # 如果所有挂载点都成功卸载，则删除目标目录
    if [ "$all_unmounted" = true ]; then
        echo "所有挂载点都已卸载，正在删除 $TARGET_DIR ..."
        sudo rm -rf "$TARGET_DIR"
        if [ $? -eq 0 ]; then
            echo "$TARGET_DIR 已成功删除。"
        else
            echo "删除 $TARGET_DIR 失败。"
        fi
    else
        echo "由于至少有一个挂载点卸载失败，$TARGET_DIR 未被删除。"
    fi
}

