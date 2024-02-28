{ stdenv, fetchFromGitHub, fontforge, unzip, lib, ... }:

stdenv.mkDerivation rec {
  pname = "wps-office-fonts";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "iamdh4";
    repo = "ttf-wps-fonts";
    rev = "b3e935355afcfb5240bac5a99707ffecc35772a2"; # 使用特定的提交哈希
    sha256 = "1bwn54mx0zh8yigf5f16wypwfmnp88hx6mjxh8wckaipf49525d1"; # 使用 nix-prefetch-git 获取的哈希值
  };

  installPhase = ''
    mkdir -p $out/share/fonts/wps-fonts
    cp -r * $out/share/fonts/wps-fonts/
    chmod 644 $out/share/fonts/wps-fonts/*
  '';

  nativeBuildInputs = [ fontforge unzip ];

  meta = with lib; {
    description = "Symbol fonts required by WPS Office to display math formulas";
    homepage = "https://github.com/iamdh4/ttf-wps-fonts";
    license = licenses.unfree; # 或者适当的许可证
    maintainers = with maintainers; [ ]; # 添加自己或其他维护者
    platforms = platforms.all;
  };
}

