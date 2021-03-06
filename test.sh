#!/bin/bash

set -euo pipefail

ERRORS=()

# find all executables and run `shellcheck`
for f in $(find . -type f -not -iwholename '*.git*' -not -iwholename '*.vim*'  -not -path './vim/bundle/*' | sort -u); do
  if file "$f" | grep --quiet shell; then
    {
      shellcheck "$f" && echo "[OK]: sucessfully linted $f"
    } || {
      # add to errors
      ERRORS+=("$f")
    }
  fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
  echo "No errors, hooray"
else
  echo "These files failed shellcheck: ${ERRORS[*]}"
  exit 1
fi

