class Item {
  Item ({required this.name,
    required this.count,
    required this.key
  });

  String name;
  int count;
  String key;

  String? getNameRoom() {
    print('You can pick up $name');
  }
  String? getNameInventory() {
    print(name);
  }
  String? getNameInventoryStack() {
    print('$name X ${count.toString()}');
  }
}

void createItems (List<Item> items) {
  Item broom = Item(name: 'broom', count: 1, key: '');
  items.add(broom);
}
