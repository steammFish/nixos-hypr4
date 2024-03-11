{ lib, pkgs, config, ... }:

let
  vscode-settings = ''${builtins.readFile ./settings.json}'';
  extensions = import ./extraExtensions.nix;

in

{

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode-1.85.1" ];
  programs.vscode.enable = true;
  programs.vscode.extensions = with pkgs.vscode-extensions; [

    bbenoist.nix
    github.copilot
    ms-azuretools.vscode-docker

    ms-vscode.cpptools
    ms-vscode.cmake-tools
    twxs.cmake

    gruntfuggly.todo-tree
    dracula-theme.theme-dracula

    # oderwat.indent-rainbow
    # ms-vscode.makefile-tools


  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    extensions.Icons
    extensions.adwaita-base16
    # extensions.todo-tree
    # extensions.vscode-docker
    # extensions.cpptools
    # extensions.cmake-tools
  ];

  # home.file.".config/Code/User/settings.json".text = vscode-settings;
}
