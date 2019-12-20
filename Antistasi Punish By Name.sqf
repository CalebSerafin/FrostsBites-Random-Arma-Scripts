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

_foolish = [""] call getPlayerObject;
_foolish = cursorObject;

_foolish setPos (getPos player);
		//Action:
//[_foolish, true] call ACE_captives_fnc_setHandcuffed;
//[_foolish,120, 1, "sudo"] remoteExec ["A3A_fnc_punishment",_foolish];