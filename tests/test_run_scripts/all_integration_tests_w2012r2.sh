#!/bin/bash
SCRIPT_PATH=$(pwd)
BASENAME_CMD="basename ${SCRIPT_PATH}"
SCRIPT_BASE_PATH=`eval ${BASENAME_CMD}`

if [ $SCRIPT_BASE_PATH = "test_run_scripts" ]; then
  cd ../../
fi

export pe_dist_dir=http://neptune.puppetlabs.lan/2015.2/preview/
export GEM_SOURCE=http://rubygems.delivery.puppetlabs.net

bundle install --without build development test --path .bundle/gems

bundle exec beaker \
  --preserve-hosts onfail \
  --config tests/configs/windows-2012r2-64mda \
  --debug \
  --tests tests/integration/tests \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --pre-suite tests/integration/pre-suite \
  --load-path tests/lib

rm -rf tmp
