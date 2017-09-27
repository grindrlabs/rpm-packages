#!/bin/bash

set -e

bundle exec 'fpm-cook clean'
bundle exec 'fpm-cook package --no-deps'
