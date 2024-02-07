# 函数名称: _installSymLink
# 参数:
#   $1: 符号链接的名称(没啥用，随便填也行)
#   $2: 符号链接的路径(目标路径，如果存在就做删除处理)
#   $3: 源路径，符号链接将指向该路径
#   $4: 目标路径，符号链接将被创建到该路径
#
# 说明:
#   该函数用于创建符号链接。在创建之前，会检查符号链接的存在，并根据类型进行相应的处理。
#   如果符号链接已存在，将删除旧的符号链接，然后创建新的符号链接。
#   输出相应的信息，以便用户了解执行的操作。
#
# 用法示例:
#   _installSymLink "my_link" "/path/to/my_link" "/source/path" "/target/path"
#
_installSymLink() {
    name="$1"
    symlink="$2";
    linksource="$3";
    linktarget="$4";
    
    if [ -L "${symlink}" ]; then
        unlink ${symlink} || true
        rm ${symlink} || true
        ln -s ${linksource} ${linktarget} 
        echo "Symlink ${linksource} -> ${linktarget} created."
    else
        if [ -d ${symlink} ]; then
            unlink ${symlink} || true
            rm ${symlink} || true
            ln -s ${linksource} ${linktarget}
            echo "Symlink for directory ${linksource} -> ${linktarget} created."
        else
            if [ -f ${symlink} ]; then
                unlink ${symlink} || true
                rm ${symlink} || true
                ln -s ${linksource} ${linktarget} 
                echo "Symlink to file ${linksource} -> ${linktarget} created."
            else
                ln -s ${linksource} ${linktarget} 
                echo "New symlink ${linksource} -> ${linktarget} created."
            fi
        fi
    fi
}

####################################
#  gnome desktop .config storage.  #
####################################

# _installSymLink fcitx5 ~/.config/fcitx5 ~/dotfiles/fcitx5/ ~/.config
# _installSymLink Code ~/.config/Code ~/dotfiles/Code/ ~/.config
# _installSymLink VirtualBox ~/.config/VirtualBox ~/dotfiles/VirtualBox/ ~/.config
# _installSymLink google-chrome ~/.config/google-chrome ~/dotfiles/google-chrome/ ~/.config
# _installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
# _installSymLink wal ~/.config/wal ~/dotfiles/wal/ ~/.config


_installSymLink .bashrc ~/.bashrc ~/nixos/dotfiles/.bashrc ~/.bashrc
_installSymLink dunst ~/.config/dunst ~/nixos/dotfiles/dunst/ ~/.config
_installSymLink google-chrome ~/.config/google-chrome ~/nixos/dotfiles/google-chrome/ ~/.config
_installSymLink hypr ~/.config/hypr ~/nixos/dotfiles/hypr/ ~/.config
_installSymLink rofi ~/.config/rofi ~/nixos/dotfiles/rofi/ ~/.config
_installSymLink kitty ~/.config/kitty ~/nixos/dotfiles/kitty/ ~/.config
_installSymLink wal ~/.config/wal ~/nixos/dotfiles/wal/ ~/.config
_installSymLink waybar ~/.config/waybar ~/nixos/dotfiles/waybar/ ~/.config
_installSymLink fcitx5 ~/.config/fcitx5 ~/nixos/dotfiles/fcitx5/ ~/.config

