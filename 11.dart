class Car {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);

  void displayInfo() {
    print('Car Details:');
    print('Car Brand: $brand');
    print('Car Model: $model');
    print('Car Year: $year');
  }
}

void main() {
  Car myCar = Car('Toyota', 'Corolla', 2020);
  myCar.displayInfo();
}
