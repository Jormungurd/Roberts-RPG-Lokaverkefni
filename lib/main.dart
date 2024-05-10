import 'dart:io';
import 'package:untitled/map/mapGrid.dart';
import 'package:untitled/movement/movement.dart';

void main() {
  //rooms for the creation of the map-grid [x-coordinate, y-coordinate]
  Room one = Room(position: [1, 1], roomDescription: ['one'], items: [], barriers: []);
  Room two = Room(position: [3, 1], roomDescription: ['two'], items: [], barriers: []);
  Room three = Room(position: [5, 1], roomDescription: ['three'], items: [], barriers: []);
  Room four = Room(position: [1, 3], roomDescription: ['four'], items: [], barriers: []);
  Room five = Room(position: [3, 3], roomDescription: ['five'], items: [], barriers: []);

  List<Room> rooms = [
    one, two, three, four, five
  ];

  //testing map (r = room, - = tunnels)
  // r-r
  // -
  // r-r-r

  //tunnels to connect the rooms
  List<List<int>> tunnels = [
    [2,1],[4,1],[1,2],[2,3]
  ];

  //beginning position
  List<int> currentPosition = [1, 1];

  //player input
  String? input;

  do{
    //gives description of the room
    map(rooms, currentPosition);
    //gives movement options
    for (String text in movementText(
      isMovementLegal(
        tunnels, possibleMovement(
          currentPosition),
        ),
      )
    ){
      print(text);
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
    }else if (input == 'quit'){
      break;
    }else{
      print('command is either now allowed or not understood');
    }
  } while (input != "quit");

}
