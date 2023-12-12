import 'package:final_project/squares.dart';

void main() {
  whatsAnIterable();
  operationsOnIterables();
  creatingIterablesUsingGenerators();
  creatingIterablesUsingIterators();
}

void whatsAnIterable() {
  print('// whatsAnIterable');

  final myList = ['bread', 'cheese', 'milk'];
  print(myList);

  for (final item in myList) {
    print(item);
  }

  final reversedIterable = myList.reversed;
  print(reversedIterable);

  final reversedList = reversedIterable.toList();
  print(reversedList);
}

void operationsOnIterables() {
  print('\n// operationsOnIterables');

  // final myIterable = Iterable();
  Iterable<String> myIterable = ['red', 'blue', 'green'];
  print(myIterable);

  final thirdElement = myIterable.elementAt(2);
  print(thirdElement);

  final firstElement = myIterable.first;
  final lastElement = myIterable.last;

  print(firstElement);
  print(lastElement);

  final numberElements = myIterable.length;
  print(numberElements);
}

// Dart has two generator functions (both use 'yield' in their bodies):
// - Synchronous  Generator: Returns an Iterable object.
// - Asynchronous Generator: Returns a  Stream   object.

// sync* : Read as “sync star”. You’re telling Dart that this function is a synchronous generator.
// You must return an Iterable from such a function.

// yield : This is similar to the return keyword for normal functions except that yield doesn't exit the function.
// Instead, yield generates a single value and then pauses until the next time you request a value from the iterable.
// Because iterables are lazy, Dart doesn't start the generator function until the first time you request a value from the iterable.

Iterable<int> hundredSquares() sync* {
  for (int i = 1; i <= 10; i++) {
    yield i * i;
  }
}

void creatingIterablesUsingGenerators() {
  print('\n// creatingIterablesUsingGenerators');
  final squares = hundredSquares();
  for (final int square in squares) {
    print(square);
  }
}

void creatingIterablesUsingIterators() {
  print('\n// creatingIterablesUsingIterators');
  final squares = HundredSquares();
  for (final int square in squares) {
    print(square);
  }
}
