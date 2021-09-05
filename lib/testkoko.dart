import 'dart:io';
import 'dart:math';
void main() {
  const MAX_RANDOM =  10;
  var r = new Random();
  var answer = r.nextInt(MAX_RANDOM)+1;
  var guess;
  var round = 0;
  List<int> myList = [];
  do {
    var input = r.nextInt(MAX_RANDOM)+1;
    bool check = false;
    for(var item in myList) {
      if(input==item) {
        check = true;
        break;
      }
    }
    if(check)
      continue;
    myList.add(input);
    round++;
    guess = input;
    if (answer == guess)
      print('Round : $round => Random : $input CORRECT!');
    else if (answer > guess)
      print("Round : $round => Random : $input MORE THAN RANDOM ");
    else
      print("Round : $round => Random : $input LESS THAN RANDOM ");
  }while(guess!=answer);
  print('----- THE END -----');
}