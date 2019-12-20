_target = cursorTarget;
    clearWeaponCargoGlobal _target;
    clearMagazineCargoGlobal _target;
    clearItemCargoGlobal _target;
    clearBackpackCargoGlobal _target;
_listUniform = [
    ["RHS_Uniform_G3_MC", 20],
    ["RHS_Booniehat_OCP", 10],
    ["RHSUSF_Patrolcap_OCP", 5],
    ["RHSUSF_ACH_Helmet_OCP", 15],
    ["RHSUSF_MBAV_Rifleman", 10],
    ["RHSUSF_MBAV_Light", 5],
    ["RHSUSF_MBAV_MG", 3],
    ["RHSUSF_MBAV_Medic", 3]
];
{
    _target addItemCargoGlobal [_x select 0, _x select 1];
} forEach _listUniform;
_listBackpack = [
    ["TF_RT1523G_Big_RHS", 10],
    ["TF_RT1523G_RHS", 10]
];
{
    _target addBackpackCargoGlobal [_x select 0, _x select 1];
} forEach _listBackpack;