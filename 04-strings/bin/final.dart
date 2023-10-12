// ignore_for_file: unused_local_variable

import 'package:characters/characters.dart';

void main() {
  // Strings and characters
  print('// Strings and characters');

  print('Hello, Dart!');
  var greeting = 'Hello, Dart!';
  greeting = 'Hello, Flutter!';
  print(greeting);

  // Getting characters
  print('\n// Getting characters');

  const letter = 'a'; // this is a String
  var salutation = 'Hello!';
  print(salutation.codeUnits);

  const dart = '🎯';
  print(dart.codeUnits);
  print(dart.runes);

  // Unicode grapheme clusters
  print('\n// Unicode grapheme clusters');

  const flag = '🇲🇳';
  print(flag.runes);

  const family = '👨‍👩‍👧‍👦';
  print(family.runes);

  print(family.length);
  print(family.codeUnits.length);
  print(family.runes.length);
  print(family.characters.length);

  // Single-quotes vs double-quotes
  print('\n// Single-quotes vs double-quotes');

  print('I like cats');
  print("I like cats");
  print("my cat's food");
  print('my cat\'s food');

  // Concatenation
  print('\n// Concatenation');

  var message = 'Hello' + ' my name is ';
  var message1 = 'Hello' ' my name is '; // better: adjacent strings
  const name = 'Ray';
  message += name;
  print(message);

  // Interpolation
  print('\n// Interpolation');

  const introduction = 'Hello my name is $name';
  print(introduction);

  const oneThird = 1 / 3;
  // const sentence = 'One third is $oneThird.';
  final sentence = 'One third is ${oneThird.toStringAsFixed(3)}.';
  print(sentence);

  // Multi-line strings
  print('\n// Multi-line strings');

  const bigString = '''
You can have a string
that contains multiple
lines
by
doing this.''';
  print(bigString);

  // const oneLine = 'This is only '
  //   'a single '
  //   'line '
  //   'at runtime.';
  // const oneLine = 'This is only ' + 'a single ' + 'line ' + 'at runtime.';
  const oneLine =
      'This is only ' 'a single ' 'line ' 'at runtime.'; // adjacent strings
  print(oneLine);

  const twoLines = 'This is\ntwo lines.';
  print(twoLines);

  const rawString = r'My name \n is $name.';
  print(rawString);

  // Inserting characters from their codes
  print('\n// Inserting characters from their codes');

  print('I \u2764 Dart\u0021');
  print('I love \u{1F3AF}');
}
