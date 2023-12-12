// ignore_for_file: unused_local_variable

import 'dart:convert' show jsonEncode, jsonDecode;

void main() {
  creatingMaps();
  initializingMapWithValues();
  uniqueKeys();
  operationsOnMap();
  mapsClassesJson();
}

void creatingMaps() {
  print('// creatingMaps');
  // final Map<String, int> emptyMap = {};
  final emptyMap = <String, int>{};
  // final emptySomething = {};
  final mySet = <String>{};
}

void initializingMapWithValues() {
  print('\n// initializingMapWithValues');
  final inventory = {'cakes': 20, 'pies': 14, 'donuts': 37, 'cookies': 141};
  final digitToWord = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};

  print(inventory);
  print(digitToWord);
}

void uniqueKeys() {
  print('\n// uniqueKeys');
  final treasureMap = {
    'garbage': ['in the dumpster'],
    // 'garbage': [''],
    'glasses': ['on your head'],
    'gold': ['in the cave', 'under your mattress'],
  };
  print(treasureMap);

  final myHouse = {
    'bedroom': 'messy',
    'kitchen': 'messy',
    'living room': 'messy',
    'code': 'clean',
  };
  print(myHouse);
}

void operationsOnMap() {
  print('\n// operationsOnMap');
  final inventory = {'cakes': 20, 'pies': 14, 'donuts': 37, 'cookies': 141};
  print(inventory);

  final numberOfCakes = inventory['cakes'];
  print(numberOfCakes);
  print(numberOfCakes?.isEven);

  inventory['brownies'] = 3;
  print(inventory);

  inventory['cakes'] = 1;
  print(inventory);

  inventory.remove('cookies');
  print(inventory);

  print('isEmpty? ${inventory.isEmpty}');
  print('isNotEmpty? ${inventory.isNotEmpty}');
  print('length: ${inventory.length}');

  print('keys: ${inventory.keys}');
  print('values: ${inventory.values}');

  print("containsKey 'pies' ? ${inventory.containsKey('pies')}");
  print('containsValue 42 ? ${inventory.containsValue(42)}');

  print('\nPrint all keys:');
  for (final key in inventory.keys) {
    print(key);
  }

  print('\nPrint all values:');
  for (final value in inventory.values) {
    print(value);
  }

  print('\nPrint Map:');
  for (final entry in inventory.entries) {
    print('${entry.key} -> ${entry.value}');
  }

  print('\nPrint MapEntries:');
  for (final entry in inventory.entries) {
    print(entry);
  }

  print('\nPrint Map with forEach loop:');
  inventory.forEach((key, value) {
    print('$key -> ${inventory[key]}');
  });
}

// use freezed or json_serializable from https://pub.dev
void mapsClassesJson() {
  print('\n// mapsClassesJson');

  final userObject = User(1234, 'John', ['john@example.com', 'jhagemann@example.com']);
  final userMap = userObject.toJson();
  print(userMap);

  // final userString = json.encode(userMap);
  final userString = jsonEncode(userMap);
  print(userString);

  final jsonString = '{"id":4321,"name":"Marcia","emails":["marcia@example.com"]}';

  // final jsonMap = jsonDecode(jsonString);
  dynamic jsonMap = jsonDecode(jsonString);

  if (jsonMap is Map<String, dynamic>) {
    print("You've got a map!");
  } else {
    print('Your JSON must have been in the wrong format.');
  }

  final userMarcia = User.fromJson(jsonMap);
  print(userMarcia);
}

class User {
  final int id;
  final String name;
  final List<String> emails;

  const User(this.id, this.name, this.emails);

  factory User.fromJson(Map<String, dynamic> jsonMap) {
    var id = jsonMap['id'] as int;
    var name = jsonMap['name'] as String;
    var tmpEmails = jsonMap['emails'] as List<dynamic>;
    List<String> emails = tmpEmails.map((e) => e.toString()).toList();
    return User(id, name, emails);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'name': name, 'emails': emails};
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, emails: $emails)';
  }
}
