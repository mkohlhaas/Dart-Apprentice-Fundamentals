// ignore_for_file: unused_local_variable, unused_field, unused_element, dead_code

// Dart 2.12 introduced "sound null safety" to the language.
// Sound null safety distinguishes nullable and non-nullable types.
// 'late' and '!' opt out of sound null safety, so use them carefully.

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
  // int postalCode = -1;
  // int postalCode = null;
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

// Handling nullable types

void handlingNullableTypes() {
  print('\n// handlingNullableTypes');
  String? name;
  // print(name.length); // compile-time error
}

void typePromotion() {
  print('\n// typePromotion');
  String? name;
  name =
      'Ray'; // the Dart analyzer knows name cannot be null => type promotion from 'String?' to 'String'
  print(name.length);

  // the Dart analyzer can even do flow analysis
  bool isPositive(int? anInteger) {
    if (anInteger == null) {
      return false;
    }
    return !anInteger
        .isNegative; // Dart analyzer promoted anInteger from 'int?' to 'int'
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
  final String text = message ?? 'Error';
  print(text);

  // the same:
  // String text;
  // if (message == null) {
  //   text = 'Error';
  // } else {
  //   text = message;
  // }
  // print(text);
}

void nullAwareAssignmentOperator() {
  print('\n// nullAwareAssignmentOperator');
  double? fontSize;
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
  //String nonNullableString = nullableString!; // type promotion from String? to String because of '!'

  // Dart analyzer's flow analysis fails for this function
  bool? isBeautiful(String? item) {
    if (item == 'flower') {
      return true;
    } else if (item == 'garbage') {
      return false;
    }
    return null;
  }

  // bool flowerIsBeautiful = isBeautiful('whatever');         // compile-time error (Dart analyzer's flow analysis fails)
  // bool flowerIsBeautiful = isBeautiful('whatever')!;        // run-time error
  // bool flowerIsBeautiful = isBeautiful('whatever') as bool; // run-time error
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

  User? user1;
  user1
    ?..name = 'Ray' // only once at the beginning of the chain
    ..id = 42;
  String? lengthString = user1?.name?.length.toString(); // chaining null-aware access operator
}

void initializingNonNullableClassFields() {
  print('\n// initializingNonNullableClassFields');
  // final user = User(name: null);
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

// 'late' means lazy evaluation; it's only evaluated when needed
void lateKeyword() {
  print('\n// lateKeyword');
  final user = User();
  print(user.name);
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
//   late String name; // you promise Dart to initialize 'name' before it's being used!
// }

class SomeClass {
  late String? value = doHeavyCalculation(); // doHeavyCalculation will only run if needed

  // ignore: body_might_complete_normally_nullable
  String? doHeavyCalculation() {
    // do heavy calculation
  }
}
