alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Docked Rails
# https://github.com/rails/docked
# docker build -t docked-rails .
# docker volume create ruby-bundle-cache
export DOCKED_IMAGE=docked-rails
alias docked='docker run --rm -it -v ${PWD}:/rails -u $(id -u):$(id -g) -v ruby-bundle-cache:/bundle -p 3030:3030 $DOCKED_IMAGE'
