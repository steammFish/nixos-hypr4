{ pkgs, ... }:

let
  nur-no-pkgs = import
    (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
      sha256 = "1lyazzbikgxfv4ih9g6qmhl6799anipgm8mqwh0nxw81c0nlvslc";
    })
    {
      inherit pkgs;
    };
in
{
  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.firefox;
  #   addons = with nur-no-pkgs.repos.mozillaplugins; [
  #     ublock-origin
  #     https-everywhere
  #     # // 其他插件...
  #   ];
  # };



}
