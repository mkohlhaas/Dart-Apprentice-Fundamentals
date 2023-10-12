// ignore_for_file: unused_local_variable

import 'dart:math';

void main() {
  creatingSets();
  operationsOnSets();
  intersectionUnionDifference();
  findingDuplicates();
}

void creatingSets() {
  print('// creatingSets');
  final someSet = <int>{1, 2, 3};
  final Set<int> otherSet = {1, 2, 3};
  final anotherSet = {1, 2, 3, 1};
  print(someSet);
  print(otherSet);
  print(anotherSet);
}

void operationsOnSets() {
  print('\n// operationsOnSets');
  final desserts = {'cake', 'pie', 'donut'};
  print(desserts.contains('cake')); // true
  print(desserts.contains('cookies')); // false

  final drinks = <String>{};
  drinks.add('cola');
  drinks.add('water');
  drinks.add('cola');
  print(drinks); // {cola, water}

  drinks.remove('water');
  print(drinks); // {cola}

  drinks.addAll(['juice', 'coffee', 'milk']);
  drinks.addAll({'juices', 'coffees', 'milks'});
  print(drinks); // {cola, juice, coffee, milk, juices, coffees, milks}

  // for-in loop
  print('\n// for-in loop');
  for (final drink in drinks) {
    print("I'm drinking $drink.");
  }

  // remove
  print('\n// remove');
  final beverages = drinks;
  print(drinks);
  beverages.remove('milk');
  print(drinks);

  // ignore: prefer_collection_literals
  final liquids = ['juice', 'coffee', 'milk'].toSet();
  print(drinks);
  liquids.remove('coffee');
  print(drinks);
  print(liquids);
}

// Operations know from lists are also possible:
// collection if
// collection for
// spread operators (...)

void intersectionUnionDifference() {
  print('\n// intersectionUnionDifference');
  final setA = {8, 2, 3, 1, 4};
  final setB = {1, 6, 5, 4};
  final intersection = setA.intersection(setB);
  print('intersection: $intersection');

  final union = setA.union(setB);
  print('union: $union');

  final differenceA = setA.difference(setB);
  print('differenceA: $differenceA');

  final differenceB = setB.difference(setA);
  print('differenceB: $differenceB');
}

void findingDuplicates() {
  print('\n// findingDuplicates');
  final randomGenerator = Random();
  final randomIntList = <int>[];
  for (int i = 0; i < 10; i++) {
    final randomInt = randomGenerator.nextInt(10) + 1;
    randomIntList.add(randomInt);
  }
  print('randomIntList: $randomIntList');

  final uniqueValues = <int>{};
  final duplicates = <int>{};
  for (int number in randomIntList) {
    if (uniqueValues.contains(number)) {
      duplicates.add(number);
    }
    uniqueValues.add(number);
  }
  print('duplicates: $duplicates');
}
