/*---------------------------------------------------------------------------------------------------------------------------
Program name: "Rectangle".
This program takes the sides of a rectangle and returns the perimeter and average side length  
of the rectangle.
Copyright (C) 2021 Zachary Thompson.                                                                         
                                                                                                                           
This file is part of the software program "Rectangle".                                                                     
Rectangle is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License     
version 3 as published by the Free Software Foundation.                                                                    
Rectangle is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
-----------------------------------------------------------------------------------------------------------------------------
Author information ;
  Author name: Zachary Thompson
  Author email: zachth1723@csu.fullerton.edu

Program information
  Program name: Rectangle
  Programming languages: One module in C++ and one module in X86
  Date program began: 2021-Jan-27
  Date of last update: 2021-Feb-12
  Files in this program: rectangle.cpp, perimeter.asm
  Status: Complete.

This file
  File name: rectangle.cpp
  Language: C++.
  Compile: g++ -c -Wall -m64 -no-pie -o rectangle.o rectangle.cpp
  Link:g++ -m64 -no-pie -o rectangle.out rectangle.o perimeter.o
----- Begin code area ----------------------------------------------------------------------------------------------------*/
#include <iostream>

extern "C" double perimeter();

int main() {
	std::cout << "Welcome to an friendly assembly program by Zachary Thompson." << std::endl;
	double answer = perimeter();
	std::cout << "The main function received this number " << answer << " and decided to keep it." << std::endl;
	std::cout << "A 0 will be returned to the operating system." << std::endl;
	std::cout << "Have a nice day." << std::endl;

	return 0;
}
//--------------------------------------------------------------------------------------------------------------------------
