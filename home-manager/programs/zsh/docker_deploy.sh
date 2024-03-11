docker_deploy_chatgpt() {
  if [ $# -eq 0 ]; then
    echo "Usage: docker_chatgpt_deploy <APIKEY>"
    return 1
  fi

  local APIKEY=$1

  docker pull ydlhero/chatgpt-web-midjourney-proxy #第一次安装不需要 更新需要
  docker rm -f chatgpt-web-midjourney-proxy #第一次安装不需要 更新需要
  docker run --name chatgpt-web-midjourney-proxy  -d -p 6015:3002 \
  -e OPENAI_API_KEY="$APIKEY" \
  -e OPENAI_API_BASE_URL=https://api.openai-hk.com  \
  -e MJ_SERVER=https://api.openai-hk.com  \
  -e AUTH_SECRET_KEY=changeme74  \
  -e MJ_API_SECRET="$APIKEY"  ydlhero/chatgpt-web-midjourney-proxy
}

docker_deploy_v2raya() {
  echo "run with root!"

  sudo docker run -d \
  --restart=always \
  --privileged \
  --network=host \
  --name v2raya \
  -e V2RAYA_LOG_FILE=/tmp/v2raya.log \
  -e V2RAYA_V2RAY_BIN=/usr/local/bin/v2ray \
  -e V2RAYA_NFTABLES_SUPPORT=off \
  -e IPTABLES_MODE=legacy \
  -v /lib/modules:/lib/modules:ro \
  -v /etc/resolv.conf:/etc/resolv.conf \
  -v /etc/v2raya:/etc/v2raya \
  mzz2017/v2raya
}
