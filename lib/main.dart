import 'dart:io';
import 'package:untitled/central_hub/game.dart';
import 'package:untitled/text/menuText.dart';

void main() {
  String? menuChoice;

  menuIntroText();

  do {
    print('Choose weather you want "controls", "play game" or "quit"');
    menuChoice = stdin.readLineSync();

    if (menuChoice == "controls") {
      menuControlsText();
    } else if (menuChoice == "play game") {
      game();
    } else if (menuChoice == "quit"){
      break;
    }
  }while (menuChoice != "quit");
}
