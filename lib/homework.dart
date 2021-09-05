import 'dart:io';
import 'dart:math';

void main() {
  print('╔═══════════════════════════════════════════════╟');
  print('║               GUESS THE NUMBER                ╟');
  print('╟───────────────────────────────────────────────╟');
  stdout.write("╟Enter max number you want to guess : ");
  var inputmax = stdin.readLineSync();
  int? max = int.tryParse(inputmax!);
  print('╟───────────────────────────────────────────────╟');

  var game = Game(maxRandom: max);
  var isCorrect = false;
  do {
    stdout.write("╟Guess the number between 1 and $max: ");

    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);

    if (guess != null) {
      Map resultMap = game.doGuess(guess);

      game.getTotalGuesses();
      isCorrect = resultMap['isCorrect'];
      var message = resultMap['text'];
      stdout.write("║➜ $guess");
      print(message);
      print('╟───────────────────────────────────────────────╟');
    }
  } while (!isCorrect);
  print('║Total guesses : ${game.getTotalGuesses()}                              ╟');
  print('║ ✨✨✨✨           THE END              ✨✨✨✨ ╟');
  print('╚═══════════════════════════════════════════════╟');
}

////////////////////////////////////////////********************************/////////////////////////////////////////////

class Game {
  late int answer;
  int count = 0;

  Game({int? maxRandom}) {
    this.answer = Random().nextInt(maxRandom!) + 1;
  }
  static const List feedbackList = [
    {
      'text': ' : TOO HIGH▲                               ╟',
      'isCorrect': false,
    },
    {
      'text': ' : TOO LOW▼                                ╟',
      'isCorrect': false,
    },
    {
      'text': ' : CORRECT!!!❤❤                           ╟',
      'isCorrect': true,
    }
  ];
  int getTotalGuesses() {
    return count;
  }

  Map doGuess(int num) {

    if (answer == num) {
      count++;
      return feedbackList[2];
    } else if (answer < num) {
      count++;
      return feedbackList[0];
    } else {
      count++;
      return feedbackList[1];
    }
  }
}

/*void _main() {
  const MAX_RANDOM = 100;

  print('╔═══════════════════════════════════════════════');
  print('║               GUESS THE NUMBER                ');
  print('╟───────────────────────────────────────────────');

  var r = Random();
  var answer = r.nextInt(MAX_RANDOM) + 1;

  var guess, isCorrect = false, totalGuesses = 0;
  do {
    stdout.write('║ Guess the number between 1 and $MAX_RANDOM: ');
    String? input = stdin.readLineSync();

    guess = int.tryParse(input!);
    if (guess != null) {
      totalGuesses++;
      if (answer == guess) {
        print('║ ➜ $guess is CORRECT ❤, total guesses: $totalGuesses');
        isCorrect = true;
      } else if (answer < guess) {
        print('║ ➜ $guess is TOO HIGH! ▲');
      } else {
        print('║➜ $guess is TOO LOW! ▼');
      }
      print('╟───────────────────────────────────────────────');
    }
  } while (!isCorrect);

  print('║                   THE END                     ');
  print('╚═══════════════════════════════════════════════');
}
*/
