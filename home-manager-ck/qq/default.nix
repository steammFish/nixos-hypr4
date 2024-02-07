{ pkgs, config, ... }:

{
  home.file.".local/share/applications/linuxqq.desktop".source = ./linuxqq.desktop;
}
