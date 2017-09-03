#!/bin/bash
set -ev

if [ "${TEST}" == "unit" ]; then
  (cd $SERVICE && yarn unit)
elif [ "${TEST}" == "integration" ]; then
  (cd frontend && yarn e2e)
else
  echo "${TEST} not recognized as a test suite type"
  exit 1
fi
