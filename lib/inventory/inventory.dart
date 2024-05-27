import 'package:untitled/inventory/items.dart';
import 'package:untitled/map/mapGrid.dart';

void beginningInventory(List<Item> inventory){
  Item matches = Item(name: 'matches', count: 3, key: '');
  Item trowel = Item(name: 'trowel', count: 1, key: '');
  Item sickle = Item(name: 'sickle', count: 1, key: '');

  inventory.addAll([matches, trowel, sickle]);
}

void showInventory (List<Item> inventory){
  for(Item item in inventory){
    if (item.count > 1){
      item.getNameInventoryStack();
    }else{
      item.getNameInventory();
    }
  }
}

void pickUpItems(List<Room> rooms, List<Item> items,
    List<Item> inventory, List<int> currentPosition){

  for(Room room in rooms){
    if(currentPosition.toString() == room.position.toString()){
      if (room.items.isNotEmpty){
        for(Item item in items){
          if (room.items.isNotEmpty){
            if (item == room.items.first){
              room.items.remove(item);
              inventory.add(item);
            }
          }
        }
      }
    }
  }
}
