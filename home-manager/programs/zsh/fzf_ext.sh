
find_cd() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: find_cd <directory> <name_pattern>"
        return 1
    fi

    local dest=$(find -L "$1" -type d -name "$2" 2>/dev/null | fzf)

    if [ -z "$dest" ] || [ ! -d "$dest" ]; then
        echo "No valid directory selected. Exiting..."
        return 1
    fi

    echo -n "Selected: $dest. Continue? (y/N): "
    local confirm
    read -k 1 confirm
    echo # 输出换行

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        if cd "$dest"; then
            echo "Changed directory to: $dest"
        else
            echo "Error changing directory to: $dest"
            return 1
        fi
    else
        echo "Operation canceled. Exiting..."
        return 0
    fi
}

run_from_history() {
    # 从历史记录中获取命令，并使用 fzf 进行选择
    # local cmd=$(history | fzf --tac | sed 's/^[ ]*[0-9]*[ ]*//')
    local cmd=$(cat ~/.zsh_history | sed 's/^[^;]*;//' | fzf --tac)


    if [ -z "$cmd" ]; then
        echo "No command selected. Exiting..."
        return 1
    fi

    echo "You have selected: $cmd"
    echo -n "Do you want to execute this command? (y/N): "
    local confirm
    read -k 1 confirm
    echo # 输出换行

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        eval "$cmd"
    else
        echo "Operation canceled. Exiting..."
        return 0
    fi
}

run_from_history_edit() {
    # local cmd=$(history | fzf --tac | sed 's/^[ ]*[0-9]*[ ]*//')
    local cmd=$(cat ~/.zsh_history | sed 's/^[^;]*;//' | fzf --tac)

    if [ -z "$cmd" ]; then
        echo "No command selected. Exiting..."
        return 1
    fi

    # 使用 vared 让用户编辑选择的命令
    echo "Selected command: $cmd"
    echo "Edit the command before execution (finish editing with Enter):"
    vared -p ">> " -c cmd

    if [ -z "$cmd" ]; then
        echo "No command entered. Exiting..."
        return 1
    fi

    echo "Executing: $cmd"
    eval "$cmd"
}

