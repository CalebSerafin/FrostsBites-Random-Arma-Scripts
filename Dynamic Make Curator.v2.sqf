_name = "FrostsBite";	//Not required if using a non-player specific function.
_operation = "add";		//add, remove, removeAll, info, list
//Run once! (Local/Server on debug Console).
//Kindly made by Caleb Serafin

if (_operation == "null") exitWith {"_operation not selected"};

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
MakeCurator = {
	//Kindly made by Caleb Serafin
	params["_target","_operation"];

	_infoError = 
	{
		params["_errorMessage"];
		[composeText [_errorMessage], "", false, objNull, objNull];
	};

	_return = switch (_operation) do 
	{
		case "add": 
		{
			if !(isPlayer  _target) exitWith {["_target is not a player"] call _infoError};
			_target_name = name _target;
			_curatorList = missionNamespace getVariable ["DMCv2_curatorList", [] ];
			_curatorLinkList = missionNamespace getVariable ["DMCv2_curatorLinkList", [] ];
			if (_target_name in _curatorList) exitWith {["_target is already a curator"] call _infoError};

			_curatorModule_Group = createGroup [sideLogic, true];
			_curatorModule = _curatorModule_Group createUnit["ModuleCurator_F", [100, 100, 0], [], 0, "CAN_COLLIDE"];
			_curatorList pushBack _target_name;
			_curatorLinkList pushBack [_target, _curatorModule];
			missionNamespace setVariable ["DMCv2_curatorList", _curatorList, true];
			missionNamespace setVariable ["DMCv2_curatorLinkList", _curatorLinkList, true];

			_cfgPatches = (configFile >> "CfgPatches");  
			_addonList = [];  
			for "_i" from 0 to ((count _cfgPatches) - 1) do 
			{  
				_addonList pushBack (configName (_cfgPatches select _i));  
			};  
			if (count _addonList > 0) then {_curatorModule addCuratorAddons _addonList;};  
			
			_curatorModule setcuratorcoef["place", 0];  
			_curatorModule setcuratorcoef["edit", 0];  
			_curatorModule setcuratorcoef["destroy", 0];
			_curatorModule setcuratorcoef["delete", 0];
			_curatorModule setcuratorcoef["group", 0];  
			_curatorModule setcuratorcoef["synchronize", 0];
			
			unassignCurator _curatorModule;  
			_target assignCurator _curatorModule;    

			infoResult = [];
			infoResult pushBack composeText ["info, targetName, isCurator, targetObject, curatorModule"];
			infoResult pushBack name _target;
			infoResult pushBack true;
			infoResult pushBack _target;
			infoResult pushBack _curatorModule;
			infoResult;
		};
		case "remove": 
		{
			if !(isPlayer  _target) exitWith {["_target is not a player"] call _infoError};
			_target_name = name _target;
			_curatorList = missionNamespace getVariable ["DMCv2_curatorList", [] ];
			_curatorLinkList = missionNamespace getVariable ["DMCv2_curatorLinkList", [] ];
			if !(_target_name in _curatorList) exitWith {["_target is not a curator"] call _infoError};

			_curatorLink = [objNull,objNull];
			{
				if (_x select 0 == _target) exitWith {_curatorLink = _x;};
			} forEach _curatorLinkList;
			if (isNull(_curatorLink select 0)) exitWith {["_target is not in linked list"] call _infoError};
			_curatorModule = _curatorLink select 1;

			_curatorList deleteAt (_curatorList find _target_name);
			_curatorLinkList deleteAt (_curatorList find _curatorLink);
			missionNamespace setVariable ["DMCv2_curatorList", _curatorList, true];
			missionNamespace setVariable ["DMCv2_curatorLinkList", _curatorLinkList, true];

			unassignCurator _curatorModule; 
			deleteVehicle _curatorModule; 

			infoResult = [];
			infoResult pushBack composeText ["info, targetName, isCurator, targetObject, curatorModule"];
			infoResult pushBack name _target;
			infoResult pushBack false;
			infoResult pushBack _target;
			infoResult pushBack objNull;
			infoResult;
		};
		case "removeAll": 
		{
			_curatorList = missionNamespace getVariable ["DMCv2_curatorList", [] ];
			_curatorLinkList = missionNamespace getVariable ["DMCv2_curatorLinkList", [] ];

			for "_i" from 0 to ((count _curatorLinkList) - 1) do 
			{
				_curatorModule = (_curatorLinkList select _i) select 1;
				unassignCurator _curatorModule; 
				deleteVehicle _curatorModule; 
			};

			missionNamespace setVariable ["DMCv2_curatorList", nil, true];
			missionNamespace setVariable ["DMCv2_curatorLinkList", nil, true];
			[composeText ["removeAll",lineBreak,"All curators added with this script have being removed."]] call _infoError;
		};
		case "info": 
		{
			if !(isPlayer  _target) exitWith {["_target is not a player"] call _infoError};
			_target_name = name _target;
			_curatorList = missionNamespace getVariable ["DMCv2_curatorList", []];
			_curatorLinkList = missionNamespace getVariable ["DMCv2_curatorLinkList", []];

			_curatorLink = [objNull,objNull];
			{
				if (_x select 0 == _target) exitWith {_curatorLink = _x;};
			} forEach _curatorLinkList;
			if (isNull(_curatorLink select 0)) exitWith {["_target is not in linked list"] call _infoError};
			_curatorModule = _curatorLink select 1;

			infoResult = [];
			infoResult pushBack composeText ["info, targetName, isCurator, targetObject, curatorModule"];
			infoResult pushBack name _target;
			infoResult pushBack (_target_name in _curatorList);
			infoResult pushBack _target;
			infoResult pushBack _curatorModule;
			infoResult;
		};
		case "list": 
		{
			_curatorList = missionNamespace getVariable ["DMCv2_curatorList", []];
			_output = composeText [""];
			{
				_output = composeText [_output, lineBreak ,_x];
			} forEach _curatorList;
			[_output] call _infoError;
		};
		default {["_operation not selected"] call _infoError};
	};
	_return;
};

_target = [_name] call getPlayerObject;
_args = [_target,_operation];
_return = _args call MakeCurator;

_exposed_target = _return select 3;
_exposed_curatorModule = _return select 4;
_displayData = composeText ["NAME: """,_return select 1,"""",lineBreak,"IS CURATOR: ",str (_return select 2)];
if (_return select 0 != composeText ["info, targetName, isCurator, targetObject, curatorModule"]) then {_displayData = composeText[_return select 0];};

switch (_operation) do  
{
	case "add": 
	{
	};
	case "remove": 
	{
	};
	case "removeAll": 
	{
		_displayData = composeText ["Remove All Operation: ",lineBreak,"All curators added with this script have being removed."];
	};
	case "info":
	{
		_displayData = composeText ["Player Info",lineBreak,_displayData,lineBreak,"Tip: The playerObject and curatorModuleObject are exposed at the end of this script."];
	};
	case "list":
	{
		_displayData = composeText ["Current Script Curators:",lineBreak,_displayData];
	};
};
hint _displayData;
_displayData;

//The following objects can be used to execute code on.
//_exposed_target
//_exposed_curatorModule