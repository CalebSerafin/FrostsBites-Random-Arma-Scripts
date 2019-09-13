_name = "FrostsBite";
_delete = false;
_deleteAll = false;
//run on global with name to add/remove someone else to Zues.
//Only deletes Zues made with this script. (Unless you have the knowhow)
 
if (name player != _name) exitWith {};
_passMe = [player,_name,_delete,_deleteAll];
[
	0,
	{
		private ["_name","_delete","_deleteAll"]; 
		_meObject = _this select 0;  
		_name = _this select 1;
		_delete = _this select 2;
		_deleteAll = _this select 3;
		_oldCurIndex = missionNamespace getVariable ["curIndex",[objNull]];
		if ((_oldCurIndex select 0) != (_oldCurIndex select 0)) then {_oldCurIndex deleteAt 0};

		_curVarNameExist = if ((_oldCurIndex find _name) >= 0) then {true} else {false};  

		_deleteCurIndex = if (_deleteAll) then {_oldCurIndex} else {[_name]};
		if (_curVarNameExist || _deleteAll) then 
		{ 
			{
				_curVarName = _x+"Cur";
				_myCurObject = missionNamespace getVariable [_curVarName, objNull];  
				unassignCurator _myCurObject; 
				deleteVehicle _myCurObject; 
				missionNamespace setVariable [_curVarName,nil,true];
				_oldCurIndex deleteAt (_oldCurIndex find _x);
				_curVarNameExist = false;
			} forEach _deleteCurIndex;
			missionNamespace setVariable ["curIndex",_oldCurIndex,true];
		};  

		if (_delete || _deleteAll) exitWith {};

		if !(_curVarNameExist) then 
		{  
			_curVarName = _name+"Cur";
			_playerCur_group = createGroup [sideLogic, true];  
			_myCurObject = _playerCur_group createUnit["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"]; //Logic Server  
			_myCurObject setVariable ["showNotification",false];  

			missionNamespace setVariable [_curVarName,_myCurObject,true];  
			_oldCurIndex pushBack _name;
			missionNamespace setVariable ["curIndex",_oldCurIndex,true];

			_cfg = (configFile >> "CfgPatches");  
			_newAddons = [];  
			for "_i" from 0 to((count _cfg) - 1) do 
			{  
				_addon = configName(_cfg select _i);  
				_newAddons pushBack _addon;  
			};  
			if (count _newAddons > 0) then {_myCurObject addCuratorAddons _newAddons};  

			_myCurObject setcuratorcoef["place", 0];  
			_myCurObject setcuratorcoef["delete", 0];

			unassignCurator _myCurObject;  
			_meObject assignCurator _myCurObject;    
		};  
	},
	_passMe
] call CBA_fnc_globalExecute;

