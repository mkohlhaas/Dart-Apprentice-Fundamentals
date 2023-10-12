void main() {
  // While Loops
  print('// While Loops');

  // Infinite loop
  // while (true) { }

  var sum = 1;
  print('sum: $sum');
  while (sum < 10) {
    sum += 4;
    print('sum: $sum');
  }

  // Do-While Loops
  print('\n// Do-While Loops');

  sum = 1;
  print('sum: $sum');
  do {
    sum += 4;
    print('sum: $sum');
  } while (sum < 10);

  // Comparing While and Do-While Loops
  print('\n// Comparing While and Do-While Loops');

  sum = 1 + 3 - 2 * 4 + 8;
  while (sum < 10) {
    sum += 1 + 3 - 2 * 4 + 8;
  }
  print('while loop sum: $sum');

  sum = 0;
  do {
    sum += 1 + 3 - 2 * 4 + 8;
  } while (sum < 10);
  print('do-while loop sum: $sum');

  // Breaking Out of a Loop
  print('\n// Breaking Out of a Loop');

  sum = 1;
  print('sum: $sum');
  while (true) {
    sum += 4;
    print('sum: $sum');
    if (sum > 10) {
      break;
    }
  }

  // For Loops
  print('\n// For Loops');

  for (var i = 0; i < 5; i++) {
    print(i);
  }
  print('');
  for (var i = 0; i < 5; i++) {
    if (i == 2) {
      continue;
    }
    print(i);
  }

  // Defining a label
  print('\n// Defining a label');

  OuterLoop:
  for (int i = 0; i < 3; i++) {
    print("Outer loop: $i");
    for (int j = 0; j < 10; j++) {
      if (j > 3) {
        break OuterLoop;
      }
      print("Inner loop: $j");
    }
  }
}
