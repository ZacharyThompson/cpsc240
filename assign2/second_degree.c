/*----------------------------------------------------------------------------------------------------------------------------
Program name: "Quadratic Formula".
This program takes in 3 floating point numbers and displays the roots of the corresponding quadratic equation.

Copyright (C) 2021 Zachary Thompson.                                                                         
                                                                                                                           
This file is part of the software program "Quadratic Formula".                                                                     
Quadratic Formula is free software: you can redistribute it and/or modify it under the terms of the GNU
General Public License version 3 as published by the Free Software Foundation.                                                                    
Quadratic Formula is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
----------------------------------------------------------------------------------------------------------------------------
Author information ;
  Author name: Zachary Thompson
  Author email: zachth1723@csu.fullerton.edu

Program information
  Program name: Quadratic Formula
  Programming languages: One module in C Language, Two modules in C++, and one module in X86.
  Date program began: 2021-Feb-20
  Date of last update: 2021-Feb-28
  Files in this program: quadratic.asm, second_degree.c, quad_library.cpp, isfloat.cpp
  Status: Complete.

This file
   File name: second_degree.c
   Language: C
   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o second_degree.o second_degree.c
   Link: g++ -m64 -fno-pie -no-pie -o quadformula.out second_degree.o quadratic.o quad_library.o isfloat.o

----- Begin code area ------------------------------------------------------------------------------------------------------*/
#include <stdio.h>

extern double quadratic();

int main() {
	puts("Welcome to Quadratic Formula\nProgrammed by Zachary Thompson.\n");
	double root = quadratic();
	printf("The main driver received %lf and has decided to keep it.\n", root);
	puts("Now 0 will be returned to the operating system. Have a nice day. Bye.\n");

	return 0;
}
//---------------------------------------------------------------------------------------------------------------------------
