#include "..\..\dialog\defines.hpp"

params ["_type",["_mode","NORMAL"]];

[player,_type] call grad_fortifications_fnc_removeFort;

_pos = (getPos player) vectorAdd [0,1.5,0];
_crate = "Land_WoodenCrate_01_F" createVehicle _pos;

[_crate,_type] remoteExec ["grad_fortifications_fnc_initDropCrate",0,true];


disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
[_listCtrl] call grad_fortifications_fnc_updateItemList;
