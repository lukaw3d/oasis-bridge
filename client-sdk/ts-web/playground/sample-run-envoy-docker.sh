#!/bin/sh -eux
docker run \
    -it \
    --name bridgetsenvoy \
    --rm \
    -e ENVOY_UID=1000 \
    -e ENVOY_GID=1000 \
    --network host \
    -v "$PWD/sample-envoy.yaml:/mnt/ts-web/sample-envoy.yaml" \
    -v "/tmp/oasis-net-runner-bridge/net-runner/network/client-0/internal.sock:/mnt/ts-web/node/internal.sock" \
    -w /mnt/ts-web \
    envoyproxy/envoy:v1.16-latest \
    -c sample-envoy.yaml