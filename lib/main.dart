import 'map/mapGrid.dart';

void main() {
  Room one = Room(position: [1, 1], roomDescription: ['one'], items: [], barriers: []);
  Room two = Room(position: [3, 1], roomDescription: ['two'], items: [], barriers: []);
  Room three = Room(position: [5, 1], roomDescription: ['three'], items: [], barriers: []);
  Room four = Room(position: [1, 3], roomDescription: ['four'], items: [], barriers: []);
  Room five = Room(position: [3, 3], roomDescription: ['five'], items: [], barriers: []);

  List<Room> rooms = [
    one, two, three, four, five
  ];
  List<int> currentPosition = [1, 3];
  map(rooms, currentPosition);
  // r-r
  // -
  // r-r-r

}
