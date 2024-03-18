# zsh-set-proxy
Set a proxy and wrap with proxychains

## Usage

```bash
set-proxy [socks4|socks5] [host] PORT
```

Defaults:

- socks5
- 127.0.0.1

Reset the proxy with:

```bash
unset-proxy
```

## Prompt 

To add the current proxy to your right prompt elements in your Powerlevel10k configuration `~/.p10k.zsh`:

```text
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  [...]
  proxychains
)
```
