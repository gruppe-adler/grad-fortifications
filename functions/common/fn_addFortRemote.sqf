params ["_unit","_type",["_amount",1]];

if !(local _unit) exitWith {};

_myForts = _unit getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate];

_stock = [_myForts,_type] call CBA_fnc_hashGet;
if (_stock+_amount <= 0) then {
    [_myForts,_type] call CBA_fnc_hashRem;
} else {
    [_myForts,_type,_stock+_amount] call CBA_fnc_hashSet;
};

_unit setVariable ["grad_fortifications_myFortsHash",_myForts];
