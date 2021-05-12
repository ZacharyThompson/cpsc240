#!/bin/bash

#Program: Interview
#Author: Zachary Thompson

#Delete some un-needed files
rm *.o *.lis *.out

echo "Assemble interview.asm."
nasm -f elf64 -l interview.lis -o interview.o interview.asm

echo "Compile second_degree.c using the gcc compiler."
gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c

echo "Link the object files using the gcc linker."
gcc -m64 -fno-pie -no-pie -o interview.out main.o interview.o

echo "Run the program Interview:"
./interview.out

echo "The script file will terminate."
