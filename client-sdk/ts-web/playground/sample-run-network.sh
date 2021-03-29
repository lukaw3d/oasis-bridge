#!/bin/sh -eux
. ./consts.sh

./download-artifacts.sh
./build-runtime.sh

mkdir -p /tmp/oasis-net-runner-bridge
"./untracked/oasis_core_${OASIS_CORE_VERSION}_linux_amd64/oasis-net-runner" \
    --fixture.default.node.binary "untracked/oasis_core_${OASIS_CORE_VERSION}_linux_amd64/oasis-node" \
    --fixture.default.runtime.binary ../../../target/debug/oasis-bridge-runtime \
    --fixture.default.runtime.loader "untracked/oasis_core_${OASIS_CORE_VERSION}_linux_amd64/oasis-core-runtime-loader" \
    --fixture.default.keymanager.binary "untracked/simple-keymanager-$BUILD_NUMBER" \
    --basedir /tmp/oasis-net-runner-bridge \
    --basedir.no_temp_dir
