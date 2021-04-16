#!/bin/bash

#Program: Rectangle
#Author: Zachary Thompson

#Delete some un-needed files
rm *.o
rm *.lis
rm *.out

echo "Assemble perimeter.asm."
nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

echo "Compile rectangle.cpp using the g++ compiler."
g++ -c -Wall -m64 -no-pie -o rectangle.o rectangle.cpp

echo "Link the object files using the g++ linker."
g++ -m64 -no-pie -o rectangle.out rectangle.o perimeter.o

echo "Run the program Rectangle:"
./rectangle.out

echo "The script file will terminate."
