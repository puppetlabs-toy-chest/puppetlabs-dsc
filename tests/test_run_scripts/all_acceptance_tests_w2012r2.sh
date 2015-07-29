#!/bin/bash
SCRIPT_PATH=$(pwd)
BASENAME_CMD="basename ${SCRIPT_PATH}"
SCRIPT_BASE_PATH=`eval ${BASENAME_CMD}`

if [ $SCRIPT_BASE_PATH = "test_run_scripts" ]; then
  cd ../../
fi

export BEAKER_PUPPET_AGENT_VERSION=1.2.2
export GEM_SOURCE=http://rubygems.delivery.puppetlabs.net

bundle install --without build development test --path .bundle/gems

bundle exec beaker \
  --preserve-hosts onfail \
  --config tests/configs/windows-2012r2-64a \
  --debug \
  --tests tests/acceptance/tests \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --pre-suite tests/acceptance/pre-suite \
  --load-path tests/lib \
  --type aio

rm -rf tmp
