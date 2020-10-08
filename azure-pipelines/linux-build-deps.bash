#!/bin/bash
set -ex

pushd $1/zlib
./configure &&
make -j install &&
popd

pushd $1/jpeg
./configure &&
make -j install &&
popd

pushd $1/qpdf
./autogen.sh &&
./configure &&
make -j install &&
popd

# For Python 3.9, we need to build lxml from source until they provide a binary
# wheel for it.
yum install -y libxslt-devel libxml2-devel
