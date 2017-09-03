#!/bin/bash
set -ev

if [ "${TEST}" == "unit" ]; then
  yarn unit
elif [ "${TEST}" == "integration" ]; then
  yarn e2e
else
  echo "${TEST} not recognized as a test suite type"
  exit 1
fi
