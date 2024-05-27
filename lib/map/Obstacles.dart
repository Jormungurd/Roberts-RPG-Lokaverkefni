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
  String? lock;
  //movable obstacle
  bool? isBlocking;
  bool? isBroken;
  bool? isBreakable;
  //keypad obstacle
  String? code;
  //required
  String? name;
  List<int> tunnelBlocked;
}



void createObstacles(List<Obstacle> obstacles){
  //code doors
  Obstacle ygrothDoor = Obstacle(name: 'six letter combination lock', tunnelBlocked: [4,1], code: 'Ygroth');
  Obstacle azhoxDoor = Obstacle(name: 'five letter combination lock', tunnelBlocked: [6,9], code: 'Azhox');
  Obstacle hozqDoor = Obstacle(name: 'four letter combination lock', tunnelBlocked: [9,4], code: 'Hozq');
  //movable
  Obstacle painting = Obstacle(name: 'painting', tunnelBlocked: [2,7], isBlocking: true);
  Obstacle statue = Obstacle(name: 'statue', tunnelBlocked: [3,10], isBlocking: true);
  Obstacle boulder = Obstacle(name: 'boulder', tunnelBlocked: [12,3], isBlocking: true);
  //movable and breakable
  Obstacle loseStoneWall = Obstacle(name: 'lose stone wall', tunnelBlocked:
  [3,4], isBlocking: true, isBreakable: true, isBroken: false);
  Obstacle rottingCrates = Obstacle(name: 'rotting crates', tunnelBlocked:
  [11,10], isBlocking: true, isBreakable: true, isBroken: false);
  //key doors
  Obstacle ornatePadlock = Obstacle(name: 'ornate padlock', tunnelBlocked: [8,9], lock: 'ornate');
  Obstacle rustyPadlock = Obstacle(name: 'rusty padlock', tunnelBlocked: [13,6], lock: 'rusty');
  Obstacle ironPadlock = Obstacle(name: 'iron padlock', tunnelBlocked: [1,6], lock: 'iron');
  Obstacle bronzePadlockOne = Obstacle(name: 'bronze padlock', tunnelBlocked: [7,4], lock: 'bronze');
  Obstacle bronzePadlockTwo = Obstacle(name: 'bronze padlock', tunnelBlocked: [5,6], lock: 'bronze');
  Obstacle bronzePadlockThree = Obstacle(name: 'bronze padlock', tunnelBlocked: [13,8], lock: 'bronze');
  obstacles.addAll([
    ygrothDoor,
    azhoxDoor,
    hozqDoor,
    painting,
    statue,
    boulder,
    loseStoneWall,
    rottingCrates,
    ornatePadlock,
    rustyPadlock,
    ironPadlock,
    bronzePadlockOne,
    bronzePadlockTwo,
    bronzePadlockThree
  ]);
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
          if(room.barriers.isNotEmpty){
            if (room.barriers.first == barrier){

              if(barrier.isBlocking != null){
                print('an obstacle requiring an action is in the way');
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
                      print('${barrier.name} has been broken');
                      break;
                    }
                  } else if (choice == "no"){
                    break;
                  }
                }while (choice != "no");
              }
              if(barrier.lock != null){
                print('an obstacle requiring a key is in the way');
                String? choice;
                do {
                  print("do you want to interact with ${barrier.name}");
                  choice = stdin.readLineSync();
                  if (choice == "yes") {
                    for(Item item in inventory){
                      if (item.key == barrier.lock){
                        item.count--;
                        if (item.count == 0){
                          inventory.remove(item);
                          print('$item discarded');
                        }
                        tunnels.add(barrier.tunnelBlocked);
                        room.barriers.remove(barrier);
                      }

                    }
                    if (room.barriers.isNotEmpty){
                      print('you do not have the necessary key');
                    }
                    break;
                  } else if (choice == "no"){
                    break;
                  }
                }while (choice != "no");
              }
              if(barrier.code != null){
                print('an obstacle requiring a code is in the way');
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
}
