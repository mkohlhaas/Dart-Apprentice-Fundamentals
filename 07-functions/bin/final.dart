void main() {
  anatomyOfDartFunction();
  usingMultipleParameters();
  makingParametersOptional();
  providingDefaultValues();
  namingParameters();
  makingNamedParametersRequired();
  avoidingSideEffects();
  optionalTypes();
  arrowFunctions();
}

void anatomyOfDartFunction() {
  print('// anatomyOfDartFunction');

  String compliment(int number) {
    return '$number is a very nice number.';
  }

  const input = 12;
  final output = compliment(input);
  print(output);
}

void usingMultipleParameters() {
  print('\n// usingMultipleParameters');

  void helloPersonAndPet(String person, String pet) {
    print('Hello, $person, and your furry friend, $pet!');
  }

  helloPersonAndPet('Fluffy', 'Chris');
}

void makingParametersOptional() {
  print('\n// makingParametersOptional');

  String fullName(String first, String last, [String? title]) {
    if (title != null) {
      return '$title $first $last';
    } else {
      return '$first $last';
    }
  }

  print(fullName('Ray', 'Wenderlich'));
  print(fullName('Albert', 'Einstein', 'Professor'));
}

void providingDefaultValues() {
  print('\n// providingDefaultValues');

  bool withinTolerance(int value, [int min = 0, int max = 10]) {
    return min <= value && value <= max;
  }

  print(withinTolerance(5));
  print(withinTolerance(15));
  print(withinTolerance(9, 7, 11));
  print(withinTolerance(9, 7));
}

// named parameters are by default optional
void namingParameters() {
  print('\n// namingParameters');

  bool withinTolerance(int value, {int min = 0, int max = 10}) {
    return min <= value && value <= max;
  }

  print(withinTolerance(9, min: 7, max: 11));
  print(withinTolerance(9, max: 11, min: 7));
  print(withinTolerance(min: 7, max: 11, 9));
  print(withinTolerance(min: 7, 9, max: 11));
  print(withinTolerance(5));
  print(withinTolerance(15));
  print(withinTolerance(5, min: 7));
  print(withinTolerance(15, max: 20));
}

// 'required' attribute is necessary to make a named parameter required
void makingNamedParametersRequired() {
  print('\n// makingNamedParametersRequired');

  bool withinTolerance({
    required int value,
    int min = 0,
    int max = 10,
  }) {
    return min <= value && value <= max;
  }

  print(withinTolerance(value: 9, min: 7, max: 11));
  // print(withinTolerance()); // Error
  print(withinTolerance(value: 9));
}

void avoidingSideEffects() {
  print('\n// avoidingSideEffects');

  // void hello() {
  //   print('Hello!');
  // }
  // hello();

  String hello() {
    return 'Hello!';
  }

  print(hello());

  var myPreciousData = 5782;

  String anInnocentLookingFunction(String name) {
    myPreciousData = -1;
    return 'Hello, $name. Heh, heh, heh.';
  }

  print(myPreciousData);
  print(anInnocentLookingFunction('Bob'));
  print(myPreciousData);
}

void optionalTypes() {
  print('\n// optionalTypes');

  // String compliment(int number) {
  //   return '$number is a very nice number.';
  // }

  // ignore: unused_element
  compliment(number) {
    return '$number is a very nice number.';
  }

  // String compliment(dynamic number) {
  //   return '$number is a very nice number.';
  // }
}

void arrowFunctions() {
  print('\n// arrowFunctions/expression body');

  // int add(int a, int b) {
  //   return a + b;
  // }

  add(int a, int b) => a + b;
  print(add(2, 3));

  // void printTripled(int number) {
  //   final tripled = number * 3;
  //   print(tripled);
  // }

  printTripled(int number) => print(number * 3);
  printTripled(4);
}
