///ALL EXEC LOCAL!!!!!!!!!!

///////////////////////////////////////////
///         Personal Version            ///
///          Look at Vehicle            ///
///////////////////////////////////////////
lastVehicleSpawned = cursorObject; //FrostB: Sets the identity of the last spawned vehicle to the specific player

///////////////////////////////////////////
///           Share Version             ///
///          Look at player             ///
///////////////////////////////////////////
cursorObject setVariable ["lastVehicleSpawned",lastVehicleSpawned];

///////////////////////////////////////////
///     Co-Op and Remote Version        ///
///          Look at Vehicle            ///
///////////////////////////////////////////
_team = ["FrostsBite","Digital","Cipher","Alain2376"];
_newVeh = cursorObject;
_getPlayerObject = {
	//Kindly made by Caleb Serafin
	params["_name"]; 	//Return Player Object

	_allPlayers = call BIS_fnc_listPlayers; //Excludes HC without using array subtraction
	_playerObject = objNull;
	{
		if (name _x == _name) exitWith {_playerObject = _x};
	} forEach _allPlayers;
	_playerObject; 
};
_changeLastVeh = {
	params["_newVeh"];
	lastVehicleSpawned = _newVeh;
};
{
	_target = _x call _getPlayerObject;
	[_newVeh,{lastVehicleSpawned = _this;}] remoteExec ["call", _target, false];
} forEach _team;
	hint format ["%1 shared.",TypeOf _newVeh];

///////////////////////////////////////////
///     Co-Op and Remote Version        ///
///     Look at Vehicle - Compact       ///
///////////////////////////////////////////
_team = ["FrostsBite","Digital","Cipher","Alain2376"];
_newVeh = cursorObject;
_getPlayerObject = {params["_name"];_allPlayers = call BIS_fnc_listPlayers;_playerObject = objNull;
{if (name _x == _name) exitWith {_playerObject = _x};} forEach _allPlayers;_playerObject;};
_changeLastVeh = { params["_newVeh"];lastVehicleSpawned = _newVeh;};
{_target = _x call _getPlayerObject;[_newVeh,{lastVehicleSpawned = _this;}] remoteExec ["call", _target, false];
} forEach _team;hint format ["%1 shared.",TypeOf _newVeh];
