_roadObject = str(( player nearRoads 100 ) select 0 ); 
_roadID = parseNumber(( _roadObject splitString ":" ) select 0 ); 
_roadObject = getPos player nearestObject _roadID; 
//player setPos getPos _roadObject;
_roadObject;