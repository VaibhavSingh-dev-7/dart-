void main() {
  int a = 8, b = 4;
  print('Sum: ${add(a, b)}');
  print('Difference: ${subtract(a, b)}');
  print('Product: ${multiply(a, b)}');
  print('Quotient: ${divide(a, b)}');
}

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;
int multiply(int a, int b) => a * b;
double divide(int a, int b) => a / b;
