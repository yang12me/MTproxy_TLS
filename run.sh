#!/usr/bin/env bash

WORKDIR="/usr/local/src/mtproxy"
pid_file=$WORKDIR/pid/pid_mtproxy
cd $WORKDIR || exit 1
curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
source ./mtp_config
nat_ip=$(echo $(ip a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | cut -d "/" -f1 | awk 'NR==1 {print $1}'))
public_ip=$(curl -s https://api.ip.sb/ip --ipv4)
[ -z "$public_ip" ] && public_ip=$(curl -s ipinfo.io/ip --ipv4)
nat_info=""
if [[ $nat_ip != $public_ip ]]; then
  nat_info="--nat-info ${nat_ip}:${public_ip}"
fi
tag_arg=""
[[ -n "$proxy_tag" ]] && tag_arg="-P $proxy_tag"
./mtproto-proxy -u nobody -p $web_port -H $port -S $secret --aes-pwd proxy-secret proxy-multi.conf -M 1 $tag_arg --domain $domain $nat_info >/dev/null 2>&1 &

echo $! >$pid_file
