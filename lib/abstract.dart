abstract class Vehicle{
  int ? _speed;
  void move();
  set setSpeed(int speed){
    _speed=speed;
  }

  int get getSpeed{
    return _speed ?? 0;
  }
}

class Car extends Vehicle{
  @override
  move() {
    print("The car is moving at $getSpeed km/h");

  }
}

void main(){
 Car car1=Car();
 car1.setSpeed=100;
 car1.move();
}