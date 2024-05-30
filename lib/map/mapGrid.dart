import 'package:untitled/inventory/items.dart';
import 'package:untitled/map/Obstacles.dart';

class Room {
  Room ({
    required this.position,
    required this.roomDescription,
    required this.items,
    required this.barriers
  });

  List<int> position;
  List<String> roomDescription;
  List<Item> items;
  List<Obstacle> barriers;
}

void createRooms (
    List<Room> rooms,
    List<Item> items,
    List<Obstacle> obstacles,
    List<List<String>> roomTextList
    ){
  //rooms for the creation of the map-grid [x-coordinate, y-coordinate]
  Room start = Room(position: [1, 1], roomDescription: roomTextList.elementAt(0),
      items: [], barriers: []);
  Room corridorOne = Room(position: [3, 1], roomDescription: roomTextList.elementAt(1),
      items: [], barriers: [obstacles.elementAt(0)]);
  Room occultRoom = Room(position: [5, 1], roomDescription: roomTextList.elementAt(2),
      items: [items.elementAt(6)], barriers: []);
  Room cobblestoneRoom = Room(position: [3, 3], roomDescription: roomTextList.elementAt(3),
      items: [], barriers: [obstacles.elementAt(6)]);
  Room corridorTwo = Room(position: [3, 5], roomDescription: roomTextList.elementAt(4),
      items: [], barriers: []);
  Room corridorThree = Room(position: [5, 5], roomDescription: roomTextList.elementAt(5),
      items: [], barriers: [obstacles.elementAt(12)]);
  Room corridorFour = Room(position: [7, 5], roomDescription: roomTextList.elementAt(6),
      items: [], barriers: [obstacles.elementAt(11)]);
  Room armory = Room(position: [7, 7], roomDescription: roomTextList.elementAt(7),
      items: [items.elementAt(5)], barriers: []);
  Room closet = Room(position: [7, 3], roomDescription: roomTextList.elementAt(8),
      items: [items.elementAt(0)], barriers: []);
  Room corridorFive = Room(position: [5, 7], roomDescription: roomTextList.elementAt(9),
      items: [], barriers: []);
  Room openSpace = Room(position: [5, 9], roomDescription: roomTextList.elementAt(10),
      items: [], barriers: [obstacles.elementAt(1)]);
  Room statueRoom = Room(position: [3, 9], roomDescription: roomTextList.elementAt(11),
      items: [], barriers: [obstacles.elementAt(4)]);
  Room pedestalRoom = Room(position: [1, 9], roomDescription: roomTextList.elementAt(12),
      items: [items.elementAt(1)], barriers: []);
  Room artGallery = Room(position: [3, 7], roomDescription: roomTextList.elementAt(13),
      items: [], barriers: [obstacles.elementAt(3)]);
  Room fortifiedRoom = Room(position: [1, 7], roomDescription: roomTextList.elementAt(14),
      items: [], barriers: [obstacles.elementAt(10)]);
  Room bloodyRoom = Room(position: [1, 5], roomDescription: roomTextList.elementAt(15),
      items: [items.elementAt(2)], barriers: []);
  Room hiddenStudy = Room(position: [3, 11], roomDescription: roomTextList.elementAt(16),
      items: [], barriers: []);
  Room library = Room(position: [1, 11], roomDescription: roomTextList.elementAt(17),
      items: [items.elementAt(4)], barriers: []);
  Room grandHall = Room(position: [7, 9], roomDescription: roomTextList.elementAt(18),
      items: [], barriers: [obstacles.elementAt(8)]);
  Room tapestryRoom = Room(position: [7, 11], roomDescription: roomTextList.elementAt(19),
      items: [], barriers: []);
  Room eventRoom = Room(position: [9, 9], roomDescription: roomTextList.elementAt(20),
      items: [], barriers: []);
  Room corridorSix = Room(position: [11, 9], roomDescription: roomTextList.elementAt(21),
      items: [], barriers: [obstacles.elementAt(7)]);
  Room runDownRoom = Room(position: [11, 11], roomDescription: roomTextList.elementAt(22),
      items: [], barriers: []);
  Room naturalSpringRoom = Room(position: [9, 11], roomDescription: roomTextList.elementAt(23),
      items: [items.elementAt(3)], barriers: []);
  Room corridorSeven = Room(position: [11, 7], roomDescription: roomTextList.elementAt(24),
      items: [], barriers: []);
  Room corridorEight = Room(position: [13, 7], roomDescription: roomTextList.elementAt(25),
      items: [], barriers: [obstacles.elementAt(13), obstacles.elementAt(9)]);
  Room mortuary = Room(position: [13, 9], roomDescription: roomTextList.elementAt(26),
      items: [], barriers: []);
  Room corridorNine = Room(position: [13, 5], roomDescription: roomTextList.elementAt(27),
      items: [], barriers: []);
  Room fortificationsRoom = Room(position: [11, 5], roomDescription: roomTextList.elementAt(28),
      items: [], barriers: []);
  Room corridorTen = Room(position: [11, 3], roomDescription: roomTextList.elementAt(29),
      items: [], barriers: [obstacles.elementAt(5)]);
  Room oldChurch = Room(position: [13, 3], roomDescription: roomTextList.elementAt(30),
      items: [], barriers: []);
  Room prayerRoom = Room(position: [13, 1], roomDescription: roomTextList.elementAt(31),
      items: [], barriers: []);
  Room corridorEleven = Room(position: [9, 3], roomDescription: roomTextList.elementAt(32),
      items: [], barriers: [obstacles.elementAt(2)]);
  Room corpseRoom = Room(position: [9, 1], roomDescription: roomTextList.elementAt(33),
      items: [], barriers: []);
  Room brightRoom = Room(position: [9, 5], roomDescription: roomTextList.elementAt(34),
      items: [], barriers: []);
  Room end = Room(position: [9, 7], roomDescription: [''],
      items: [], barriers: []);

  rooms.addAll([
    start,
    corridorOne,
    occultRoom,
    cobblestoneRoom,
    corridorTwo,
    corridorThree,
    corridorFour,
    armory,
    closet,
    corridorFive,
    openSpace,
    statueRoom,
    pedestalRoom,
    artGallery,
    fortifiedRoom,
    bloodyRoom,
    hiddenStudy,
    library,
    grandHall,
    tapestryRoom,
    eventRoom,
    corridorSix,
    runDownRoom,
    naturalSpringRoom,
    corridorSeven,
    corridorEight,
    mortuary,
    corridorNine,
    fortificationsRoom,
    corridorTen,
    oldChurch,
    prayerRoom,
    corridorEleven,
    corpseRoom,
    brightRoom,
    end
  ]);
}

void createTunnels(List<List<int>> tunnels){
  List<List<int>> createTunnels = [
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

  tunnels.addAll(createTunnels);
}

void map(List<Room> rooms, List<int> currentPosition, List<Item> items){
  rooms;
  currentPosition;

  bool existingRoom = false;

  for(Room room in rooms){
    if(currentPosition.toString() == room.position.toString()){
      // if text not work look here
      for(String text in room.roomDescription){
        print(text);
      }
      if (room.items.isNotEmpty){
        print('');
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





