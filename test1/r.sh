#!/bin/bash
#Zachary Thompson
#CPSC240-7 Test 1

#Delete some un-needed files
rm *.o
rm *.lis
rm *.out

echo "Assemble perimeter.asm."
nasm -f elf64 -l distance.lis -o distance.o distance.asm

echo "Compile rectangle.cpp using the gcc compiler."
gcc -c -Wall -m64 -no-pie -o euclid.o euclid.c

echo "Link the object files using the gcc linker."
gcc -m64 -no-pie -o euclid.out euclid.o distance.o

echo "Run the program Rectangle:"
./euclid.out

echo "The script file will terminate."
