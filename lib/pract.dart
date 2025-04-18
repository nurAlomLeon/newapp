import 'dart:io';

void main() {
  String? input = stdin.readLineSync();

  if (input != null) {
    var numbers = input.split(' ').map(int.parse).toList();

    if (numbers.length == 3) {
      int minValue = numbers.reduce((a, b) => a < b ? a : b);
      print(minValue);
    } else {
      print("Please enter exactly three numbers separated by spaces.");
    }
  } else {
    print("Invalid input.");
  }
}
