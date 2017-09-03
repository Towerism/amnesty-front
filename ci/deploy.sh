#!/bin/bash
set -ex

DOMAIN=quality-controller-tracy-76253

yarn build
zip -r website.zip dist
curl -H "Content-Type: application/zip" \
  -H "Authorization: Bearer $NETLIFY_KEY" \
  --data-binary "@website.zip" \
  https://api.netlify.com/api/v1/sites/$DOMAIN/deploys
