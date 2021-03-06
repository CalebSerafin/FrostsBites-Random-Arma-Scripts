hack3rd_script = 
{
	while {true} do 
	{
			vehicle player switchCamera "External";
			uiSleep 0.008;
	};
};

_hack3rd_handle = player getVariable ["hack3rd_handle", objNull ];
if !( isNull _hack3rd_handle) then {terminate _hack3rd_handle};
player setVariable ["hack3rd_active", false, true ];
player setVariable ["hack3rd_minimised", false, true ];
player setVariable ["hack3rd_handle", objNull, true ];

(findDisplay 46) displayAddEventHandler ["KeyDown",
{	
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	if (inputAction "personView" > 0) then
	{
		_hack3rd_handle = player getVariable ["hack3rd_handle", objNull ];
		if !( isNull _hack3rd_handle) then {terminate _hack3rd_handle};
		_hack3rd_active = player getVariable ["hack3rd_active", false ];
		_hack3rd_minimised = player getVariable ["hack3rd_minimised", false ];
		if (_hack3rd_active) then
		{
			player setVariable ["hack3rd_active", false, true ];
		}
		else
		{
			if (_hack3rd_minimised) then
			{
				_hack3rd_handle = [] spawn hack3rd_script;
				player setVariable ["hack3rd_handle", _hack3rd_handle, true ];
				player setVariable ["hack3rd_minimised", false, true ];
				player setVariable ["hack3rd_active", true, true ];
			}
			else
			{
				_hack3rd_handle = [] spawn hack3rd_script;
				player setVariable ["hack3rd_handle", _hack3rd_handle, true ];
				player setVariable ["hack3rd_active", true, true ];
			};
		};
	};
}];


(findDisplay 46) displayAddEventHandler ["MouseButtonDown",
{
	params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	if (_button == 1) then
	{
		_hack3rd_minimised = player getVariable ["hack3rd_minimised", false ];
		_hack3rd_active = player getVariable ["hack3rd_active", false ];
		if (_hack3rd_minimised) then
		{
			_hack3rd_handle = [] spawn hack3rd_script;
			player setVariable ["hack3rd_handle", _hack3rd_handle, true ];
			player setVariable ["hack3rd_minimised", false, true ];
			player setVariable ["hack3rd_active", true, true ];
		}
		else 
		{
			if (_hack3rd_active) then
			{
				_hack3rd_handle = player getVariable ["hack3rd_handle", objNull ];
				if !( isNull _hack3rd_handle) then {terminate _hack3rd_handle};
				player setVariable ["hack3rd_minimised", true, true ];
				player setVariable ["hack3rd_active", false, true ];
			};
		};
	};
}];