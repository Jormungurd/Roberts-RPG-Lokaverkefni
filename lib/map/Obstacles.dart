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

                  if (barrier.isBreakable == true){
                    print('push or break?');
                    choice = stdin.readLineSync();
                  } else {
                    choice = 'push';
                  }

                  if(choice == 'push'){
                    if(barrier.isBlocking == true){
                      barrier.isBlocking = false;
                      tunnels.add(barrier.tunnelBlocked);
                    }else {
                      barrier.isBlocking = true;
                      tunnels.remove(barrier.tunnelBlocked);
                    }
                  }
                  if(choice == 'break' && barrier.isBreakable == true){
                    barrier.isBlocking = false;
                    barrier.isBroken = true;
                    tunnels.add(barrier.tunnelBlocked);
                    room.barriers.remove(barrier);
                    break;
                  }
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
                  for(Item item in inventory){
                    if (item.key.toString() == barrier.lock.toString()){
                      item.count--;
                      if (item.count == 0){
                        inventory.remove(item);
                      }
                      tunnels.add(barrier.tunnelBlocked);
                      room.barriers.remove(barrier);
                    }
                  }
                  if (room.barriers.isNotEmpty){
                    print('you do not have the necessary item');
                  }
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
                    room.barriers.remove(barrier);
                    break;
                  } else {
                    print('wrong code');
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
