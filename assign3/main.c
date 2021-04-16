/*---------------------------------------------------------------------------------------------------------------------------
Program name: "Sum of Array".
This program takes in float numbers from the user and returns the sum of those numbers.
Copyright (C) 2021 Zachary Thompson.

This file is part of the software program "Sum of Array".
Sum of Array is free software: you can redistribute it and/or modify it under the terms of the GNU
General Public License version 3 as published by the Free Software Foundation.
Sum of Array is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------------------------------------------------
Author information
  Author name: Zachary Thompson
  Author email: zachth1723@csu.fullerton.edu

Program information
  Program name: Sum of Array
  Programming languages: One module in C Language, One module in C++, and Three modules in X86.
  Correct Platform: GNU/Linux with Bash shell.
  Date program began: 2021-Mar-06
  Date of last update: 2021-Mar-21
  Files in this program: control.asm, display.cpp, fill.asm, main.c, sum.asm
  Status: Complete.

Purpose
  Compute the sum of the float numbers contained in an array.

This file
  File name: control.asm
  Language: C
  Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c
  Link: g++ -m64 -fno-pie -no-pie -o arraysum.out control.o display.o fill.o main.o sum.o
----- Begin code area -----------------------------------------------------------------------------------------------------*/
#include <stdio.h>

// control will create array of floats and return the sum of its elements
extern double control();

int main() {
	puts("Welcome to High Speed Array Summation by Zachary Thompson.");
	puts("Software Licensed by GNU GPL 3.0.");
	puts("Version 1.0 released on March 21, 2021.");
	double sum = control(); 
	printf("The main has received this number %.8lf and will keep it.\n", sum);
	puts("Thank you for using High Speed Array Software.");
	puts("For system support contact Zachary Thompson at zachth1723@csu.fullerton.edu.");
	puts("A zero will be returned to the operating system.");
	return 0;
}
