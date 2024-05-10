List<List<int>> possibleMovement(List<int> currentPosition){
  List<int> northOfCurrentPosition = [currentPosition.first, currentPosition.last+1];
  List<int> eastOfCurrentPosition = [currentPosition.first+1, currentPosition.last];
  List<int> southOfCurrentPosition = [currentPosition.first, currentPosition.last-1];
  List<int> westOfCurrentPosition = [currentPosition.first-1, currentPosition.last];

  List<List<int>> possibleMovement = [
    northOfCurrentPosition,
    eastOfCurrentPosition,
    southOfCurrentPosition,
    westOfCurrentPosition
  ];

  return possibleMovement;
}

List<bool> isMovementLegal(
    List<List<int>> tunnels,
    List<List<int>> possibleMovement,
    ) {

  bool northLegal = false;
  bool eastLegal = false;
  bool southLegal = false;
  bool westLegal = false;

  for(List<int > tunnel in tunnels){
    if (tunnel.toString() == possibleMovement.elementAt(0).toString()){
      northLegal = true;
    }
    if (tunnel.toString() == possibleMovement.elementAt(1).toString()){
      eastLegal = true;
    }
    if (tunnel.toString() == possibleMovement.elementAt(2).toString()){
      southLegal = true;
    }
    if (tunnel.toString() == possibleMovement.elementAt(3).toString()){
      westLegal = true;
    }
  }

  return [northLegal, eastLegal, southLegal, westLegal];
}

List<String> movementText(List<bool> isMovementLegal){
  List<String> movementText = [];
  if (isMovementLegal.elementAt(0)){
    movementText.add('north is legal');
  }
  if (isMovementLegal.elementAt(1)){
    movementText.add('east is legal');
  }
  if (isMovementLegal.elementAt(2)){
    movementText.add('south is legal');
  }
  if (isMovementLegal.elementAt(3)){
    movementText.add('west is legal');
  }

  return movementText;
}
