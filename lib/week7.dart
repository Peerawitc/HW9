// void main(){
// List list = [1,2,3,4,5];
//
// List list2 =  list.map((i) {
//   return{
//     'data' : i
//   };
// }).toList();
import 'dart:math';



void main(){
  var r = new Random(100);
  int answer = r.nextInt(10)+1;
  int guess;
  int max = -1;
  print("ANwser $answer");
 while(true){
   guess = r.nextInt(100);
    if(max<guess){

    }
   if(answer==guess){
     print('correct $guess');
     break;

   }
   print(guess);

 }


}



