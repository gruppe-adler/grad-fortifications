params ["_unit","_type",["_amount",1]];

if (_type == "") exitWith {};

if !(local _unit) then {
    [_unit,_type,-(_amount)] remoteExec ["grad_fortifiations_fnc_addFortRemote",0,false];
} else {
    [_unit,_type,-(_amount)] call grad_fortifications_fnc_addFortRemote;
};
