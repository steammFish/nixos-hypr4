{ config, pkgs, ... }:
let

  create_soft_link = pkgs.writeShellScriptBin "create_soft_link"
    ''
      ${builtins.readFile ./create_soft_link.sh}
    '';

  hypr_start = pkgs.writeShellScriptBin "hypr_start"
    ''
      ${builtins.readFile ./hypr_start.sh}
    '';

  rofi_google_trans = pkgs.writeShellScriptBin "rofi_google_trans"
    ''
      ${builtins.readFile ./rofi_google_trans.sh}

    '';

  create_temp_project = pkgs.writeShellScriptBin "create_temp_project"
    ''
      ${builtins.readFile ./create_temp_project.sh}

    '';

  rofi_search = pkgs.writeShellScriptBin "rofi_search"
    ''
      ${builtins.readFile ./rofi_search.sh}

    '';

in

{
  home.packages = [
    create_soft_link
    hypr_start
    rofi_google_trans
    rofi_search
    create_temp_project
  ];
}

