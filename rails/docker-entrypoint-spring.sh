#!/bin/bash

set -eu

case "${1:-}" in
  binstub | help | server | status | stop | "-*" )
    set -- spring "$@"
    ;;
esac

if [ "${1:-}" = rails -a "${2:-}" = server ]; then
  if [ -n "${SPRING_SOCKET}" -a -S "${SPRING_SOCKET}" ]; then
    rm -v "${SPRING_SOCKET}"
  fi
fi

exec "$@"