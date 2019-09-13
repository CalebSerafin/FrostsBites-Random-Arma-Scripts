if (name player == "Digital") then
{
	_passMeBack = getpos player;
	[
		-1,
		{
			_pos = _this;
			if (name player == "FrostsBite") then
			{
				if (_pos == []) then 
				{
					hint "Player Not Found";
				}
				else
				{
					hint str _pos;
					player setPos (_pos);
				};
			};
		},
		_passMeBack
	] call CBA_fnc_globalExecute;
};