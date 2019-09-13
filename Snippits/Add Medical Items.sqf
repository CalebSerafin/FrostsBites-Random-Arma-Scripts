_target = cursorTarget;
    clearWeaponCargoGlobal _target;
    clearMagazineCargoGlobal _target;
    clearItemCargoGlobal _target;
    clearBackpackCargoGlobal _target;

_listItems = [
    ["ACE_elasticBandage", 60],
    ["ACE_personalAidKit", 12],
    ["ACE_bloadIV", 6],
    ["ACE_bloadIV_500", 12],
    ["ACE_packingBandage", 30],
    ["ACE_morphine", 20],
    ["ACE_epinephrine", 30],
    ["ACE_bodyBag", 8],
    ["ACE_surgicalKit", 2],
    ["ACE_earPlugs", 4]
];
{
    _target addItemCargoGlobal [_x select 0, _x select 1];
} forEach _listItems;

hint "Items Added";