[] call grad_fortifications_fnc_removeAllEHs;

_fort = player getVariable ["grad_fortifications_currentFort", objNull];
deleteVehicle _fort;

_type = player getVariable ["grad_fortifications_currentType", ""];
_mode = player getVariable ["grad_fortifications_currentMode", "NORMAL"];

if (_mode == "DROP") then {
    [_type,_mode] call grad_fortifications_fnc_dropFort;
};
