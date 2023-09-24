// ignore_for_file: unused_local_variable

import 'package:final_project/math.dart' as math;

void main() {
  // stativ variables
  introduction();
  constants();
  singletons();
  // stativ methods
  staticMethods();
  creatingNewObjects();
}

void introduction() {
  print('// introduction');
  final value = SomeClass.myProperty;
  SomeClass.myMethod();
}

class SomeClass {
  static int myProperty = 0;
  static void myMethod() {
    print('Hello, Dart!');
  }
}

class TextStyle {
  static const _defaultFontSize = 17.0;
  TextStyle({this.fontSize = _defaultFontSize});
  final double fontSize;
}

class Colors {
  static const int red = 0xFFD13F13;
  static const int purple = 0xFF8107D9;
  static const int blue = 0xFF1432C9;
}

void constants() {
  print('\n// constants');
  final backgroundColor = Colors.purple;
  print(backgroundColor.toRadixString(16).toUpperCase());
}

// class MySingleton {
//   MySingleton._();
//   static final MySingleton instance = MySingleton._();
// }

class MySingleton {
  // MySingleton._internal(); // an often used name: 'internal'
  MySingleton._();
  static final MySingleton _instance = MySingleton._();
  // (unnamed) factory constructor because we return an already existing instance and hides the fact that it is a singleton
  factory MySingleton() => _instance;
}

void singletons() {
  print('\n// singletons');
  // final mySingleton = MySingleton.instance;
  final mySingleton =
      MySingleton(); // user does not need to know that it is a singleton
  print(mySingleton);
}

class Math {
  static num max(num a, num b) {
    return (a > b) ? a : b;
  }

  static num min(num a, num b) {
    return (a < b) ? a : b;
  }
}

void staticMethods() {
  print('\n// staticMethods');
  // static methods
  print(Math.max(2, 3));
  print(Math.min(2, 3));

  // better use a library
  print(math.max(2, 3));
  print(math.min(2, 3));
}

class User {
  const User({int id = 0, String name = 'anonymous'})
      : _id = id,
        _name = name;

  const User.anonymous() : this();

  // factory constructor vs. static method:

  // 1. A factory constructor can only return an instance of the class type or subtype, whereas a static method can return
  //    anything. For example, a static method can be asynchronous and return a Future — which you’ll learn about in
  //    Dart Apprentice: Beyond the Basics, Chapter 12, “Futures” — but a factory constructor can’t do this.

  // 2. A factory constructor can be unnamed, so from the caller’s perspective, it looks exactly like calling a generative
  //    constructor. The singleton example above is an example of this. A static method, on the other hand, must have a name.

  // 3. A factory constructor can be const if it’s a forwarding constructor, but a static method can’t.

  // factory User.fromJson(Map<String, Object> json) {
  //   final userId = json['id'] as int;
  //   final userName = json['name'] as String;
  //   return User(id: userId, name: userName);
  // }

  static User fromJson(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User(id: userId, name: userName);
  }

  final String _name;
  final int _id;

  String toJson() {
    return '{"id":$_id,"name":"$_name"}';
  }

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}

void creatingNewObjects() {
  print('\n// creatingNewObjects');
  final map = {'id': 10, 'name': 'Sandra'};
  final sandra = User.fromJson(map);
  print(sandra);
}
