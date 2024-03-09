{ lib, pkgs, config, ... }:

let
  vscode-settings =
    ''
      {
        "window.menuBarVisibility": "toggle",
        "editor.fontSize": 18,
        "editor.scrollbar.vertical": "hidden",
        "editor.scrollbar.verticalScrollbarSize": 0,
        "security.workspace.trust.untrustedFiles": "newWindow",
        "security.workspace.trust.startupPrompt": "never",
        "security.workspace.trust.enabled": false,
        "editor.minimap.side": "left",
        "editor.fontFamily": "'FantasqueSansM Nerd Font Mono','Maple Mono', 'monospace', monospace",
        "extensions.autoUpdate": false,
        "workbench.statusBar.visible": false,
        "terminal.external.linuxExec": "kitty",
        "terminal.explorerKind": "both",
        "terminal.sourceControlRepositoriesKind": "both",
        "telemetry.telemetryLevel": "off",
        "workbench.iconTheme": "icons",
        "workbench.colorTheme": "Adwaita Base16",
        "window.zoomLevel": 1
      }
    '';

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
    twxs.cmake
    gruntfuggly.todo-tree
    dracula-theme.theme-dracula
    # mechatroner.rainbow-csv


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
