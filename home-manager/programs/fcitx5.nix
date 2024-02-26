{ config, pkgs, ... }:
let
  dictURL = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict";
in
{

  xdg.dataFile."fcitx5/pinyin/dictionaries/zhwiki-20220416.dict".source = pkgs.fetchurl {
    url = dictURL;
    sha256 = "vyvsychfpRMSQWgxQfCxD3QllmKBjDdcbIvJiEDfz+8=";
  };

  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-chinese-addons
        fcitx5-gtk
        libsForQt5.fcitx5-qt
        fcitx5-material-color

        ((libsForQt5.fcitx5-qt.override { inherit (qt6) qtbase; }).overrideAttrs
          (old: rec { cmakeFlags = old.cmakeFlags ++ [ "-DENABLE_QT6=1" ]; }))
      ];
    };
  };

  # environment.variables = {
  home.sessionVariables = {

    SDL_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    # XMODIFIERS = "@im=fcitx";

    # XDG_SESSION_TYPE="wayland";
    # QT_QPA_PLATFORM="wayland";

  };


}
