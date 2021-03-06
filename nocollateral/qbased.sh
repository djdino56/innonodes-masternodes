#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/qbased.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='Qbase-Foundation/QBase-Core'
# Display Name.
DAEMON_NAME='Qbase Core'
# Coin Ticker.
TICKER='QBAS'
# Binary base name.
BIN_BASE='qbase'
# Directory.
DIRECTORY='.qbasecore'
# Conf File.
CONF='qbase.conf'
# Port.
DEFAULT_PORT=13964
# Explorer URL.
EXPLORER_URL='https://exp.qbase.me/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=10000
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='BGEtEb69PSSUUS7PbFKJcUzTJzXZ3nNXoz'
# Dropbox Addnodes.
DROPBOX_ADDNODES='8tr5tvq81zlimrc'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='5f1je79en7f0646'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='zpr5u6w3cs5vmav'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "QBASE"
  ___  _                       ____
 / _ \| |__   __ _ ___  ___   / ___|___  _ __ ___
| | | | '_ \ / _` / __|/ _ \ | |   / _ \| '__/ _ \
| |_| | |_) | (_| \__ \  __/ | |__| (_) | | |  __/
 \__\_\_.__/ \__,_|___/\___|  \____\___/|_|  \___|

QBASE
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$(( COUNTER + 1 ))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null

