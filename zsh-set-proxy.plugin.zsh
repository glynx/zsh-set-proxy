set-proxy() {
    case "$#" in
        1)
            declare -r protocol=socks5
            declare -r host=127.0.0.1
            declare -r port="$1"
            ;;
        2)
            declare -r protocol="$1"
            declare -r host=127.0.0.1
            declare -r port="$2"
            ;;
        3)
            declare -r protocol="$1"
            declare -r host="$2"
            declare -r port="$3"
            ;;
        *)
            echo 'bad arguments' >&2
            return 1
            ;;
    esac
    cat << EOF > "/tmp/proxychains-$$.conf"
quiet_mode
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 1000
tcp_connect_time_out 1000
[ProxyList]
${protocol} ${host} ${port}
EOF
    export LD_PRELOAD=/usr/lib/libproxychains4.so PROXYCHAINS_CONF_FILE="/tmp/proxychains-$$.conf" PROXYCHAINS_ENDPOINT="${protocol}://${host}:${port}" PROXYCHAINS_QUIET_MODE=1
}

unset-proxy() {
    if [[ "$PROXYCHAINS_CONF_FILE" == /tmp/proxychains-*.conf ]]; then
        rm -f "$PROXYCHAINS_CONF_FILE"
    fi
    unset LD_PRELOAD PROXYCHAINS_CONF_FILE PROXYCHAINS_ENDPOINT PROXYCHAINS_QUIET_MODE
}

function prompt_proxychains() {
    if [[ "$LD_PRELOAD" == */usr/lib/libproxychains4.so* ]]; then
        p10k segment -f 2 -i '↔' -t "${PROXYCHAINS_ENDPOINT:-proxychains}"
    fi
  }
