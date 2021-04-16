//Zachary Thompson
//CPSC240-7 Test 1

#include <stdio.h>

extern double distance();

int main(){
	printf("Welcome to the Euclidean Distance Finder Programmed by Zachary Thompson\n");
	double dist = distance();
	printf("The Euclid module received this number %lf, and has decided to keep it.\n", dist);
	printf("A 0 will be returned to the operating system. Stay safe and well.\n");
	return 0;
}
