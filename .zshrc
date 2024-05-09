fpath=(
  /opt/homebrew/share/zsh-completions
  /opt/homebrew/share/zsh/site-functions
  $fpath
)
autoload -U compinit
compinit -u

# disable Ctrl + D
set -o ignoreeof

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# psql
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# git-prompt.sh
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# aws-cli auto complete
source '/opt/homebrew/share/zsh/site-functions/aws_zsh_completer.sh'

# google-cloud-sdk
#source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
#source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

# terraform
complete -o nospace -C /opt/homebrew/bin/terraform terraform

## 1password cli
#eval "$(op completion zsh)"; compdef _op op
#source $HOME/.config/op/plugins.sh

# colordiff
alias diff='colordiff -u'

# GNU grep
alias grep='ggrep'
 
# mysql-client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# python3
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# fzf for aws profile switching
alias aws-profile='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'

# helm
source <(helm completion zsh)
helm completion zsh > "${fpath[1]}/_helm"

# kubectl
source <(kubectl completion zsh)

