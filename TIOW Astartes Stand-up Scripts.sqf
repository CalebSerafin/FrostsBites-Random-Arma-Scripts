mcn_action = 
[
	"mcn_stand",
	"Stand Up",
	"",
	{this switchAction "PlayerStand";},
	{true}
] call ace_interact_menu_fnc_createAction;
[this,1,["ACE_SelfActions"],mcn_action] call ace_interact_menu_fnc_addActionToObject;
[this,0,["ACE_MainActions"],mcn_action] call ace_interact_menu_fnc_addActionToObject;

mcn_action = 
[
	"mcn_stand",
	"Stand Up",
	"",
	{player switchAction "PlayerStand";},
	{true}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],mcn_action] call ace_interact_menu_fnc_addActionToObject;

mcn_action = 
[
	"mcn_stand",
	"Stand Up",
	"",
	{cursorObject switchAction "PlayerStand";},
	{true}
] call ace_interact_menu_fnc_createAction;
[cursorObject,0,["ACE_MainActions"],mcn_action] call ace_interact_menu_fnc_addActionToObject;

//ACE_MainActions ACE_SelfActions

//or

[player, ["Stand Up", {player playMove "AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDup"}]] remoteExec ["addAction", 0, true];

[cursorObject, ["Stand Up", {cursorObject playMove "AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDup"}]] remoteExec ["addAction", 0, true];

[
	cursorObject, 
	[
		"Stand Up", 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_arguments select 0 playMove "AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDup"
		},
		[cursorObject]
	]
] remoteExec ["addAction", 0, true];

// or

player playMove "AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDup";