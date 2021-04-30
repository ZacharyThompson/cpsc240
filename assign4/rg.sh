#!/bin/bash

#Program: Interview
#Author: Zachary Thompson

#Delete some un-needed files
rm *.o
rm *.lis
rm *.out

echo "Assemble interview.asm."
nasm -f elf64 -l interview.lis -o interview.o interview.asm -g -gdwarf

echo "Compile second_degree.c using the gcc compiler."
gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c -g

echo "Link the object files using the gcc linker."
gcc -m64 -fno-pie -no-pie -o interview.out main.o interview.o -g

echo "Run the program Interview:"
gdb ./interview.out

echo "The script file will terminate."
