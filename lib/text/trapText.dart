void trapTextIntro(){
  print('As you step into the room before you can have a proper look at the');
  print('room darkness springs out from the walls and surrounds you on all sides. You');
  print('feel the darkness twisting and churning around you as it seeps closer and');
  print('closer towards you and as it does so you feel its energy. It feels dreadful, like');
  print('you are in the presence of death himself and that you might die if you do');
  print('nothing (you can now only look at your “inventory”, “use “item”” or “give up”).');
}

void trapTextConclusion(int outcome){
  //7 outcomes (six game overs)
  if(outcome == 1){
    print('You take out the broom and begin sweeping away at the darkness but it does');
    print('nothing as it creeps closer until it seeps into you, erasing your corrupted soul.');
    print('');
    print('Game over. Your life has been swept away.');
  }
  if(outcome == 2){
    print('You take out the mysterious orb and try chanting any spell that comes to mind');
    print('but your feeble understanding of the dark arts fails you as the darkness creeps');
    print('closer and blows up the orb in your hand, its shards piercing your hands, chest,');
    print('skull, and your black eyes.');
    print('');
    print('Game over. You were consumed the mystery.');
  }
  if(outcome == 3){
    print('You take out the keyring and begin shaking it around hoping the darkness will');
    print('leave you be due to the noise, but it doesn’t. It creeps ever closer until you it');
    print('seeps into your lungs and suffocates you and you breath your last, though it');
    print('isn’t the first time for you.');
    print('');
    print('Game over. You unlocked the door to the afterlife.');
  }
  if(outcome == 4){
    print('You take out your matches and light them thinking that it will keep the darkness');
    print('at bay. For a moment you feel safe until you notice that the darkness hasn’t');
    print('slowed down in its approach if anything it has become faster. As you begin to');
    print(' panic it has reached you and imbues some sort of magic into the flames. The');
    print('flames grow larger and engulf you in flames. As your skin burns and your cold');
    print('blood boils you die in agony.');
    print('');
    print('Game over. Your light has been snuffed.');
  }
  if(outcome == 5){
    print('You take out your trowel and begin desperately digging at the stone ground');
    print('hoping to get away but its no use, you can’t dig through and the darkness it');
    print('rapidly approaching. As the darkness reaches you it begins to crush you and');
    print(' your elongated spine, you die within moments.');
    print('');
    print('Game over. You dug your own grave.');
  }
  if(outcome == 6){
    print('You take out your sickle attempting to thrash and cut away t the darkness but its');
    print('no use. Its intangible to your efforts and as it approaches you it cuts into your');
    print('deathly pale skin once, then twice, then thrice, then many more times until you');
    print('bled to death.');
    print('');
    print('Game over. Death’s scythe is much more impressive than yours.');
  }
  if(outcome == 7){
    print('As you take out the parchment its golden symbols begin shine and');
    print('emit a slight hum as the darkness slows down until it halts. All the sudden the');
    print('parchment in your hands burn up in an ethereal blue flame as the darkness');
    print('recedes and disappears. Now you can clearly see that');
  }
}
