#!/bin/bash
# set -x
# set -euo pipefail

#entry point for container
export DD_AGENT_HOST=$(wget -qO- $ECS_CONTAINER_METADATA_URI/task | jq -r '.Containers[0].Networks[0].IPv4Addresses[0]')
export DD_TRACE_AGENT_URL=http://$DD_AGENT_HOST:8126
ddtrace-run python tinystatus.py &
gunicorn -c gunicorn_config.py app:app
