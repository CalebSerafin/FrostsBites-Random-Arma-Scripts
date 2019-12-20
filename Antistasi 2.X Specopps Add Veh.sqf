///////////////////////////////////////////
///	      	Personal Version            ///
///          Look at Vehicle            ///
///////////////////////////////////////////
lastVehicleSpawned = cursorObject; //FrostB: Sets the identity of the last spawned vehicle to the specific player

///////////////////////////////////////////
///           Share Version             ///
///          Look at player             ///
///////////////////////////////////////////
cursorObject setVariable ["lastVehicleSpawned",lastVehicleSpawned];

///////////////////////////////////////////
///		Co-Op and Remote Version        ///
///          Look at Vehicle            ///
///////////////////////////////////////////
_newVeh = cursorObject;
_team = ["FrostsBite","Digital","Cipher"];

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
{
	(_x call getPlayerObject) setVariable ["lastVehicleSpawned",_newVeh]
} forEach _team;