#!/bin/bash
set -eoxu pipefail

COVERAGE_FILE=.coverage
CODECOV_TOKEN=8a766be5-dd0a-4879-a1fc-8e2ff4ff4d26

cd ${TRAVIS_BUILD_DIR}
[[ -f ${COVERAGE_FILE} ]] && {
    codecov -t ${CODECOV_TOKEN} || echo "Warning: code coverage upload failed."
} || {
    echo "Warning: code coverage file not available."
}
