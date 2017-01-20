[] call grad_fortifications_fnc_removeAllEHs;
[false] call grad_fortifications_fnc_openHint;
call ace_interaction_fnc_hideMouseHint;
player forceWalk false;

_fort = player getVariable ["grad_fortifications_currentFort", objNull];
_fortPos = getPos _fort;
deleteVehicle _fort;

player setVariable ["grad_fortifications_isPlacing", false];

_type = player getVariable ["grad_fortifications_currentType", ""];
_mode = player getVariable ["grad_fortifications_currentMode", "NORMAL"];

if (_mode == "DROPPED") then {
    if (player getVariable ["grad_fortifications_isColliding",true]) then {
        [_type,_mode] call grad_fortifications_fnc_dropFort;
    } else {
        [_type,_mode,_fortPos] call grad_fortifications_fnc_dropFort;
    };
};
