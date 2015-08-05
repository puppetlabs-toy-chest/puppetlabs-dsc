#!/bin/bash
set -e

# Init
SCRIPT_PATH=$(pwd)
BASENAME_CMD="basename ${SCRIPT_PATH}"
SCRIPT_BASE_PATH=`eval ${BASENAME_CMD}`
declare -a ARGS

# Argument Parsing
if [ $# -eq 0 ]; then
  ARGS[0]='windows-2012r2-64mda'
  ARGS[1]='http://neptune.puppetlabs.lan/2015.2/preview'
elif [ $# -ne 2 ]; then
  echo 'USAGE integration_tests.sh <CONFIG> <PE_DIST_DIR>'
  exit 1
else
  ARGS=("$@")
fi

# Figure out where we are in the directory hierarchy
if [ $SCRIPT_BASE_PATH = "test_run_scripts" ]; then
  cd ../../
fi

export pe_dist_dir=${ARGS[1]}
export GEM_SOURCE=http://rubygems.delivery.puppetlabs.net

bundle install --without build development test --path .bundle/gems

bundle exec beaker \
  --preserve-hosts onfail \
  --config tests/configs/${ARGS[0]} \
  --debug \
  --tests tests/integration/tests \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --pre-suite tests/integration/pre-suite \
  --load-path tests/lib

TEST_RESULT=$?

rm -rf tmp

exit $TEST_RESULT
