import 'dart:io';
import 'package:untitled/inventory/items.dart';
import 'package:untitled/map/Obstacles.dart';
import 'package:untitled/map/mapGrid.dart';
import 'package:untitled/movement/movement.dart';
import 'package:untitled/inventory/inventory.dart';

void game() {
  // item creation
  List<Item> items = [];
  createItems(items);

  //obstacles creation
  List<Obstacle> obstacles = [];
  createObstacles(obstacles);

  //map creation
  List<Room> rooms = [];
  createRooms(rooms, items, obstacles);

  //tunnels to connect the rooms
  List<List<int>> tunnels = [
    [2,1],
    [3,2],
    [4,5],
    [6,5],
    [7,6],
    [5,8],
    [4,9],
    [2,9],
    [3,8],
    [2,11],
    [7,10],
    [10,9],
    [10,11],
    [11,8],
    [12,7],
    [12,5],
    [11,4],
    [13,2],
    [10,3],
    [9,2],
    [9,6],
  ];

  //beginning position
  List<int> currentPosition = [1, 1];

  //inventory creation
  List<Item> inventory = [];
  beginningInventory(inventory);

  //player input
  String? input;

  do{
    //insert "trap" event here
    //insert "win" event here

    if (input != 'inventory'){
      if(input != "help"){
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
    }else if(input == 'help'){
      print('north, east, south, west');
      print('inventory');
      print('pick up item');
      print('reset');
      print('quit');
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
