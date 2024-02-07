{ config, pkgs, ... }:
let
  chatapi = "hk-nllqa9100001090535469314960c396b67029ac12f0938e0"; # FIXME: security with sops
in
{

  systemd.services.chatgpt-web-midjourney-proxy = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "docker.service" ];
    description = "ChatGPT Web Midjourney Proxy";

    serviceConfig = {
      Type = "simple";
      User = "root";
      ExecStart = ''
        # 拉取最新的Docker镜像
        ${pkgs.docker}/bin/docker pull ydlhero/chatgpt-web-midjourney-proxy

        # 移除旧的容器（如果存在）
        ${pkgs.docker}/bin/docker rm -f chatgpt-web-midjourney-proxy || true
        
        # 运行新的Docker容器
        ${pkgs.docker}/bin/docker run --name chatgpt-web-midjourney-proxy -d -p 6015:3002 \
          -e OPENAI_API_KEY=${chatapi} \
          -e OPENAI_API_BASE_URL=https://api.openai-hk.com \
          -e MJ_SERVER=https://api.openai-hk.com \
          -e MJ_API_SECRET=${chatapi} \
          ydlhero/chatgpt-web-midjourney-proxy
      '';
      ExecStop = ''
        # 停止并删除容器
        ${pkgs.docker}/bin/docker stop chatgpt-web-midjourney-proxy || true
        ${pkgs.docker}/bin/docker rm -f chatgpt-web-midjourney-proxy
      '';
    };
  };

}
