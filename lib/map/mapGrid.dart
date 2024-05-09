void map(List<Room> rooms, List<int> currentPosition){
  rooms;
  currentPosition;
  List<List<int>> tunnels = [
    [2,1],[4,1],[1,2],[2,3]
  ];
  bool existingRoom = false;

  // r-r
  // -
  // r-r-r

  for(Room room in rooms){
    if(currentPosition.toString() == room.position.toString()){
      print(room.roomDescription.elementAt(0));
      existingRoom = true;
    }
  }
  if(existingRoom == false){
    print('where are you');
  }
}

class Room {
  List<int> position;
  List<String> roomDescription;
  List<Object> items;
  List<Object> barriers;

  Room ({
    required this.position,
    required this.roomDescription,
    required this.items,
    required this.barriers
  });
}
