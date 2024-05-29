import 'dart:io';

import 'package:untitled/inventory/inventory.dart';
import 'package:untitled/inventory/items.dart';
import 'package:untitled/text/trapText.dart';

bool trapEvent(bool firstTime, List<Item> inventory){
  firstTime = false;
  bool broom = false;
  bool orb = false;
  bool paper = false;
  bool isAlive = true;

  String? choice;
  for (Item item in inventory){
    if(item.name == 'black parchment'){
      paper = true;
    }
    if(item.name == 'mysterious orb'){
      orb = true;
    }
    if(item.name == 'broom'){
      broom = true;
    }
  }

  trapTextIntro();
  do{
    choice = stdin.readLineSync();

    if(choice == 'inventory'){
      showInventory(inventory);
    }else if(choice == 'use broom' && broom == true){
      trapTextConclusion(1);
      isAlive = false;
      break;
    }else if(choice == 'use mysterious orb' && orb == true){
      trapTextConclusion(2);
      isAlive = false;
      break;
    }else if(choice == 'use bronze keyring'){
      trapTextConclusion(3);
      isAlive = false;
      break;
    }else if(choice == 'use matches'){
      trapTextConclusion(4);
      isAlive = false;
      break;
    }else if(choice == 'use trowel'){
      trapTextConclusion(5);
      isAlive = false;
      break;
    }else if(choice == 'use sickle'){
      trapTextConclusion(6);
      isAlive = false;
      break;
    }else if(choice == 'use black parchment' && paper == true){
      trapTextConclusion(7);
      break;
    }else if(choice == 'give up'){
      print('The darkness takes you');
      print('');
      print('Game over. The darkness has taken you home.');
      isAlive = false;
      break;
    }else{
      print('Invalid input');
    }

  }while(choice != 'quit');


  return isAlive;
}
