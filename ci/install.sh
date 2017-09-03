#!/bin/bash
set -ev

if [ "${TEST}" == "integration" ]; then
  [ -d backend/.git ] || git clone git@github.com:amnesty-api backend
  (
    cd backend
    git reset --hard
    git clean -f
    git pull
    yarn
    NODE_ENV=test yarn start &
  )
  (cd backend && yarn)
fi

yarn
