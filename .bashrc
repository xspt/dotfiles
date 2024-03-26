#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Pywal
(cat "$HOME/.cache/wal/sequences" &)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[34m\]\u\[\e[0m\]@\h \[\e[33m\]\W/\[\e[0m\] \[\e[32m\]\$\[\e[0m\]: '

export PATH=$PATH:$HOME/android/platform-tools
export PATH=$PATH:$HOME/android/emulator
export PATH=$PATH:$HOME/android/cmdline-tools/tools/bin
export QT_QPA_PLATFORM='wayland;xcb'
export QT_QPA_PLATFORMTHEME=qt5ct
export ANDROID_HOME=$HOME/.android
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgrep.conf
