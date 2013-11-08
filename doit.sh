
EMCC=emcc

cd CBLAS/src

for i in `ls *.c`; do
     ${EMCC} -c $i -I../include;
done

for i in `ls *.f`; do
    gcc-4.7 -c -S \
        -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.7/plugin/dragonegg.so  \
        -fplugin-arg-dragonegg-emit-ir \
        $i;
done

for i in `ls *.s`; do
    llvm-as $i;
done

emcc *.o *.bc -O2 -o blas.js

