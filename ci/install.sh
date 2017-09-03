#!/bin/bash
set -ev

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

yarn
