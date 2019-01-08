#!/bin/bash
set -eoxu pipefail

cd ${TRAVIS_BUILD_DIR}/docs
sphinx-apidoc \
    -d 100 \
    -f \
    -M \
    -e \
    -P \
    -o "source" \
    ${TRAVIS_BUILD_DIR}/${MODULE}

make html
