#!/bin/bash

cp Makefile.emcc CBLAS/Makefile.in
cp Makefile_CBLAS_src CBLAS/src/.
cd CBLAS
make


#emcc *.o *.bc -O2 -o blas.js

