[] call grad_fortifications_fnc_removeAllEHs;
[false] call grad_fortifications_fnc_openHint;
call ace_interaction_fnc_hideMouseHint;
player forceWalk false;

private _fort = player getVariable ["grad_fortifications_currentFort", objNull];
private _fortPos = getPosASL _fort;
private _fortType = typeOf _fort;

private _onPlaceCancel = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _fortType >> "onPlaceCancel"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onPlaceCancel"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;
[player,_fortType,_fort] call compile _onPlaceCancel;

deleteVehicle _fort;

player setVariable ["grad_fortifications_isPlacing", false];

_type = player getVariable ["grad_fortifications_currentType", ""];
_mode = player getVariable ["grad_fortifications_currentMode", "NORMAL"];

if (_mode == "DROPPED") then {
    if (player getVariable ["grad_fortifications_isColliding",true] || !(player getVariable ["grad_fortifications_isOnGround",true])) then {
        [_type,_mode] call grad_fortifications_fnc_dropFort;
    } else {
        [_type,_mode,_fortPos] call grad_fortifications_fnc_dropFort;
    };
};
