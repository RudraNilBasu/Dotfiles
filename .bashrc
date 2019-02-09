
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH=/Users/hackerrank/.rvm/gems/ruby-2.4.2/bin:/Users/hackerrank/.rvm/gems/ruby-2.4.2@global/bin:/Users/hackerrank/.rvm/rubies/ruby-2.4.2/bin:/Users/hackerrank/.nvm/versions/node/v8.9.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/share/dotnet:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/hackerrank/.rvm/bin:/Users/hackerrank/.vimpkg/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# alias
alias vimfzf='vim $(fzf)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
