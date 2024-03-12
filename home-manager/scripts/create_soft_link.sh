# Dotfiles 存储目录
dotfiles_dir=~/dotfiles

# 创建软链接的函数
link_file() {
    local src=$1 dst=$2

    # 确保目标目录存在
    mkdir -p "$(dirname "$dst")"

    # 如果目标链接或文件已存在，则先删除
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        rm -rf "$dst"
    fi

    # 创建软链接
    ln -s "$src" "$dst"
    echo "Linked $src to $dst"
}

# 处理家目录下的文件，包括隐藏文件
link_home() {
    for path in "$dotfiles_dir"/home/* "$dotfiles_dir"/home/.*; do
        [ -e "$path" ] || continue
        # 忽略特殊目录 . 和 ..
        [[ $(basename "$path") == "." || $(basename "$path") == ".." ]] && continue
        file="$(basename "$path")"
        link_file "$path" "$HOME/$file"
    done
}

# 处理 ~/.config 下的配置文件，包括隐藏文件
link_config() {
    for path in "$dotfiles_dir"/config/* "$dotfiles_dir"/config/.*; do
        [ -e "$path" ] || continue
        # 忽略特殊目录 . 和 ..
        [[ $(basename "$path") == "." || $(basename "$path") == ".." ]] && continue
        file="$(basename "$path")"
        link_file "$path" "$HOME/.config/$file"
    done
}

# 执行链接操作
link_home
link_config

echo "Dotfiles have been linked."
