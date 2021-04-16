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
   File name: isfloat.cpp
   Language: C++
   Compile: g++ -c -Wall -m64 -fno-pie -no-pie -o isfloat.o isfloat.cpp
   Link: g++ -m64 -fno-pie -no-pie -o quadformula.out second_degree.o quadratic.o quad_library.o isfloat.o

----- Begin code area ------------------------------------------------------------------------------------------------------*/
#include <ctype.h>

extern "C" bool isfloat(char s[]);

//Check if char array is a valid float format
bool isfloat(char s[]) {
	bool decimal_point_found = false;
	
	/*loop through all elements of string and
	check if all characters are digits or -,+,. in correct locations*/
	for (unsigned int i = 0; s[i] != '\0'; i++) {
		if (!isdigit(s[i])) {
			if ((s[i] == '-' || s[i] == '+') && i == 0)
				continue;
			else if (s[i] == '.' && !decimal_point_found)
				decimal_point_found = true;
			else
				return false;
		}
	}

	//float number needs decimal point
	if (!decimal_point_found)
		return false;

	return true;
}
//---------------------------------------------------------------------------------------------------------------------------
