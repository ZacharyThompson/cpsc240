#!/bin/bash

#Program: Quadratic Formula
#Author: Zachary Thompson

#Delete some un-needed files
rm *.o
rm *.lis
rm *.out

echo "Assemble perimeter.asm."
nasm -f elf64 -l quadratic.lis -o quadratic.o quadratic.asm

echo "Compile second_degree.c using the gcc compiler."
gcc -c -Wall -m64 -fno-pie -no-pie -o second_degree.o second_degree.c

echo "Compile quad_library.cpp using the g++ compiler."
g++ -c -Wall -m64 -fno-pie -no-pie -o quad_library.o quad_library.cpp

echo "Compile isfloat.cpp using the g++ compiler."
g++ -c -Wall -m64 -fno-pie -no-pie -o isfloat.o isfloat.cpp

echo "Link the object files using the g++ linker."
g++ -m64 -fno-pie -no-pie -o quadformula.out second_degree.o quadratic.o quad_library.o isfloat.o

echo "Run the program Quadratic Formula:"
./quadformula.out

echo "The script file will terminate."
