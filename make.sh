#!/bin/bash
#sphinx-build -b html docs/source/ docs/build/

pushd docs

make clean
make html

popd
