import 'package:final_project/user.dart';

void main() {
  defaultConstructor();
  longFormGenerativeConstructor();
  shortFormGenerativeConstructor();
  namedConstructors();
  forwardingConstructors();
  optionalAndNamedParameters();
  initializerLists();
  makingClassesImmutable();
}

void defaultConstructor() {
  // Dart provides a default constructor - Address() in this case - that
  // takes no parameters and just returns an instance of the class.

  // class Address {
  //   var value = '';
  // }
}

void longFormGenerativeConstructor() {
  // class User {
  //   User(int id, String name) {                     // generative constructor - constructor name same as class name
  //     this.id = id;
  //     this.name = name;
  //   }

  //   int id = 0;
  //   String name = '';

  //   // ...
  // }

  // final user = User(42, 'Ray');
  // print(user);
}

void shortFormGenerativeConstructor() {
  // class User {
  //   User(this.id, this.name);
  //   int id = 0;
  //   String name = '';
  //   // ...
  // }
}

void namedConstructors() {
  // User.anonymous() {                               // named constructor - add identifier to class name
  //   id = 0;
  //   name = 'anonymous';
  // }
  const anonymousUser = User.anonymous();
  print(anonymousUser);
}

void forwardingConstructors() {
  // User.anonymous() : this(0, 'anonymous');         // forwarding or redirecting constructor
  final anonymousUser = User.anonymous();
  print(anonymousUser);
}

void optionalAndNamedParameters() {
  // MyClass([this.myProperty]);
  // MyClass({this.myProperty});
  // MyClass({required this.myProperty});

  // final user = User(42, 'Ray');
  // User({this.id = 0, this.name = 'anonymous'});
  final user = User(id: 42, name: 'Ray');
  print(user);
}

void initializerLists() {
// User({int id = 0, String name = 'anonymous'})      // named parameters can't start with an underscore
//     : _id = id,                                    // initializer List
//       _name = name;                                // _<varName> => private

  final vicki = User(id: 24, name: 'Vicki');
  // vicki._name = 'Nefarious Hacker';

  print(vicki);
}

void makingClassesImmutable() {
  const user = User(id: 42, name: 'Ray');
  const anonymousUser = User.anonymous();
  print(user);
  print(anonymousUser);
}
