# .bash_aliases - bash shell aliases and functions

# ALIASES

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# Shortcuts
alias code="cd ~/code"
alias sites="cd ~/sites"
alias projects="cd ~/projects"

# Synonyms
alias quit="exit"
alias where="which"

# Edit hosts file
alias hosts="sudo nano /etc/hosts"

# OS specific aliases
if [ "$(uname)" == "Darwin" ]; then
  # Local IP on en0 network interface
  alias iplocal="ipconfig getifaddr en0"
fi

# FUNCTIONS

# Create dir and navigate into it
mkcd() {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# FFmpeg: convert video to webm (2-pass constant quality mode, VP9 + Opus)
# https://trac.ffmpeg.org/wiki/Encode/VP9
webmconv() {
  ffmpeg -i $1 -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 1 -an -f webm -y /dev/null && \
  ffmpeg -i $1 -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 2 -c:a libopus $2
}
