#!/bin/bash

#Program: Sum of Array
#Author: Zachary Thompson

#Delete some un-needed files
rm *.o
rm *.lis
rm *.out

echo "Assemble control.asm."
nasm -f elf64 -l control.lis -o control.o control.asm

echo "Assemble fill.asm."
nasm -f elf64 -l fill.lis -o fill.o fill.asm

echo "Assemble sum.asm."
nasm -f elf64 -l sum.lis -o sum.o sum.asm

echo "Compile main.c using the gcc compiler."
gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c

echo "Compile display.cpp using the g++ compiler."
g++ -c -Wall -m64 -fno-pie -no-pie -o display.o display.cpp

echo "Link the object files using the g++ linker."
g++ -m64 -fno-pie -no-pie -o arraysum.out control.o display.o fill.o main.o sum.o

echo "Run the program Sum of Array:"
./arraysum.out

echo "The script file will terminate."
