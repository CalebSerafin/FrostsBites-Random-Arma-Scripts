[unit,true,9999,true] call ace_medical_fnc_setUnconscious;
[player,false,0,true] call ace_medical_fnc_setUnconscious;



getPlayerObject = {
	//Kindly made by Caleb Serafin
	params["_name"]; 	//Return Player Object
	//Scheduled Enviroment only (spawn, remoteExec, execVM)

	_allPlayers = call BIS_fnc_listPlayers; //Excludes HC without using array subtraction
	_playerObject = objNull;
	{
		if (name _x == _name) exitWith {_playerObject = _x};
	} forEach _allPlayers;
	_playerObject; 
};

mapGridPosition ["Nomas"] call getPlayerObject;

_player = ["Shreffy"] call getPlayerObject;
[_player,-99999, -1] remoteExec ["A3A_fnc_punishment",_player];


cursorObject setVariable ["ownerX",nil,true];			//Unlock vehicle
cursorObject setVariable ["ownerX",player,true];			//Lock vehicle

player setUnitLoadout (getUnitLoadout cursorObject);	//Assimilate

_hr = server getVariable ["hr",8];
_hr = _hr - 1;
server setVariable ["hr",_hr,true];


playerHasBeenPvP = [];		//Purge PvP timeout List, Execute upon Joining
publicVariable "playerHasBeenPvP";