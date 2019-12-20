//
_crate ="B_supplyCrate_F" createVehicle getPos Player;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate call jn_fnc_logistics_addAction;

//Crate Loadable Quadbike
("C_Quadbike_01_F" createVehicle getPos Player) call jn_fnc_logistics_addAction;

"C_Offroad_01_F" createVehicle getPos Player;

//EFT
_money = player getVariable ["moneyX",0];
_money = _money - 0;
player setVariable ["moneyX",_money];

//Sell somebody a Loadable Quadbike
_buyer = cursorObject;
_money = _buyer getVariable ["moneyX",0];
if (_money>=55) then
{
	_money = _money - 55;
	_buyer setVariable ["moneyX",_money];
	("C_Quadbike_01_F" createVehicle getPos player) call jn_fnc_logistics_addAction;
	
	hint format ["Sold to %1", name _buyer];
}
else
{
	hint ["%1 is poor as shit", name _buyer];
};

//Sell somebody a Loadable Crate
_buyer = cursorObject;
_money = _buyer getVariable ["moneyX",0];
if (_money>=50) then
{
	_crate = NATOAmmobox createVehicle getPos Player;
	clearMagazineCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	_crate call jn_fnc_logistics_addAction;
	
	_money = _money - 50;
	_buyer setVariable ["moneyX",_money];
	hint format ["Sold to %1", name _buyer];
}
else
{
	hint ["%1 is poor as shit", name _buyer];
};