#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.


: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/myced-update.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='myceworld/myce'
# Display Name.
DAEMON_NAME='Myce myceworld/myce'
# Coin Ticker.
TICKER='myce'
# Binary base name.
BIN_BASE='myce'
# Directory.
DIRECTORY='.myce'
# Conf File.
CONF='myce.conf'
# Port.
DEFAULT_PORT=23511
# Explorer URL
EXPLORER_URL='https://explorer.myce.world/'
# Bad Explorer SSL.
BAD_SSL_HACK='--no-check-certificate'
# Rate limit explorer
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=100000
# Cycle Daemon on first start.
DAEMON_CYCLE=0
# Slow Daemon Start.
SLOW_DAEMON_START=0
# Multiple on single IP.
MULTI_IP_MODE=1
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''


# Tip Address
TIPS='MRwqWT27m1WhpRR8XSHWvbcj7uetU8D3gD'
# Dropbox Addnodes
DROPBOX_ADDNODES='xdzoc7ntncapimr'
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='e9zzivi3lhb3hxx'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='zsgq3ehhu13k1ew'


ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "MYCE"
    ____
   ]()()[
 ___\__/___
|__|    |__|  __  ____     _______ ______
 |_|_/\_|_|  |  \/  \ \   / / ____|  ____|
 |_|____|_|  | \  / |\ \_/ / |    | |__
 \_|_||_|_/  | |\/| | \   /| |    |  __|
  _|_||_|_   | |  | |  | | | |____| |____
 |___||___|  |_|  |_|  |_|  \_____|______|

MYCE
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
UPDATE_DAEMON_ADD_CRON "${BIN_BASE}" "${GITHUB_REPO}" "${CONF_FILE}" "${DAEMON_DOWNLOAD}" "${DIRECTORY}" "${DROPBOX_ADDNODES}" "${DROPBOX_BOOTSTRAP}" "${DROPBOX_BLOCKS_N_CHAINS}"
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane
