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
   File name: quad_library.cpp
   Language: C++
   Compile: g++ -c -Wall -m64 -fno-pie -no-pie -o quad_library.o quad_library.cpp
   Link: g++ -m64 -fno-pie -no-pie -o quadformula.out second_degree.o quadratic.o quad_library.o isfloat.o

----- Begin code area ------------------------------------------------------------------------------------------------------*/
#include <iostream>

extern "C" void show_no_root();
extern "C" void show_one_root(double root);
extern "C" void show_two_root(double root1, double root2);

void show_no_root() {
	std::cout << "There are no real roots to this equation." << std::endl;
}

void show_one_root(double root) {
	std::cout << "The root is " << root << std::endl;
}

void show_two_root(double root1, double root2) {
	std::cout << "The roots are " << root1 << " and " << root2 << std::endl;
}
//---------------------------------------------------------------------------------------------------------------------------
