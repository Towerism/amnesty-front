#!/bin/bash
set -ev

yarn unit # skip integration tests until we get browserstack to support our repo
# yarn test
