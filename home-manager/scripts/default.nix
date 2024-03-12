{ config, pkgs, ... }:

let
  currentDir = ./.; # 获取当前目录的Nix路径

  # 定义一个函数来简化脚本的创建过程
  createScriptBin = name: pkgs.writeShellScriptBin name
    (builtins.readFile (toString (currentDir + "/${name}.sh")));

  # 定义一个列表，包含所有脚本的名称
  myscriptNames = [

    "create_soft_link"
    "link_check"

    "init_nixos"
    "umount_and_remove_home"
    "create_temp_project"

    "hypr_start"
    "rofi_google_trans"
    "rofi_search"

  ];

  # 使用 map 函数为每个脚本名称调用 createScriptBin 函数
  myscriptBins = map createScriptBin myscriptNames;

in
{
  home.packages = myscriptBins;
}
