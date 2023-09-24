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
  print('// basicListOperations');
  // Creating a List
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
  desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  final secondElement = desserts[1];
  print(secondElement);
  final index = desserts.indexOf('pie');
  final value = desserts[index];
  print('The value at index $index is $value.');

  // Assigning Values to List Elements
  desserts[1] = 'cake';
  print(desserts);

  // Adding Elements to the End of a List
  desserts.add('brownies');
  print(desserts);

  // Inserting Elements
  desserts.insert(1, 'ice cream');
  print(desserts);

  // Removing Elements
  desserts.remove('cake');
  print(desserts);
  desserts.removeAt(0);
  print(desserts);

  // Sorting Lists
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
  print('\n// mutableAndImmutableLists');
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
  final unmodifiableList = List.unmodifiable(
      modifiableList); // create an unmodifiable list at run-time
  // unmodifiableList.removeLast();
  print(unmodifiableList);
}

class Desserts {
  Desserts(
      [this.desserts = const [
        'cookies'
      ]]); // content of default list is immutable because of const
  final List<String>
      desserts; // cannot reassign desserts because of final (but can't make it const because it must be initialized)
}

void listProperties() {
  print('\n// listProperties');
  const drinks = ['water', 'milk', 'juice', 'soda'];
  print(drinks.length);
  print(drinks.first);
  print(drinks[0]);
  print(drinks.last);
  print(drinks[drinks.length - 1]);
  print(drinks.isEmpty);
  print(drinks.length == 0);
  print(drinks.isNotEmpty);
  print(drinks.length > 0);
}

void loopingOverElementsOfList() {
  print('\n// loopingOverElementsOfList');
  const desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];

  // Using a For Loop
  for (int i = 0; i < desserts.length; i++) {
    final item = desserts[i];
    print('I like $item.');
  }

  // Using a For-In Loop
  for (final item in desserts) {
    print('I also like $item!');
  }
}

// Influenced by Flutter (makes it easier to build UI):
// - spread operator (...)
// - collection if
// - collection for
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
  const desserts = ['donuts', ...pastries, ...candy];
  print(desserts);

  // collection if
  const noPeanutAllergy = true;
  const sensitiveCandy = [
    'Junior Mints',
    'Twizzlers',
    if (noPeanutAllergy) 'Reeses'
  ];
  print(sensitiveCandy);

  // collection for
  // In Flutter, you might use the collection for to convert a list of strings into Text widgets.
  const deserts = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts) desert.toUpperCase()
  ];
  print(bigDeserts);
}

void handlingNullableLists() {
  print('\n// handlingNullableLists');
  // Nullable Lists
  List<int>? nullableList = [2, 4, 3, 7];
  print(nullableList);
  nullableList = null;
  print(nullableList);

  // Nullable Elements
  List<int?> nullableElements = [2, 4, null, 3, 7];
  print(nullableElements);

  // Nullable Lists and Nullable Elements
  List<int?>? nullableListAndElements = [2, 4, null, 3, 7];
  print(nullableListAndElements);
  nullableListAndElements = null;
  print(nullableListAndElements);

  // Using the Basic Null Aware Operators
  List<String?>? drinks = ['milk', 'water', null, 'soda'];
  for (String? drink in drinks) {
    int lettersLen = drink?.length ?? 0;
    print(lettersLen);
  }
  // Null-Aware Index Operator '?[]'
  List<String>? myDesserts = ['cake', 'pie'];
  myDesserts = null;
  String? dessertToday = myDesserts?[1];
  print(dessertToday);

  // Null-Aware Spread Operator '...?'
  List<String>? coffees;
  final hotDrinks = ['milk tea', ...?coffees];
  print(hotDrinks);
}
