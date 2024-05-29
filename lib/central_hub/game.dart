import 'dart:io';
import 'package:untitled/events/trapEvent.dart';
import 'package:untitled/inventory/items.dart';
import 'package:untitled/map/Obstacles.dart';
import 'package:untitled/map/mapGrid.dart';
import 'package:untitled/movement/movement.dart';
import 'package:untitled/inventory/inventory.dart';
import 'package:untitled/text/endText.dart';
import 'package:untitled/text/introText.dart';
import 'package:untitled/text/roomText.dart';

void game() {
  // item creation
  List<Item> items = [];
  createItems(items);

  //obstacles creation
  List<Obstacle> obstacles = [];
  createObstacles(obstacles);

  //text creation for rooms
  List<List<String>> roomTextList = [];
  roomText(roomTextList);

  //map creation
  List<Room> rooms = [];
  createRooms(rooms, items, obstacles, roomTextList);

  //tunnels to connect the rooms
  List<List<int>> tunnels = [];
  createTunnels(tunnels);

  //beginning position
  List<int> currentPosition = [1, 1];

  //inventory creation
  List<Item> inventory = [];
  beginningInventory(inventory);

  //player input
  String? input;

  //intro text
  introText();

  bool firstTime = true;

  do{
    bool menu = false;
    bool isAlive = true;
    //win event
    if(currentPosition.first == 9 && currentPosition.last == 7){
      endText();
      print('');
      print('congratulations on winning the game');
      do{
        print('do you want to "restart" the game or go to the "menu"?');
        input = stdin.readLineSync();
        if(input == 'restart'){
          items = [];
          createItems(items);
          obstacles = [];
          createObstacles(obstacles);
          roomTextList = [];
          roomText(roomTextList);
          rooms = [];
          createRooms(rooms, items, obstacles, roomTextList);
          tunnels = [];
          createTunnels(tunnels);
          currentPosition = [1, 1];
          inventory = [];
          beginningInventory(inventory);
          firstTime = true;
          break;
        }else if(input == 'menu'){
          menu = true;
          break;
        }else{
          print('invalid command');
        }
      }while(input != 'restart');
    }

    if (menu == false){
      //trap event
      if(currentPosition.first == 9 && currentPosition.last == 9 && firstTime == true){
        isAlive = trapEvent(firstTime, inventory);
      }

      if(isAlive == true){
        if (input != 'inventory'){
          if(input != "help"){
            //gives description of the room
            map(rooms, currentPosition, items);
            print('');
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
      }else{
        //happens if you during the trap event
        print('');
        print('You did not make it out of the dungeon');
        do{
          print('do you want to "restart" the game or go to the "menu"?');
          input = stdin.readLineSync();
          if(input == 'restart'){
            items = [];
            createItems(items);
            obstacles = [];
            createObstacles(obstacles);
            roomTextList = [];
            roomText(roomTextList);
            rooms = [];
            createRooms(rooms, items, obstacles, roomTextList);
            tunnels = [];
            createTunnels(tunnels);
            currentPosition = [1, 1];
            inventory = [];
            beginningInventory(inventory);
            firstTime = true;
            break;
          }else if(input == 'menu'){
            menu = true;
            break;
          }else{
            print('invalid command');
          }
        }while(input != 'restart');
      }
    }

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
        roomTextList = [];
        roomText(roomTextList);
        rooms = [];
        createRooms(rooms, items, obstacles, roomTextList);
        tunnels = [];
        createTunnels(tunnels);
        currentPosition = [1, 1];
        inventory = [];
        beginningInventory(inventory);
        firstTime = true;
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
    }else if(menu == true){
      break;
    }else{
      print('command is either now allowed or not understood');
    }
  } while (input != "quit");

}
