getPlayerObject = {
	//Kindly made by Caleb Serafin
	params["_name"]; 	//Return Player Object

	_allPlayers = call BIS_fnc_listPlayers; //Excludes HC without using array subtraction
	_playerObject = objNull;
	{
		if (name _x == _name) exitWith {_playerObject = _x};
	} forEach _allPlayers;
	_playerObject; 
};