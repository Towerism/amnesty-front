#!/bin/bash
set -ev

if [ "${TEST}" == "integration" ]; then
  [ -d backend/.git ] || git clone https://github.com/Towerism/amnesty-api.git backend
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
