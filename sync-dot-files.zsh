#!/bin/zsh

if [[ ! -z "$original_sdf_path" ]]; then
  return
fi

PLUGIN_DIR="${${(%):-%x}:A:h}"
BIN_URL=https://github.com/awterman/sync-dot-files/releases/latest/download/sdf

if [[ ! -f $PLUGIN_DIR/sdf ]]; then
  echo "Downloading sdf..."
  curl -L $BIN_URL -o $PLUGIN_DIR/sdf
  chmod +x $PLUGIN_DIR/sdf
fi

original_sdf_path=$(which sdf)

sdf() {
  if [[ $1 == "cd" ]]; then
    cd $($original_sdf_path repo-path)
  else
    SDF_SUPPORT_CD=true $original_sdf_path "$@"
  fi
}