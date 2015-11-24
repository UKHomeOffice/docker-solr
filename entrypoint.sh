#!/bin/bash

set -eu

if [ -n "${OVERRIDE_SOLR_PORT:-}" ] ; then
  export SOLR_PORT="$OVERRIDE_SOLR_PORT"
fi

if [ $# -eq 0 ] ; then
  /opt/solr/bin/solr -f
else
  exec bash -c "$@"
fi
