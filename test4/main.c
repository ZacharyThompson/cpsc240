// Zachary Thompson
// zachth1723@csu.fullerton.edu

#include <stdio.h>

extern double harmonic(int terms);
int main() {
	int terms;
	puts("This is 240-7 programming final by Zachary Thompson");

	printf("Enter the number of terms desired: ");
	scanf("%d", &terms);

	double answer = harmonic(terms);

	printf("The main program received this number and will keep it: %lf\n", answer);
	return 0;
}
