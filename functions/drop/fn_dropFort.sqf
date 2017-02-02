#include "..\..\dialog\menu\defines.hpp"

params ["_type",["_mode","NORMAL"],"_pos"];
private ["_crateType"];

if (_mode == "NORMAL") then {
    [player,_type] call grad_fortifications_fnc_removeFort;
};

_crateType = if (isClass (configfile >> "CfgPatches" >> "CUP_Core")) then {"Fort_Crate_wood"} else {"Land_WoodenCrate_01_F"};
if (isNil "_pos") then {
    _pos = (player getRelPos [2.5,0]) findEmptyPosition [2, 10, _crateType];
};

_crate = createVehicle [_crateType,[0,0,0],[],0,"NONE"];
_crate setDir (random 360);
_crate setPos _pos;
[_crate,_type] remoteExec ["grad_fortifications_fnc_initDropCrate",0,true];


disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
[] call grad_fortifications_fnc_updateItemList;
