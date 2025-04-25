#!/bin/bash -ex

PROTO_ARCH=x86_64
if [ "${TARGETPLATFORM}" = linux/arm64 ]; then
  # For our Mac using friends on Apple Silicon and other 64bit ARM chips.
  PROTO_ARCH=aarch64
fi

mkdir ~/.cargo
echo '[source.crates-io]
replace-with="rsproxy-sparse"
[source.rsproxy-sparse]
registry="sparse+https://rsproxy.cn/index/"
[net]
git-fetch-with-cli=true' > ~/.cargo/config.toml



cargo install typos-cli --target "${PROTO_ARCH}-unknown-linux-gnu" --config ~/.cargo/config.toml
