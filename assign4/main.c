/*---------------------------------------------------------------------------------------------------------------------------
Program name: "Interview".
This program <+++++>
Copyright (C) 2021 Zachary Thompson.

This file is part of the software program "Interview".
Interview is free software: you can redistribute it and/or modify it under the terms of the GNU
General Public License version 3 as published by the Free Software Foundation.
Interview is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------------------------------------------------
Author information
  Author name: Zachary Thompson
  Author email: zachth1723@csu.fullerton.edu

Program information
  Program name: Interview
  Programming languages: One module in C Languageand one module in X86.
  Correct Platform: GNU/Linux with Bash shell.
  Date program began: 2021-Apr-13
  Date of last update: 2021-Apr-25
  Files in this program: interview.asm, main.c
  Status: Complete.

Purpose
  <+++++>

This file
  File name: main.c
  Language: C
  Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c
  Link: g++ -m64 -fno-pie -no-pie -o interview.out interview.o main.o
----- Begin code area -----------------------------------------------------------------------------------------------------*/
#include <stdio.h>
extern double interview(char name[], double expected);

int main()
{
	char name[50];
	double expected;

	puts("Welcome to Software Analysis by Paramount Programmers, Inc.");
	puts("Please enter your first and last names and press enter: ");
	scanf("%s", name);

	printf("Please enter your expected annual salary when employed at Paramount: ");
	scanf("%lf", expected);
	printf("Thank you %s.  Our records show that you applied for employment her with our agency a week ago.\n", name);
	puts("Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly.");

	double salary = interview(name, expected);
	printf("Hello %s I am the receptionist.\n", name);
	printf("This envelope contains your job offer with starting salary %lf.  Please check back on Monday morning at 8am.\nBye\n", salary);

	return 0;
}
