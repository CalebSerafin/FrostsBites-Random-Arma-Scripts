//Execute on Global 
//Vars:
_typeBike = "B_GEN_Offroad_01_GEN_F"; //FrostB: Custom Vehicle
_whoSpawn = "FrostsBite"; //FrostB: The person who has it spawned near them
_specOpps = ["Digital","Cipher","FrostsBite"]; //FrostB: The Specopps Team who can get in

if (name player == _whoSpawn) exitwith { 
_markerX = [markersX,player] call BIS_fnc_nearestPosition;

_sideX = side player;
_nameX = if (_sideX == Occupants) then {nameOccupants} else {nameInvaders};

//FrostB: following location checks are disabled
//if (sidesX getVariable [_markerX,sideUnknown] != _sideX) exitWith {hint format ["You need to be close to a zone belonging to %1 in order to request a vehicle",_nameX]};
//if ((!(_markerX in airportsX)) and (!(_markerX in seaports)) and (!(_markerX in outposts))) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost of your side in order to request a vehicle"};
//if (not(player inArea _markerX)) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost in order to request a vehicle"};

//FrostB: Selects from normal list:
//_typeBike = if (_sideX == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};

//FrostB: CLears last one:
if (!isNull lastVehicleSpawned) then
    {
    if (lastVehicleSpawned distance player < 100) then {deleteVehicle moto};
    };

hint "Vehicle available";
_pos = [];
_radius = 10;
while {_pos isEqualTo []} do
    {
    _pos = (position player) findEmptyPosition [5,_radius,"I_Truck_02_covered_F"];
    _radius = _radius + 10;
    };
lastVehicleSpawned = createVehicle [_typeBike,_pos, [], 10, "NONE"];

[lastVehicleSpawned] call A3A_fnc_AIVEHinit; //FrostB: allows garbage cleaning and the good stuff

//FrostB: Globalizes the identity of last spawn specopp vehical
missionNamespace setVariable ["lastSpecOppVeh",lastVehicleSpawned];
};

if (name player in _specOpps) exitwith { 
sleep(1);
lastVehicleSpawned = missionNamespace getVariable "lastSpecOppVeh"; //FrostB: Sets the identity of the last spawned vehicle to the specific player
};

//Execute on Global 
//Vars:
_whoSpawn = "FrostsBite"; //FrostB: The person who has it spawned near them
_specOpps = ["Digital","Cipher","FrostsBite"]; //FrostB: The Specopps Team who can get in

if (name player == _whoSpawn) exitwith { 

lastVehicleSpawned = cursorTarget;

//FrostB: Globalizes the identity of last spawn specopp vehical
missionNamespace setVariable ["lastSpecOppVeh",lastVehicleSpawned];
};

if (name player in _specOpps) exitwith { 
sleep(1);
lastVehicleSpawned = missionNamespace getVariable "lastSpecOppVeh"; //FrostB: Sets the identity of the last spawned vehicle to the specific player
};












//Execute on Global 
//Vars:
_typeBike = "B_GEN_Offroad_01_GEN_F"; //FrostB: Custom Vehicle
_whoSpawn = "FrostsBite"; //FrostB: The person who has it spawned near them
_specOpps = ["Digital","Cipher","FrostsBite"]; //FrostB: The Specopps Team who can get in

if (name player == _whoSpawn) exitwith { 
_markerX = [markersX,player] call BIS_fnc_nearestPosition;

_sideX = side player;
_nameX = if (_sideX == Occupants) then {nameOccupants} else {nameInvaders};

//FrostB: following location checks are disabled
//if (sidesX getVariable [_markerX,sideUnknown] != _sideX) exitWith {hint format ["You need to be close to a zone belonging to %1 in order to request a vehicle",_nameX]};
//if ((!(_markerX in airportsX)) and (!(_markerX in seaports)) and (!(_markerX in outposts))) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost of your side in order to request a vehicle"};
//if (not(player inArea _markerX)) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost in order to request a vehicle"};

//FrostB: Selects from normal list:
//_typeBike = if (_sideX == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};

//FrostB: CLears last one:
if (!isNull moto) then
    {
    if (moto distance player < 100) then {deleteVehicle moto};
    };

hint "Vehicle available";
_pos = [];
_radius = 10;
while {_pos isEqualTo []} do
    {
    _pos = (position player) findEmptyPosition [5,_radius,"I_Truck_02_covered_F"];
    _radius = _radius + 10;
    };
moto = createVehicle [_typeBike,_pos, [], 10, "NONE"];

[moto] call A3A_fnc_AIVEHinit; //FrostB: allows garbage cleaning and the good stuff

//FrostB: Globalizes the identity of last spawn specopp vehical
missionNamespace setVariable ["lastSpecOppVeh",moto];
};

if (name player in _specOpps) exitwith { 
sleep(1);
moto = missionNamespace getVariable "lastSpecOppVeh"; //FrostB: Sets the identity of the last spawned vehicle to the specific player
};

//Execute on Global 
//Vars:
_whoSpawn = "FrostsBite"; //FrostB: The person who has it spawned near them
_specOpps = ["Digital","Cipher","FrostsBite"]; //FrostB: The Specopps Team who can get in

if (name player == _whoSpawn) exitwith { 

moto = cursorTarget;

//FrostB: Globalizes the identity of last spawn specopp vehical
missionNamespace setVariable ["lastSpecOppVeh",moto];
};

if (name player in _specOpps) exitwith { 
sleep(1);
moto = missionNamespace getVariable "lastSpecOppVeh"; //FrostB: Sets the identity of the last spawned vehicle to the specific player
};