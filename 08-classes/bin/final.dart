void main() {
  assigningValuesAndPrinting();
  addingMethods();
  cascadeNotation();
  objectsAsReferences();
  getters();
  calculatedProperty();
  setters();
}

class User {
  int id = 0;
  String name = '';

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }
}

void assigningValuesAndPrinting() {
  print('// assigningValuesAndPrinting');
  final user = User();
  print(user);
  user.name = 'Ray';
  user.id = 42;
  print(user);
}

void addingMethods() {
  print('\n// addingMethods');
  final user = User();
  user.name = 'Ray';
  user.id = 42;

  print(user.toJson());
}

void cascadeNotation() {
  print('\n// cascadeNotation');
  final user = User()
    ..name = 'Ray'
    ..id = 42;
  print(user);
}

class MyClass {
  int myProperty = 1;
}

void objectsAsReferences() {
  print('\n// objectsAsReferences');
  final myObject = MyClass();
  final anotherObject = myObject; // no deep copy, just a reference/alias
  print(myObject.myProperty);
  anotherObject.myProperty = 2;
  print(myObject.myProperty);
}

class Password {
  String _plainText = 'pass123';
  String get plainText => _plainText;

  set plainText(String text) {
    if (text.length < 6) {
      print('Passwords must have 6 or more characters!');
      return;
    }
    _plainText = text;
  }

  String get obfuscated {
    final length = _plainText.length;
    return '*' * length;
  }
}

void getters() {
  print('\n// getters');
  final myPassword = Password();
  final text = myPassword.plainText;
  print(text);
}

void calculatedProperty() {
  print('\n// calculatedProperty');
  final myPassword = Password();
  final text = myPassword.obfuscated;
  print(text);
}

void setters() {
  print('\n// setters');
  final myPassword = Password();
  myPassword.plainText = r'Pa$$vv0Rd'; // setter
  final text = myPassword.plainText; // getter
  print(text);

  final tooShortPassword = Password();
  tooShortPassword.plainText = 'aaa';
  final result = tooShortPassword.plainText;
  print(result);

  final email = Email();
  email.value = 'ray@example.com';
  final emailString = email.value;
  print(emailString);
}

// No Need to Overuse Getters And Setters
// class Email {
//   String _value = '';
//   String get value => _value;
//   set value(String value) => _value = value;
// }

class Email {
  String value = '';
}
