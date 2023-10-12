// ignore_for_file: unused_local_variable, unused_field, unused_element, dead_code

// Dart 2.12 introduced "sound null safety" to the language.
// Sound null safety distinguishes nullable and non-nullable types.
// 'late' and '!' opt out of sound null safety, so use them carefully.

import 'dart:io' show sleep;

void main() {
  // Null overview
  whatNullMeans();
  problemWithNull();
  nullableVsNonNullable();
  // Handling nullable types
  handlingNullableTypes();
  typePromotion();
  // Null‐Aware Operators
  ifNullOperator();
  nullAwareAssignmentOperator();
  nullAwareAccess();
  nullAssertionOperator();
  nullAwareCascadeOperator();
  nullableInstanceVariables();
  lateKeyword();
}

// Null overview

void whatNullMeans() {
  print('// whatNullMeans');
  int postalCode = 12345;
  // int postalCode = null;
  print(postalCode);
}

void problemWithNull() {
  print('\n// problemWithNull');
  // bool isPositive(anInteger) {
  bool isPositive(int anInteger) {
    return !anInteger.isNegative;
  }

  print(isPositive(3));
  print(isPositive(-1));
  // print(isPositive(null));
}

void nullableVsNonNullable() {
  print('\n// nullableVsNonNullable');
  int myInt = 1;
  double myDouble = 3.14159265;
  bool myBool = true;
  String myString = 'Hello, Dart!';
  // User myUser = User(id: 42, name: 'Ray');

  // int postalCode = null;

  // nullable variables are initialized with 'null'
  int? age;
  double? height;
  String? message;
  print(age);
  print(height);
  print(message);
}

void handlingNullableTypes() {
  print('\n// handlingNullableTypes');
  String? name;
  // print(name.length); // compile-time error
}

void typePromotion() {
  print('\n// typePromotion');
  String? name;
  name = 'Ray';
  // the Dart analyzer knows 'name' cannot be null => type promotion from 'String?' to 'String'
  print(name.length);

  // the Dart analyzer can even do flow analysis
  bool isPositive(int? anInteger) {
    if (anInteger == null) {
      return false;
    }
    // Dart analyzer promoted 'anInteger' from 'int?' to 'int'
    return !anInteger.isNegative;
  }
}

// Null‐Aware Operators

// ??   : If-null operator
// ??=  : Null-aware assignment operator
// ?.   : Null-aware access operator
// ?.   : Null-aware method invocation operator
// ?..  : Null-aware cascade operator
// ?[]  : Null-aware index operator
// ...? : Null-aware spread operator
// !    : Null assertion/bang operator

void ifNullOperator() {
  print('\n// ifNullOperator');
  String? message;
  final String text = message ?? 'Default Message';
  print(text);
}

void nullAwareAssignmentOperator() {
  print('\n// nullAwareAssignmentOperator');
  double? fontSize;
  // fontSize = 10.0;
  fontSize ??= 20.0;
  print(fontSize);
}

void nullAwareAccess() {
  print('\n// nullAwareAccess');
  int? age;
  print(age?.isNegative); // null
  print(age?.toDouble()); // null
}

void nullAssertionOperator() {
  print('\n// nullAssertionOperator/bang operator');
  // I'm sure nullableString is not null so I tell the Dart analyzer it is not null with '!'
  // String nonNullableString = nullableString!; // type promotion from String? to String because of '!'

  // Dart analyzer's flow analysis fails for this function.
  // We might want to help the compiler with '!', but don't lie or else run-time error!
  bool? isBeautiful(String? item) {
    if (item == 'flower') {
      return true;
    } else if (item == 'garbage') {
      return false;
    }
    return null;
  }

  // bool flowerIsBeautiful = isBeautiful('whatever');         // compile-time error (Dart analyzer's flow analysis fails)
  // bool flowerIsBeautiful = isBeautiful('whatever')!;        // run-time error!!!
  // bool flowerIsBeautiful = isBeautiful('whatever') as bool; // run-time error!!!
  // bool flowerIsBeautiful = isBeautiful('whatever') ?? true; // ok

  // bool flowerIsBeautiful = isBeautiful('garbage');          // compile-time error (Dart analyzer's flow analysis fails)
  // bool flowerIsBeautiful = isBeautiful('garbage')!;         // ok
  // bool flowerIsBeautiful = isBeautiful('garbage') as bool;  // ok
  // bool flowerIsBeautiful = isBeautiful('garbage') ?? true;  // ok

  // bool flowerIsBeautiful = isBeautiful('flower');           // compile-time error (Dart analyzer's flow analysis fails)
  // bool flowerIsBeautiful = isBeautiful('flower')!;          // ok
  // bool flowerIsBeautiful = isBeautiful('flower') as bool;   // ok

  bool flowerIsBeautiful = isBeautiful('flower') ?? true; // ok
  print(flowerIsBeautiful);
}

class User {
  String? name;
  int? id;
}

void nullAwareCascadeOperator() {
  print('\n// nullAwareCascadeOperator');
  User user = User()
    ..name = 'Ray'
    ..id = 42;
  print(user);
  print(user.name);
  print(user.id);
  String? lengthString = user.name?.length.toString();
  print(lengthString);

  // user1 is null
  User? user1;
  // values won't be set!!!
  user1
    ?..name = 'Ray' // '?' only once at the beginning of the chain
    ..id = 42;
  // chaining null-aware access operator
  String? lengthString1 = user1?.name?.length.toString();
  print(user1); // null
  print(lengthString1); // null
}

void nullableInstanceVariables() {
  print('\n// nullableInstanceVariables');

  bool isLong(String? text) {
    if (text == null) {
      return false;
    }
    return text.length > 100;
  }
}

// class User {
//   User({this.name});
//   String? name;
// }

// No Promotion for Non‐Local Variables
// You can e.g. use the bang operator ...
// class TextWidget {
//   String? text;
//   bool isLong() {
//     if (text == null) {
//       return false;
//     }
//     return text.length > 100; // error
//     // return text!.length > 100;
//   }
// }

// ... or simply use shadowing:
class TextWidget {
  String? text;
  bool isLong() {
    final text = this.text; // shadowing (now you have a local variable)
    if (text == null) {
      return false;
    }
    return text.length > 100;
  }
}

// 'late' means lazy evaluation; only evaluated when needed
void lateKeyword() {
  print('\n// lateKeyword');
  var sc = SomeClass();
  print(sc.value);
}

// class User {
//   User(this.name);

//   final String name;
//   late final int _secretNumber = _calculateSecret(); //  Dart doesn’t allow access to instance methods during initialization => use 'late'

//   int _calculateSecret() {
//     return name.length + 42;
//   }
// }

// class User {
//   User(this.name) {
//     _secretNumber = _calculateSecret(); // works only because of 'late' for '_secretNumber'
//   }
//   late final int _secretNumber;
//   final String name;

//   int _calculateSecret() {
//     return name.length + 42;
//   }
// }

// class User {
//   late String name; // you promise Dart to initialize 'name' before it's being used!!!
// }

class SomeClass {
  // doHeavyCalculation will only run if needed
  late String? value = doHeavyCalculation();

  // ignore: body_might_complete_normally_nullable
  String? doHeavyCalculation() {
    //
    print("doing heavy calculation");
    sleep(Duration(seconds: 2));
    return "Done!";
  }
}
