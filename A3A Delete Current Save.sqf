/*
Script:
	A3A Delete Current Save

Description:
	Deletes the current save loaded.
	Be careful!

Returns:
	<BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
	

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Caleb Sebastian Serafin
*/
private _gametype = if (side petros == independent) then {"Greenfor"} else {"Blufor"};

// Temporary Patch for typo in A3A_fnc_deleteSave which crashes since it omits the underscore in _postfix.
private _postfix = if (worldname == "Tanoa") then {
	format["%1%2WoTP",serverID,campaignID];
} else {
	if (_gametype == "Blufor") then {
		format["%1%2AntistasiB%3",serverID,campaignID,worldname];
	} else {
		format["%1%2Antistasi%3",serverID,campaignID,worldname];
	};
};
missionNamespace setVariable ["postfix",_postfix,2];
[campaignID,worldname,_gametype] remoteExec ["A3A_fnc_deleteSave",2,false];
missionNamespace setVariable ["postfix",nil,2];

true;
