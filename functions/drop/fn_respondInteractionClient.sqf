params ["_crate","_unit","_mode"];

_fortType = _crate getVariable ["grad_fortifications_dropCrate_type",""];
_crate setVariable ["grad_fortifications_dropCrate_type",""];
deleteVehicle _crate;

if (_fortType == "" || isNull _crate) exitWith {};

if (_mode == "TAKE") then {
    [_unit,_fortType,1] call grad_fortifications_fnc_addFort;
};

if (_mode == "BUILD") then {
    [_fortType,"DROPPED"] remoteExec ["grad_fortifications_fnc_startPlacement",_unit,false];
};
