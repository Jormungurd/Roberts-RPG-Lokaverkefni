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
    List<Obstacle> obstacles
    ){
  //rooms for the creation of the map-grid [x-coordinate, y-coordinate]
  Room start = Room(position: [1, 1], roomDescription: ['start'],
      items: [], barriers: []);
  Room corridorOne = Room(position: [3, 1], roomDescription: ['corridorOne'],
      items: [], barriers: [obstacles.elementAt(0)]);
  Room occultRoom = Room(position: [5, 1], roomDescription: ['occultRoom'],
      items: [items.elementAt(6)], barriers: []);
  Room cobblestoneRoom = Room(position: [3, 3], roomDescription: ['cobblestoneRoom'],
      items: [], barriers: [obstacles.elementAt(6)]);
  Room corridorTwo = Room(position: [3, 5], roomDescription: ['corridorTwo'],
      items: [], barriers: []);
  Room corridorThree = Room(position: [5, 5], roomDescription: ['corridorThree'],
      items: [], barriers: [obstacles.elementAt(11)]);
  Room corridorFour = Room(position: [7, 5], roomDescription: ['corridorFour'],
      items: [], barriers: [obstacles.elementAt(12)]);
  Room armory = Room(position: [7, 7], roomDescription: ['armory'],
      items: [items.elementAt(5)], barriers: []);
  Room closet = Room(position: [7, 3], roomDescription: ['closet'],
      items: [items.elementAt(0)], barriers: []);
  Room corridorFive = Room(position: [5, 7], roomDescription: ['corridorFive'],
      items: [], barriers: []);
  Room openSpace = Room(position: [5, 9], roomDescription: ['openSpace'],
      items: [], barriers: [obstacles.elementAt(1)]);
  Room statueRoom = Room(position: [3, 9], roomDescription: ['statueRoom'],
      items: [], barriers: [obstacles.elementAt(4)]);
  Room pedestalRoom = Room(position: [1, 9], roomDescription: ['pedestalRoom'],
      items: [items.elementAt(1)], barriers: []);
  Room artGallery = Room(position: [3, 7], roomDescription: ['artGallery'],
      items: [], barriers: [obstacles.elementAt(3)]);
  Room fortifiedRoom = Room(position: [1, 7], roomDescription: ['fortifiedRoom'],
      items: [], barriers: [obstacles.elementAt(10)]);
  Room bloodyRoom = Room(position: [1, 5], roomDescription: ['bloodyRoom'],
      items: [items.elementAt(2)], barriers: []);
  Room hiddenStudy = Room(position: [3, 11], roomDescription: ['hiddenStudy'],
      items: [], barriers: []);
  Room library = Room(position: [1, 11], roomDescription: ['library'],
      items: [items.elementAt(4)], barriers: []);
  Room grandHall = Room(position: [7, 9], roomDescription: ['grandHall'],
      items: [], barriers: [obstacles.elementAt(8)]);
  Room tapestryRoom = Room(position: [7, 11], roomDescription: ['tapestryRoom'],
      items: [], barriers: []);
  Room eventRoom = Room(position: [9, 9], roomDescription: ['eventRoom'],
      items: [], barriers: []);
  Room corridorSix = Room(position: [11, 9], roomDescription: ['corridorSix'],
      items: [], barriers: [obstacles.elementAt(7)]);
  Room runDownRoom = Room(position: [11, 11], roomDescription: ['runDownRoom'],
      items: [], barriers: []);
  Room naturalSpringRoom = Room(position: [9, 11], roomDescription: ['naturalSpringRoom'],
      items: [items.elementAt(3)], barriers: []);
  Room corridorSeven = Room(position: [11, 7], roomDescription: ['corridorSeven'],
      items: [], barriers: []);
  Room corridorEight = Room(position: [13, 7], roomDescription: ['corridorEight'],
      items: [], barriers: [obstacles.elementAt(13), obstacles.elementAt(9)]);
  Room mortuary = Room(position: [13, 9], roomDescription: ['mortuary'],
      items: [], barriers: []);
  Room corridorNine = Room(position: [13, 5], roomDescription: ['corridorNine'],
      items: [], barriers: []);
  Room fortificationsRoom = Room(position: [11, 5], roomDescription: ['fortificationsRoom'],
      items: [], barriers: []);
  Room corridorTen = Room(position: [11, 3], roomDescription: ['corridorTen'],
      items: [], barriers: [obstacles.elementAt(5)]);
  Room oldChurch = Room(position: [13, 3], roomDescription: ['oldChurch'],
      items: [], barriers: []);
  Room prayerRoom = Room(position: [13, 1], roomDescription: ['prayerRoom'],
      items: [], barriers: []);
  Room corridorEleven = Room(position: [9, 3], roomDescription: ['corridorEleven'],
      items: [], barriers: [obstacles.elementAt(2)]);
  Room corpseRoom = Room(position: [9, 1], roomDescription: ['corpseRoom'],
      items: [], barriers: []);
  Room brightRoom = Room(position: [9, 5], roomDescription: ['brightRoom'],
      items: [], barriers: []);
  Room end = Room(position: [9, 7], roomDescription: ['end'],
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





