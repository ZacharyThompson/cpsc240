/*---------------------------------------------------------------------------------------------------------------------------
Program name: "Interview".
This program conducts a job interview accounting for 3 types of programmers:
social science majors, CS majors, and assembly programmer.
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
  Programming languages: One module in C Language and one module in X86.
  Correct Platform: GNU/Linux with Bash shell.
  Date program began: 2021-Apr-13
  Date of last update: 2021-May-10
  Files in this program: interview.asm, main.c
  Status: Complete.

Purpose
  This program conducts a job interview accounting for 3 types of programmers:
  social science majors, CS majors, and assembly programmer.

This file
  File name: main.c
  Language: C
  Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c
  Link: g++ -m64 -fno-pie -no-pie -o interview.out interview.o main.o
----- Begin code area -----------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
extern double interview(char *name, double expected);

int main()
{
	char name[50];
	double salary, expected;

	puts("Welcome to Software Analysis by Paramount Programmers, Inc.");
	puts("Please enter your first and last names and press enter: ");
	fgets(name, 50, stdin);

	/* Remove newline at end of string
	 * Credit: Tim Čas
	 * https://stackoverflow.com/a/28462221 */
	name[strcspn(name, "\n")] = 0;

	printf("Please enter your expected annual salary when employed at Paramount: ");
	scanf("%lf", &expected);
	while((getchar())!='\n'); 

	printf("Thank you %s. Our records show that you applied for employment her with our agency a week ago.\n", name);
	puts("Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly.");

	salary = interview(name, expected);

	if (salary == 88000.88) { // CS Major
		printf("Hello %s I am the receptionist.\n", name);
		puts("This envelope contains your job offer with starting salary 88000.88.");
		puts("Please check back on Monday morning at 8am.");
		puts("Bye");
	} else if (salary == 1000000.00) { // Chris Sawyer
		puts("Hello Mr. Sawyer. I am the receptionist.");
		puts("This envelope contains your job offer starting at 1 million annual.");
		puts("Please start any time you like. In the middle time our CTO wishes to have dinner with you.");
		puts("Have very nice evening Mr Sawyer.");
	} else if (salary == 1200.12) {// Social Science Major
		printf("Hello %s I am the receptionist.\n", name);
		puts("We have an opening for you in the company cafeteria for $1200.12 annually.");
		puts("Take your time to let use know your decision.");
		puts("Bye");
	}

	return 0;
}
