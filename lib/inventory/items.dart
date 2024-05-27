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
  Item broom = Item(name: 'broom', count: 1, key: 'curiosity');
  Item mysteriousOrb = Item(name: 'mysterious orb', count: 1, key: 'curiosity');
  Item ornateKey = Item(name: 'ornate key', count: 1, key: 'ornate');
  Item rustyKey = Item(name: 'rusty key', count: 1, key: 'rusty');
  Item ironKey = Item(name: 'heavy iron key', count: 1, key: 'iron');
  Item bronzeKeyring = Item(name: 'bronze keyring', count: 3, key: 'bronze');
  Item blackParchment = Item(name: 'black parchment with gold etchings', count: 1, key: 'event');
  items.addAll([
    broom,
    mysteriousOrb,
    ornateKey,
    rustyKey,
    ironKey,
    bronzeKeyring,
    blackParchment
  ]);
}
