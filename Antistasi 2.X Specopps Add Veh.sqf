///ALL EXEC LOCAL!!!!!!!!!!

///////////////////////////////////////////
///         Personal Version            ///
///          Look at Vehicle            ///
///////////////////////////////////////////
lastVehicleSpawned = cursorObject;

///////////////////////////////////////////
///           Share Version             ///
///          Look at player             ///
///////////////////////////////////////////
[lastVehicleSpawned,{lastVehicleSpawned = _this;}] remoteExec ["call", cursorObject, false];

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
{
	_target = _x call _getPlayerObject;
	[_newVeh,{lastVehicleSpawned = _this;}] remoteExec ["call", _target, false];
} forEach _team;
hint format ["%1 shared.",TypeOf _newVeh];

///////////////////////////////////////////
///     Co-Op and Remote Version        ///
///    Look at Vehicle - Compact 2      ///
///////////////////////////////////////////
_team = ["FrostsBite","Digital","Cipher","Alain2376"];
{
	_name = _x;
	_allPlayers = call BIS_fnc_listPlayers; //Excludes HC without using array subtraction
	_target = objNull;
	{
		if (name _x == _name) exitWith {_target = _x};
	} forEach _allPlayers;
	[cursorObject,{lastVehicleSpawned = _this;}] remoteExec ["call", _target, false];
} forEach _team;
hint format ["%1 shared.",TypeOf cursorObject];

///////////////////////////////////////////
///     Co-Op and Remote Version        ///
///    Look at Vehicle - Compact 3      ///
///////////////////////////////////////////
_team = ["FrostsBite","Digital","Cipher","Alain2376"];
{_name = _x;_allPlayers = call BIS_fnc_listPlayers;_target = objNull;
{if (name _x == _name) exitWith {_target = _x};} forEach _allPlayers;
[cursorObject,{lastVehicleSpawned = _this;}] remoteExec ["call", _target, false];
} forEach _team;hint format ["%1 shared.",TypeOf cursorObject];
