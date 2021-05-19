#!/bin/bash
#Zachary Thompson
#zachth1723@csu.fullerton.edu

#Delete some un-needed files
rm *.o *.lis *.out

echo "Assemble harmonic.asm."
nasm -f elf64 -l harmonic.lis -o harmonic.o harmonic.asm -g -gdwarf

echo "Compile main.c with the gcc compiler"
gcc -c -Wall -m64 -no-pie -o main.o main.c -g

echo "Link the object files using the gcc linker."
gcc -m64 -no-pie -o harmonic.out main.o harmonic.o -g

echo "Run the program Harmonic:"
gdb ./harmonic.out

echo "The script file will terminate."

