// ignore_for_file: unused_local_variable

void main() {
  basicListOperations();
  mutableAndImmutableLists();
  creatingDeeplyImmutableLists();
  listProperties();
  loopingOverElementsOfList();
  codeAsUi();
  handlingNullableLists();
}

void basicListOperations() {
  print('/// basicListOperations');
  // Creating a List
  print('\n// Creating a List');
  var desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  print(desserts);
  desserts.clear();
  print(desserts);
  desserts = [];
  print(desserts);
  // var snacks = [];
  // List<String> snacks = [];
  var snacks = <String>[];

  // Accessing Elements
  print('\n// Accessing Elements');
  desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  final secondElement = desserts[1];
  print(secondElement);
  if (desserts.contains("pie")) {
    final index = desserts.indexOf('pie');
    final value = desserts[index];
    print('The value at index $index is $value.');
  }
  // Assigning Values to List Elements
  print('\n// Assigning Values to List Elements');
  desserts[1] = 'cake';
  print(desserts);

  // Adding Elements to the End of a List
  print('\n// Adding Elements to the End of a List');
  desserts.add('brownies');
  print(desserts);

  // Inserting Elements
  print('\n// Inserting Elements');
  desserts.insert(1, 'ice cream');
  print(desserts);

  // Removing Elements
  print('\n// Removing Elements');
  print('removed cake? ${desserts.remove('cake')}');
  print(desserts);
  print('removed ${desserts.removeAt(0)}');
  print(desserts);

  // Sorting Lists
  print('\n// Sorting Lists ');
  final integers = [32, 73, 2, 343, 7, 10, 1];
  print(integers);
  integers.sort();
  print(integers);
  final smallest = integers[0];
  print(smallest);
  final lastIndex = integers.length - 1;
  final largest = integers[lastIndex];
  print(largest);

  final animals = ['zebra', 'dog', 'alligator', 'cat'];
  print(animals);
  animals.sort();
  print(animals);
}

void mutableAndImmutableLists() {
  print('\n/// mutableAndImmutableLists');
  final desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // desserts = [];
  // desserts = ['cake', 'ice cream'];
  // desserts = someOtherList;

  desserts.remove('cookies');
  desserts.remove('cupcakes');
  desserts.add('ice cream');
  print(desserts);
}

void creatingDeeplyImmutableLists() {
  print('\n// creatingDeeplyImmutableLists');
  const desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // final desserts = const ['cookies', 'cupcakes', 'donuts', 'pie'];
  // desserts.add('brownie'); // run-time error!
  // desserts.remove('pie'); // run-time error!
  // desserts[0] = 'fudge'; // run-time error!
  print(desserts);

  final modifiableList = [DateTime.now(), DateTime.now()];
  print(modifiableList);
// create an unmodifiable list at run-time
  final unmodifiableList = List.unmodifiable(modifiableList);
  // unmodifiableList.removeLast(); // run-time error
}

class Desserts {
  // content of default list is immutable because of const
  Desserts([this.desserts = const ['cookies']]);
  // cannot reassign desserts because of final (but can't make it const because it must be initialized)
  final List<String> desserts;
}

void listProperties() {
  print('\n// listProperties');
  const drinks = ['water', 'milk', 'juice', 'soda'];
  print('length: ${drinks.length}');
  print('first: ${drinks.first}');
  print('first: ${drinks[0]}');
  print('last: ${drinks.last}');
  print('last: ${drinks[drinks.length - 1]}');
  print('is empty? ${drinks.isEmpty}');
  print('is empty? ${drinks.isEmpty.toString()}');
  print(drinks.isNotEmpty);
  // ignore: prefer_is_empty
  print(drinks.length > 0);
}

void loopingOverElementsOfList() {
  print('\n// loopingOverElementsOfList');
  const desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];

  // Using a For Loop
  print('\n// Using a For Loop');
  for (int i = 0; i < desserts.length; i++) {
    final item = desserts[i];
    print('I like $item.');
  }

  // Using a For-In Loop
  print('\n// Using a For-In Loop');
  for (final item in desserts) {
    print('I like $item, too!');
  }
}

// Influenced by Flutter (makes it easier to build UI):
// - spread operator (...)
// - collection-if
// - collection-for
// in a Flutter app, you see lists of Widget elements (Text, Icon, Button, ...)
void codeAsUi() {
  print('\n// codeAsUi');
  const pastries = ['cookies', 'croissants'];
  const candy = ['Junior Mints', 'Twizzlers', 'M&Ms'];
  print(pastries);
  print(candy);

  // final desserts = ['donuts'];
  // desserts.addAll(pastries);
  // desserts.addAll(candy);
  // print(desserts);

  // spread operator
  const desserts = ['donuts', ...pastries, ...candy, 'cheese cake'];
  print(desserts);

  // collection-if
  const noPeanutAllergy = true;
  const sensitiveCandy = [
    'Junior Mints',
    'Twizzlers',
    if (noPeanutAllergy) 'Reeses' // collection-if
  ];
  print(sensitiveCandy);

  // collection-for
  // In Flutter, you might use the collection for to convert a list of strings into Text widgets.
  const deserts = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts) desert.toUpperCase() // collection-for
  ];
  print(bigDeserts);
}

void handlingNullableLists() {
  print('\n/// handlingNullableLists');
  // Nullable Lists
  print('\n// Nullable Lists');
  List<int>? nullableList = [2, 4, 3, 7];
  print(nullableList);
  nullableList = null;
  print(nullableList);

  // Nullable Elements
  print('\n// Nullable Elements');
  List<int?> nullableElements = [2, 4, null, 3, 7];
  print(nullableElements);

  // Nullable Lists and Nullable Elements
  print('\n// Nullable Lists and Nullable Elements');
  List<int?>? nullableListAndElements = [2, 4, null, 3, 7];
  print(nullableListAndElements);
  nullableListAndElements = null;
  print(nullableListAndElements);

  // Using the Basic Null Aware Operators
  print('\n// Using the Basic Null Aware Operators');
  List<String?>? drinks = ['milk', 'water', null, 'soda'];
  for (String? drink in drinks) {
    int lettersLen = drink?.length ?? 0;
    print(lettersLen);
  }

  // Null-Aware Index Operator '?[]'
  print('\n// Null-Aware Index Operator ?[]');
  List<String>? myDesserts = ['cake', 'pie'];
  myDesserts = null;
  String? dessertToday = myDesserts?[1];
  print(dessertToday);

  // Null-Aware Spread Operator '...?'
  print('\n// Null-Aware Spread Operator ...?');
  List<String>? coffees;
  final hotDrinks = ['milk tea', ...?coffees];
  print(hotDrinks);
}
