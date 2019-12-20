//https://github.com/michail-nikolaev/task-force-arma-3-radio/issues/1153
//Potential workaround. At init.sqf

["unit", {
    //current unit changed (Curator took control of unit)

    if (player != (_this select 0)) then {
        player setVariable ["TFAR_controlledUnit",(_this select 0), true];//This tells other players that our position is different
    } else {
        player setVariable ["TFAR_controlledUnit",nil, true];
    };

    TFAR_currentUnit = (_this select 0);
    };

},true] call CBA_fnc_addPlayerEventHandler;