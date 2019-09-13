_target = cursorTarget;
    clearWeaponCargoGlobal _target;
    clearMagazineCargoGlobal _target;
    clearItemCargoGlobal _target;
    clearBackpackCargoGlobal _target;

_listBackpack = [
    ["TF_ANPRC155", 10],
    ["TF_ANARC164", 10]
];
{
    _target addBackpackCargoGlobal [_x select 0, _x select 1];
} forEach _listBackpack;