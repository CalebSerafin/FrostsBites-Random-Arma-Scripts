hack3rd_script = 
{
	while {player getVariable ["hack3rd_active", false ]} do 
	{
			vehicle player switchCamera "External";
	};
};

_hack3rd_handle = player getVariable ["hack3rd_handle", objNull ];
if (!isNull _hack3rd_handle) then { terminate _hack3rd_handle; };
_hack3rd_handle = [] spawn hack3rd_script;
player setVariable ["hack3rd_handle", _hack3rd_handle, true ];

(findDisplay 46) displayAddEventHandler ["KeyDown",
{
	_key = _this select 1;
	if (_key == 25) then // HEX: 0x19 DEC: 25 KEY: P
	{
		_hack3rd_active = player getVariable ["hack3rd_active", false ];
		if (_hack3rd_active) then
		{
			player setVariable ["hack3rd_active", false, true ];
		}
		else
		{
			player setVariable ["hack3rd_active", true, true ];
		};
	};
}];




/*
if (_button == 156) then // HEX: 0x9C DEC: 156 KEY: Numpad Enter
{
	_hack3rd_active = player getVariable ["hack3rd_active", false ];
	if (_hack3rd_active) then
	{
		player setVariable ["hack3rd_active", false, true ];
	}
	else
	{
		player setVariable ["hack3rd_active", true, true ];
	};
};
*/


(findDisplay 46) displayAddEventHandler ["KeyDown",
{	
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	hint str _key;
}];

(findDisplay 46) displayAddEventHandler ["MouseButtonDown",
{
	params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	hint str _button;
}];


//inputAction personView;
//inputAction  optics;

// if (inputAction "optics" > 0) then
// (findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
// (findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";