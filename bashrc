# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias l='ls -F'
alias ll='l -lh'
alias kd=geany
alias tim='cd /var/userspace/tmason'
export PS1='\u@\h> '
export SCONSFLAGS='--pll debug=1 --color'
export GREP_OPTIONS='--color=auto'

# Unlimited core file size
ulimit -c unlimited

# override stupid Infosec defaults
# a) set umask with something more permissive
umask 022
# b) disable bash auto-timeout
unset TMOUT

disp()
{
  if [ $# -gt 0 ]
  then
    export DISPLAY=localhost:$1
  else
    echo $DISPLAY
  fi
}

########################### git stuff #########################################

source /etc/bash_completion.d/git

# Note: it will create the target directory for you
# git status . | grep modified | tr -s ' ' | cut -d " " -f 2 | rsync -avR --files-from=- . da2dvgen10012v-int:/var/userspace/tmason/backups/selfCross

# Paris CVS
export CVSROOT=:pserver:tmason@10.247.236.240:/home/dev/cvsroot

# aliai
#alias co216qa='cvs -Q co -r Version_2_16_stable qa && rm -rf qa/regression/playbacks && cvs co qa/regression/playbacks'
#alias co216src='cvs -Q co -r Version_2_16_stable src'
#alias co217qa='cvs -Q co -r Version_2_17_dev qa && rm -rf qa/regression/playbacks && cvs co qa/regression/playbacks'
#alias co217src='cvs -Q co -r Version_2_17_dev src'
alias co216qa='co21xqa Version_2_16_stable'
alias co216src='co21xsrc Version_2_16_stable'
alias co216all='co21xall Version_2_16_stable'
alias co217qa='co21xqa Version_2_17_dev'
#alias co217src='co21xsrc Version_2_17_dev'
alias co217src='cvs -Q co -r Version_2_17_dev src'
alias co217all='co21xall Version_2_17_dev'
alias co40api='cvs -Q co -r api_dev_4_0 products'
alias l="ls -F"
alias ll="l -lh"
alias lll='ll -rt | tail'
alias made='grep make timm.history'
alias md='mkdir -p'
alias rm='rm -i'
alias shave="history 40 | sed -e 's/^ *[^ ]* //' >> timm.history"
alias whos='who | sort | uniq -cw 10'
alias tunnel='ssh -Nf -p 12345 -g -L 9878:10.119.20.238:9878 localhost'
alias whichos=/nfs/wombat/scripts/whichos.sh

# command history
export HISTFILESIZE=9999
export HISTCONTROL=ignoredups
                                                                                
# Multiple-Hop SCP (How To SCP Via A Gateway)

# From localhost to remotehost...
#   scp -Cp -o "ProxyCommand ssh gatewayuser@gateway nc remotehost 22" file remoteuser@remotehost:/some/where/file

# ...and back again.
#   scp -Cp -o "ProxyCommand ssh gatewayuser@gateway nc remotehost 22" remoteuser@remotehost:/some/where/file file_copy

###############################################################################
########################### scons stuff ####################################

export SCONSFLAGS="--pll --color debug=1 --show_line_numbers_in_log"

###############################################################################
############################# MTF stuff #######################################

# Prefix used for all port assignments
# Michael 20
# Tim     21
# Steve   22
# Jayne   23
# Karen   24
# Stan    25
# Unused  26 (was David)
export MTF_INSTANCE_PREFIX=21

# Base address of Shared Memory
# Michael 0x1000  4096
# Tim     0x2000  8192
# Steve   0x3000 12288
# Jayne   0x4000 16384
# Karen   0x5000 20480
# Stan    0x6000 24576
# Unused  0x7000 28672 (was David)
export MTF_INSTANCE_MEMKEY=8192


setupUtpEnvironment()
{
# Prefix used for all port assignments
# Michael 20
# Tim     21
# Steve   22
# Jayne   23
# Karen   24
# Stan    25
# Unused  26 (was David)
# export MTF_INSTANCE_PREFIX=21

# Base address of Shared Memory
# Michael 0x1000  4096
# Tim     0x2000  8192
# Steve   0x3000 12288
# Jayne   0x4000 16384
# Karen   0x5000 20480
# Stan    0x6000 24576
# Unused  0x7000 28672 (was David)
# export MTF_INSTANCE_MEMKEY=${MTF_INSTANCE_MEMKEY:-8192}

export MTF_HOME=${MTF_HOME:-/var/userspace/timm}

export APP_SERVICE=MTF_IN_A_BOX_$USER

# where apps read their logging configs from
export LOG_CFG_FILE=$MTF_HOME/cf/log_app.cf
export APP_LOG_CFG_FILE=$MTF_HOME/cf/log_app.cf

# directory where hublogd can find hublogd.cf
export HUB_CF=$MTF_HOME/cf

# directory where logging Pipe will be located
export APP_TMP=$MTF_HOME/tmp

# directory where log files will be created
export APP_LOG=$MTF_HOME/log

# fallback log file in cases of problems with normal logger
export APP_ALTLOG=$MTF_HOME/log/lost+found.log

# directory where apps get their configs from
export UTP_CONF_DIR=$MTF_HOME/cf

# if you want to use a custom config file, set this env var
# otherwise it is hardcoded to look for $UTP_CONF_DIR/UTP_tparpcs.cnf
#export PCS_CFG_FILE=$UTP_CONF_DIR/UTP_tparpcs.cnf.2ndEnv

# for ux_sfeed to pick up mama.properties
export WOMBAT_PATH=$MTF_HOME/cf

# other stuff (unknown at the mo)
export HUB_LOG=$MTF_HOME/log
export APP_DB_NAME=$MTF_HOME/db/apps_oper.SQLite
export APP_HA_FAILED_FLAG=$MTF_HOME/.ha_failed
export APP_HA_OFF_FLAG=$MTF_HOME/.ha_off
export APP_HOME=$MTF_HOME
export APP_CF=$MTF_HOME/cf
export APP_BATCH=/opt/nyx/ha-utp-sigma-x/batch/trading_unit:$MTF_HOME/batch
export WTB_DB_NAME=$MTF_HOME/db/wtb.SQLite
export APP_HA_OFF_MASTER_FLAG=$MTF_HOME/.ha_off_master
export UTP_DATA_DIR=$MTF_HOME/data
export APP_ALTTRC=$MTF_HOME/log/lost+found.trc
export UTP_LOG_DIR=$MTF_HOME/log

# ports for the NSD
export MTF_NSD_PORT=${MTF_INSTANCE_PREFIX}151
export MTF_NSD_WEB_PORT=${MTF_INSTANCE_PREFIX}152

# stuff for MAMA apps
export WOMBAT_LIB=/opt/nyx/libmama
export LD_LIBRARY_PATH=$WOMBAT_LIB/lib:$LD_LIBRARY_PATH
}

# a useful alias
alias psux='pgrep "ux_|ebus|hublog|ADViewerWebOps|^nsd" | xargs --no-run-if-empty ps -f'

atgEnv()
{
  export MTF_HOME=/var/userspace/$USER/MTF_HOME_ATG
  setupUtpEnvironment
}

# SocGen
mtfEnv()
{
  export MTF_HOME=/var/userspace/$USER/MTF_HOME_MTFRA
  setupUtpEnvironment
}

hsbcEnv()
{
  export MTF_HOME=/var/userspace/$USER/MTF_HOME_HSBC
  setupUtpEnvironment
}

sigmaEnv()
{
  export MTF_HOME=/var/userspace/$USER/MTF_HOME_SIGMA
  setupUtpEnvironment
}

###############################################################################
###############################################################################

alias clip='xargs echo -n | xclip -selection clipboard'
alias ag='ag --noheading'
alias gr='git remote -v | head -1 | cut -f 2 | cut -d " " -f 1'

export http_proxy="http://localhost:3128"
export https_proxy="http://localhost:3128"
export ftp_proxy="http://localhost:3128"
