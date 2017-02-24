params ["_unit","_type",["_amount",1]];

if (_type == "") exitWith {};

_amount = -(abs _amount);

if (!local _unit) exitWith {
    [_unit,_type,_amount] remoteExec ["grad_fortifications_fnc_addFort",_unit,false];
};
