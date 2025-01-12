#!/usr/bin/env bash
set -eoux pipefail

VAGRANT_INFO_DIR=${VAGRANT_INFO_DIR:-"/box"}

mkdir -p ${VAGRANT_INFO_DIR}

echo "${VAGRANT_VM:-}"                  > "${VAGRANT_INFO_DIR}/vagrant_vm"
echo "${VAGRANT_VM_DESCRIPTION:-}"      > "${VAGRANT_INFO_DIR}/vagrant_vm_description"
echo "${VAGRANT_BOX:-}"                 > "${VAGRANT_INFO_DIR}/vagrant_box"
echo "${VAGRANT_BOX_OWNER:-}"           > "${VAGRANT_INFO_DIR}/vagrant_box_owner"
echo "${VAGRANT_BOX_VERSION:-}"         > "${VAGRANT_INFO_DIR}/vagrant_version"
echo "${VAGRANT_BOX_HASH:-}"            > "${VAGRANT_INFO_DIR}/vagrant_hash"
echo "${VAGRANT_OS:-}"                  > "${VAGRANT_INFO_DIR}/vagrant_os"
echo "${VAGRANT_OS_VERSION:-}"          > "${VAGRANT_INFO_DIR}/vagrant_os_version"
echo "${VAGRANT_OS_VERSION_CODENAME:-}" > "${VAGRANT_INFO_DIR}/vagrant_os_version_codename"
