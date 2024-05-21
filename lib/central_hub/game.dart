import 'dart:io';
import 'package:untitled/inventory/items.dart';
import 'package:untitled/map/Obstacles.dart';
import 'package:untitled/map/mapGrid.dart';
import 'package:untitled/movement/movement.dart';
import 'package:untitled/inventory/inventory.dart';

void game() {
  List<Item> items = [];
  createItems(items);

  List<Obstacle> obstacles = [];
  createObstacles(obstacles);

  List<Room> rooms = [];
  createRooms(rooms, items, obstacles);

  //tunnels to connect the rooms
  List<List<int>> tunnels = [
    [2,1],[1,2],[2,3]
  ];

  //beginning position
  List<int> currentPosition = [1, 1];

  //inventory
  List<Item> inventory = [];
  beginningInventory(inventory);

  //player input
  String? input;

  do{
    //insert "trap" event here
    //insert "win" event here

    if (input != 'inventory'){
      //gives description of the room
      map(rooms, currentPosition, items);
      interactWithObstacles(rooms, currentPosition, obstacles, inventory, tunnels);
      //gives movement options
      for (String legalMovement in movementText(
        isMovementLegal(
          tunnels, possibleMovement(
            currentPosition),
        ),
      )
      ){
        print(legalMovement);
      }
    }

    //player input
    input = stdin.readLineSync();

    //outcome of input
    if(input == 'north' && isMovementLegal(tunnels,
        possibleMovement(currentPosition)).elementAt(0)
    ){
      currentPosition = [currentPosition.first, currentPosition.last+2];
    } else if(input == 'east' && isMovementLegal(tunnels,
        possibleMovement(currentPosition)).elementAt(1)
    ){
      currentPosition = [currentPosition.first+2, currentPosition.last];
    }else if(input == 'south' && isMovementLegal(tunnels,
        possibleMovement(currentPosition)).elementAt(2)
    ){
      currentPosition = [currentPosition.first, currentPosition.last-2];
    }else if(input == 'west' && isMovementLegal(tunnels,
        possibleMovement(currentPosition)).elementAt(3)
    ){
      currentPosition = [currentPosition.first-2, currentPosition.last];
    }else if (input == 'inventory'){
      showInventory(inventory);
    }else if (input == 'pick up item'){
      pickUpItems(rooms, items, inventory, currentPosition);
    }else if (input == 'reset'){
      print('are you sure?');
      input = stdin.readLineSync();
      if(input == 'yes'){
        items = [];
        createItems(items);
        obstacles = [];
        createObstacles(obstacles);
        rooms = [];
        createRooms(rooms, items, obstacles);
        tunnels = [[2,1],[1,2],[2,3]];
        currentPosition = [1, 1];
        inventory = [];
        beginningInventory(inventory);
      }
    }else if (input == 'quit'){
      print('are you sure?');
      input = stdin.readLineSync();
      if(input == 'yes') {
        break;
      }
    }else{
      print('command is either now allowed or not understood');
    }
  } while (input != "quit");

}
