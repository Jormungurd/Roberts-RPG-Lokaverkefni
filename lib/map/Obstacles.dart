import 'dart:io';

import 'package:untitled/inventory/items.dart';
import 'package:untitled/map/mapGrid.dart';

class Obstacle{
  Obstacle ({
    required this.name,
    required this.tunnelBlocked,
    this.code,
    this.isBlocking,
    this.isBreakable,
    this.isBroken,
    this.lock
  });

  //item obstacle
  Item? lock;
  //movable obstacle
  bool? isBlocking;
  bool? isBroken;
  bool? isBreakable;
  //keypad obstacle
  int? code;
  //required
  String? name;
  List<int> tunnelBlocked;
}



void createObstacles(List<Object> obstacles){
  Obstacle roomFiveDoor = Obstacle(name: 'metal door', tunnelBlocked: [4,1], code: 1111);

  obstacles.add(roomFiveDoor);
}

void interactWithObstacles(
    List<Room> rooms,
    List<int> currentPosition,
    List<Obstacle> obstacles,
    List<Item> inventory,
    List<List<int>> tunnels
    ){

  for(Room room in rooms){
    if(currentPosition.toString() == room.position.toString()){
      if (room.barriers.isNotEmpty){
        for (Obstacle barrier in obstacles){
          if (room.barriers.first == barrier){
            if(barrier.isBlocking != null){
              print('action required');
              String? choice;
              do {
                print("do you want to interact with ${barrier.name}");
                choice = stdin.readLineSync();
                if (choice == "yes") {
                  //insert a do while loop or if statement here

                } else if (choice == "no"){
                  break;
                }
              }while (choice != "no");
            }
            if(barrier.lock != null){
              print('key required');
              String? choice;
              do {
                print("do you want to interact with ${barrier.name}");
                choice = stdin.readLineSync();
                if (choice == "yes") {
                  //insert if statement here
                  break;
                } else if (choice == "no"){
                  break;
                }
              }while (choice != "no");
            }
            if(barrier.code != null){
              print('code required');
              String? choice;
              do {
                print("do you want to interact with ${barrier.name}");
                choice = stdin.readLineSync();
                if (choice == "yes") {
                  print('input code');
                  choice  =stdin.readLineSync();
                  if (choice == barrier.code.toString()){
                    print('correct code');
                    tunnels.add(barrier.tunnelBlocked);
                    room.barriers.removeLast();
                    break;
                  } else {
                    print('wrong code, try again?');
                  }
                } else if (choice == "no"){
                  break;
                }
              }while (choice != "no");
            }
          }
        }
      }
    }
  }
}