// ignore_for_file: unused_local_variable

import 'dart:convert';

void main() {
  creatingMaps();
  initializingMapWithValues();
  uniqueKeys();
  operationsOnMap();
  mapsClassesJson();
}

void creatingMaps() {
  // final Map<String, int> emptyMap = {};
  final emptyMap = <String, int>{};
  // final emptySomething = {};
  final mySet = <String>{};
}

void initializingMapWithValues() {
  print('// initializingMapWithValues');
  final inventory = {'cakes': 20, 'pies': 14, 'donuts': 37, 'cookies': 141};
  final digitToWord = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};

  print(inventory);
  print(digitToWord);
}

void uniqueKeys() {
  final treasureMap = {
    'garbage': ['in the dumpster'],
    'glasses': ['on your head'],
    'gold': ['in the cave', 'under your mattress'],
  };

  final myHouse = {
    'bedroom': 'messy',
    'kitchen': 'messy',
    'living room': 'messy',
    'code': 'clean',
  };
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

  print(inventory.isEmpty);
  print(inventory.isNotEmpty);
  print(inventory.length);

  print(inventory.keys);
  print(inventory.values);

  print(inventory.containsKey('pies'));
  print(inventory.containsValue(42));

  for (final key in inventory.keys) {
    print(key);
  }

  for (final value in inventory.values) {
    print(value);
  }

  for (final entry in inventory.entries) {
    print('${entry.key} -> ${entry.value}');
  }

  for (final entry in inventory.entries) {
    print(entry);
  }

  inventory.forEach((key, value) {
    print('$key -> ${inventory[key]}');
  });
}

// use freezed or json_serializable from https://pub.dev
void mapsClassesJson() {
  print('\n// mapsClassesJson');

  final userObject = User(
    id: 1234,
    name: 'John',
    emails: ['john@example.com', 'jhagemann@example.com'],
  );

  final userMap = userObject.toJson();
  print(userMap);

  final userString = json.encode(userMap);
  print(userString);

  final jsonString =
      '{"id":4321,"name":"Marcia","emails":["marcia@example.com"]}';

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
  const User({
    required this.id,
    required this.name,
    required this.emails,
  });

  factory User.fromJson(Map<String, dynamic> jsonMap) {
    dynamic id = jsonMap['id'];
    if (id is! int) id = 0;

    dynamic name = jsonMap['name'];
    if (name is! String) name = '';

    dynamic maybeEmails = jsonMap['emails'];
    final emails = <String>[];
    if (maybeEmails is List) {
      for (dynamic email in maybeEmails) {
        if (email is String) emails.add(email);
      }
    }

    return User(
      id: id,
      name: name,
      emails: emails,
    );
  }

  final int id;
  final String name;
  final List<String> emails;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'name': name, 'emails': emails};
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, emails: $emails)';
  }
}
