#!/bin/bash
set -ex

SITE=quality-controller-tracy-76253.netlify.com

export API_URL=https://amnesty-api.herokuapp.com
yarn build
zip -r website.zip dist
curl -H "Content-Type: application/zip" \
  -H "Authorization: Bearer $NETLIFY_KEY" \
  --data-binary "@website.zip" \
  https://api.netlify.com/api/v1/sites/$SITE/deploys
