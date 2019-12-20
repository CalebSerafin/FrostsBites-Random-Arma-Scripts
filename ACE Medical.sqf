[player,false,0,true] call ace_medical_fnc_setUnconscious;
[objNull,player,0] call ace_medical_fnc_treatmentAdvanced_fullHeal;

_target = player;
player getVariable["setUnconcious",false];
[player,false,0,true] call ace_medical_fnc_setUnconscious;