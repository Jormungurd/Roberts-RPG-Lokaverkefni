import 'dart:io';


void main(){
int numbers = 5;

  for (int i = 0; i < 5; i++){
    numbers++;
  }

  String? text = stdin.readLineSync();

  print('testing');
  print(numbers);
  print(text);
}

