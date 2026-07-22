#!/usr/bin/env bash
set -euo pipefail

hugo_bin="$(command -v hugo || true)"
demo_bind="${HUGO_DEMO_BIND:-0.0.0.0}"
demo_port="${HUGO_DEMO_PORT:-1322}"
vpn_host="${HUGO_DEMO_VPN_HOST:-100.64.0.1}"

demo_host="${HUGO_DEMO_HOST:-}"
if [[ -z "$demo_host" ]] && command -v ipconfig >/dev/null 2>&1; then
  demo_host="$(ipconfig getifaddr en0 2>/dev/null || true)"
  if [[ -z "$demo_host" ]]; then
    demo_host="$(ipconfig getifaddr en1 2>/dev/null || true)"
  fi
fi
if [[ -z "$demo_host" ]]; then
  demo_host="$(hostname)"
fi

if [[ -z "$hugo_bin" && -x /opt/homebrew/bin/hugo ]]; then
  hugo_bin="/opt/homebrew/bin/hugo"
fi

if [[ -z "$hugo_bin" ]]; then
  printf 'Hugo is required to run the site preview.\n' >&2
  exit 1
fi

printf 'Whitmore Science (local): http://localhost:%s/\n' "$demo_port"
printf 'Whitmore Science (LAN):   http://%s:%s/\n' "$demo_host" "$demo_port"
printf 'Whitmore Science (VPN):   http://%s:%s/\n' "$vpn_host" "$demo_port"
printf 'Listening on %s. Press Ctrl-C to stop.\n' "$demo_bind"

exec "$hugo_bin" server --bind "$demo_bind" --port "$demo_port" --disableFastRender
