import 'package:untitled/inventory/items.dart';

class Room {
  Room ({
    required this.position,
    required this.roomDescription,
    required this.items,
    required this.barriers
  });

  List<int> position;
  List<String> roomDescription;
  List<Object> items;
  List<Object> barriers;
}

void createRooms (List<Room> rooms, List<Item> items){
  //rooms for the creation of the map-grid [x-coordinate, y-coordinate]
  Room one = Room(position: [1, 1], roomDescription: ['one'], items: [], barriers: []);
  Room two = Room(position: [3, 1], roomDescription: ['two'], items: [], barriers: []);
  Room three = Room(position: [5, 1], roomDescription: ['three'], items: [items.elementAt(0)], barriers: []);
  Room four = Room(position: [1, 3], roomDescription: ['four'], items: [], barriers: []);
  Room five = Room(position: [3, 3], roomDescription: ['five'], items: [], barriers: []);

  rooms.addAll([one, two, three, four, five]);
}

void map(List<Room> rooms, List<int> currentPosition, List<Item> items){
  rooms;
  currentPosition;

  bool existingRoom = false;

  //testing map (r = room, - = tunnels)
  // r-r
  // -
  // r-r-r

  for(Room room in rooms){
    if(currentPosition.toString() == room.position.toString()){
      print(room.roomDescription.elementAt(0));
      if (room.items.isNotEmpty){
        for(Item item in items){
          if (item == room.items.first){
            item.getNameRoom();
          }
        }
      }
      existingRoom = true;
    }
  }
  if(existingRoom == false){
    print('where are you');
  }
}





