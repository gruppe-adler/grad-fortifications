private _builder = ACE_player;

[] call grad_fortifications_fnc_removeAllEHs;
[false] call grad_fortifications_fnc_openHint;
call ace_interaction_fnc_hideMouseHint;

_builder forceWalk false;

private _fort = _builder getVariable ["grad_fortifications_currentFort", objNull];
private _fortPos = getPosASL _fort;
private _fortType = typeOf _fort;

private _onPlaceCancel = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _fortType >> "onPlaceCancel"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onPlaceCancel"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;
[_builder,_fortType,_fort] call compile _onPlaceCancel;

deleteVehicle _fort;

_builder setVariable ["grad_fortifications_isPlacing", false];

_type = _builder getVariable ["grad_fortifications_currentType", ""];
_mode = _builder getVariable ["grad_fortifications_currentMode", "NORMAL"];

if (_mode == "DROPPED") then {
    if (_builder getVariable ["grad_fortifications_isColliding",true] || !(_builder getVariable ["grad_fortifications_isOnGround",true])) then {
        [_builder,_type,_mode] call grad_fortifications_fnc_dropFort;
    } else {
        [_builder,_type,_mode,_fortPos] call grad_fortifications_fnc_dropFort;
    };
};
