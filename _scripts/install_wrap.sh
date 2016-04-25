#!/bin/bash
set -e

echo " => Creating a temporary directory for codesigndoc ..."
temp_dir="$(mktemp -d -t codesigndoc)"
codesigndoc_bin_path="${temp_dir}/codesigndoc"

codesigndoc_download_url="https://github.com/bitrise-tools/codesigndoc/releases/download/0.9.8/codesigndoc-Darwin-x86_64"
echo " => Downloading codesigndoc from (${codesigndoc_download_url}) to (${codesigndoc_bin_path}) ..."
curl -sfL "$codesigndoc_download_url" > "${codesigndoc_bin_path}"
echo " => Making it executable ..."
chmod +x "${codesigndoc_bin_path}"
echo " => codesigndoc version: $(codesigndoc -version)"
echo " => Running codesigndoc scan ..."
echo
${codesigndoc_bin_path} scan
