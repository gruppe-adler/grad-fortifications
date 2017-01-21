#include "..\..\dialog\menu\defines.hpp"

params ["_type",["_mode","NORMAL"],"_pos"];
private ["_crateType"];

if (_mode == "NORMAL") then {
    [player,_type] call grad_fortifications_fnc_removeFort;
};

if (isNil "_pos") then {
    _pos = (getPos player) vectorAdd [2.5,0,0];
};

_crateType = if (isClass (configfile >> "CfgPatches" >> "CUP_Core")) then {"Fort_Crate_wood"} else {"Land_WoodenCrate_01_F"};
_crate = createVehicle [_crateType,_pos,[],0,"NONE"];
[_crate,_type] remoteExec ["grad_fortifications_fnc_initDropCrate",0,true];


disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
[_dialog,_listCtrl] call grad_fortifications_fnc_updateItemList;
