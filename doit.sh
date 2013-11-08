#!/bin/bash

wget --continue http://www.netlib.org/blas/blast-forum/cblas.tgz
rm -rf CBLAS
tar zxvf cblas.tgz
cp Makefile.emcc CBLAS/Makefile.in
cp Makefile_CBLAS_src CBLAS/src/Makefile
pushd CBLAS
make alllib
popd
emcc CBLAS/src/*.o -O2 -o blas.js
#emcc *.o *.bc -O2 -o blas.js

