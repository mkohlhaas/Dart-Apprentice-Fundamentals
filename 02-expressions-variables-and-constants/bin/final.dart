// ignore_for_file: unused_local_variable

import 'dart:math';

void main() {
  print('Hello, Dart!');

  /// Printing output

  print('Hello, Dart Apprentice reader!');

  /// Arithmetic operations

  /// Simple operations
  print(2 + 6);
  print(10 - 2);
  print(2 * 4);
  print(24 / 3);

  print(2 + 6);
  print(2 + 6);

  /// Decimal numbers
  print(22 / 7);
  print(22 ~/ 7);

  /// The Euclidean modulo operation
  print(28 % 10);

  /// Order of operations
  print(((8000 / (5 * 10)) - 32) ~/ (29 % 5));
  print(350 / 5 + 2);
  print(350 / (5 + 2));

  /// Math functions
  print(sin(45 * pi / 180));
  print(cos(135 * pi / 180));
  print(sqrt(2));
  print(max(5, 10));
  print(min(-5, -10));
  print(max(sqrt(2), pi / 2));

  /// Naming data

  /// Variables
  int number = 10;
  number = 15;
  double apple = 3.14159;
  print(10.isEven);
  print(3.14159.round());

  /// Type safety
  int myInteger = 10;
  // myInteger = 3.14159; // Error. That not allowed.

  num myNumber;
  myNumber = 10; // OK
  myNumber = 3.14159; // OK
  // myNumber = 'ten'; // Error

  dynamic myVariable;
  myVariable = 10; // OK
  myVariable = 3.14159; // OK
  myVariable = 'ten'; // OK

  /// Type inference
  var someNumber = 10;
  someNumber = 15; // OK
  // someNumber = 3.14159; // Error

  /// Constants
  const myConstant = 10;
  // myConstant = 0; // Not allowed.

  // No need to import DateTime as it's part of the core package.
  // Core package is imported automatically.
  final hoursSinceMidnight = DateTime.now().hour;
  // hoursSinceMidnight = 0; // Not allowed.

  /// Increment and decrement
  var counter = 0;
  counter += 1;
  counter -= 1;
  counter = counter + 1;
  counter = counter - 1;
  counter++;
  counter--;
  print(counter);

  double myValue = 10;
  myValue *= 3;
  myValue /= 2;
  myValue = myValue * 3;
  myValue = myValue / 2;
  print(myValue);
}
