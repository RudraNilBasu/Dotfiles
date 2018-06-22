
# add ctags if we are using mac
if [ "$(uname)" == "Darwin" ]; then
     alias ctags="`brew --prefix`/bin/ctags"
fi
