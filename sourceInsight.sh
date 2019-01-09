#!/bin/bash

if [[ $1 == "clean" ]]
then
    rm -f cscope.in.out cscope.out cscope.po.out tags 
else
    find . -name "*.h" -o -name "*.c" -o -name "*.hh" -o -name "*.cpp" -o -name "*.cc"  -o -name "*.s"  -o -name "*.S"  -o -name "*.asm"  -o -name "*.ASM"> ~/cscope.files
    cscope -bkq -i ~/cscope.files
    ctags -R
fi

