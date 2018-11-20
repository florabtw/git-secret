#!/bin/bash

set -e

./scripts/version.sh
./scripts/build.sh
./scripts/deploy.sh
