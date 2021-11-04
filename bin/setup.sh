#!/bin/bash

TPMTPATH=~/.tmux/plugins/tpm
TPM_GITHUB_URL=https://github.com/tmux-plugins/tpm
ZINITPATH=~/.zinit/bin
ZINIT_GITHUB_URL=https://github.com/zdharma/zinit

# env
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# homebrew
${SCRIPT_DIR}/brew.sh

# tpm(tmux plugin manager)
if [ -d $TPMTPATH ]; then
    cd $TPMTPATH && git pull
else
    git clone ${TPM_GITHUB_URL}.git $TPMTPATH
fi

# zinit
if [ -d $ZINITPATH ]; then
    cd $ZINITPATH && git pull
else
    git clone ${ZINIT_GITHUB_URL}.git $ZINITPATH
fi

# symbolic link
${SCRIPT_DIR}/ln.sh
