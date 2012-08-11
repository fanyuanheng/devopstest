#!/bin/bash

function setup_rvm() {
  if [ ! -d "$HOME/.rvm" ]; then
    echo "installing rvm..."
    curl -L get.rvm.io | bash -s stable
  fi
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
}

function setup_bundler() {
  gem list | grep bundler || {
    echo "installing bundler..."
    gem install bundler --no-rdoc --no-ri
  }
}

function setup_dependencies() {
  bundle check || bundle install
}

function trust_rvmrc() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
  rvm rvmrc trust . > /dev/null
  source .rvmrc > /dev/null
}

function run() {
  setup_rvm
  trust_rvmrc
  setup_bundler
  setup_dependencies
  if [ $# -eq 0 ]; then
    ARGS="-T"
  fi
  bundle exec rake $ARGS "$@"
}

run "$@"