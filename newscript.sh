#!/usr/bin/env bash
# scaffold a new executable bash script with a safe header
# usage: ./newscript.sh deploy.sh

set -euo pipefail
name="${1:?usage: newscript.sh <name.sh>}"

cat > "$name" <<'TEMPLATE'
#!/usr/bin/env bash
set -euo pipefail

main() {
  echo "hello from $0"
}

main "$@"
TEMPLATE

chmod +x "$name"
echo "created $name"