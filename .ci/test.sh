#!/bin/bash
set -eoxu pipefail

# ensure a clean temporary test directory
function ensure_clean_test_dir() {
    [[ -d ${TEST_DIR} ]] && rm -rf ${TEST_DIR}
    mkdir -p ${TEST_DIR}
}

function do_test() {
    cd ${TEST_DIR}
    PYTHONPATH=${PYTHONPATH:=}:${TRAVIS_BUILD_DIR} \
        py.test \
        --cov=${MODULE} \
        -xvs \
        --pyargs ${MODULE} \
        ${TRAVIS_BUILD_DIR}

    cp ${TEST_DIR}/.coverage ${TRAVIS_BUILD_DIR}
}

ensure_clean_test_dir
do_test
