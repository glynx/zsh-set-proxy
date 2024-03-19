# zsh-set-proxy

Configures [proxychains](https://github.com/rofl0r/proxychains-ng) in your shell.

## Usage

Set a proxy.
Protocol defaults to `socks5`, host to `127.0.0.1`.

``` bash
set-proxy [http|socks4|socks5] [HOST] PORT
```

Reset the proxy.

```bash
unset-proxy
```

## Prompt Integration

To show the current proxy in the right element for your [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt, add the following configuration to `~/.p10k.zsh`:

``` bash
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  [...]
  proxychains
)
```
