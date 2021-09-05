import 'dart:io';
import 'dart:math';
import 'dart:convert';

void main() {
  Random r = new Random();
  const max_random = 10;
  int a = r.nextInt(max_random);
  int i = 0;

  while (true) {
    stdout.write('Guess the number between 1 and $max_random : ');
    String? input = stdin.readLineSync();
    if (input == null) {
      return;
    }
    int? guess = int.tryParse(input);
    if (guess == null) {
      continue;
    }
    if (a == guess) {
      i++;
      print("$guess is CORRECT ❤ tottal guesses : $i");
      break;
    } else {
      if (a < guess) {
        print("$guess is TOO HIGH");
        i++;
      } else {
        print("$guess is TOO LOW");
        i++;
      }
    }
  }
}
