# Amnesty Front End [![Build Status](https://travis-ci.org/Towerism/amnesty-front.svg?branch=master)](https://travis-ci.org/Towerism/amnesty-front) [![BrowserStack Status](https://www.browserstack.com/automate/badge.svg?badge_key=ZEp1RkNCa1NMT2tuY1RSdTlWSG0xSFlidUo0ZDJ2dlFzcytReElZVlNqWT0tLXFRcGQ2M0FDL05Icy9Ccng2eWJtUUE9PQ==--0539a5509ac4ac7dc64c5facf12d4519c8b57ae2)](https://www.browserstack.com/automate/public-build/ZEp1RkNCa1NMT2tuY1RSdTlWSG0xSFlidUo0ZDJ2dlFzcytReElZVlNqWT0tLXFRcGQ2M0FDL05Icy9Ccng2eWJtUUE9PQ==--0539a5509ac4ac7dc64c5facf12d4519c8b57ae2)

> The front end for the Amnesty International blog

## Build Setup

``` bash
# install dependencies
yarn install

# serve with hot reload at localhost:8080
yarn run dev

# build for production with minification
yarn run build

# build for production and view the bundle analyzer report
yarn run build --report

# run unit tests
yarn run unit

# run e2e tests
yarn run e2e

# run all tests
yarn test
```

For detailed explanation on how things work, checkout the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).

## Deployment N.B.
For deployment it is important to set the api url via the environment variable `API_URL`.

## Continuous Deployment
Thanks to [BrowserStack](https://www.browserstack.com), our continuous deployment includes running our selenium tests. With very few selenium solutions out there that integrate with travis-ci, we are very thankful that Browserstack supports open source projects.
