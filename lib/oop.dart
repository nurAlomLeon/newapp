class Car{
  final String? name;
  final String? model;
  final int? price;
  const Car(this.name,this.model,this.price);
  display(){
    print("car name is $name , model is $model, car price is $price ");
  }

}

main(){
  Car newCar=Car('Supra', '911 tarbo', 100000);
  Car newCar2=Car('TATA', 'Nano', 2000);
  print(newCar.name);
  print(newCar.model);
  print(newCar.price);
  print(newCar2.name);
  print(newCar2.model);
  print(newCar2.price);
}