params [["_builder",objNull]];

_doPlace = {
    params ["_args"];
    _args params ["_builder","_anim"];

    _builder forceWalk false;
    [false] call grad_fortifications_fnc_openHint;
    _builder setVariable ["grad_fortifications_isPlacing", false];

    _fort = _builder getVariable ["grad_fortifications_currentFort", objNull];
    _spawnParams = [typeOf _fort, getDir _fort, vectorUp _fort, getPosASL _fort, _builder];
    deleteVehicle _fort;
    _spawnParams remoteExec ["grad_fortifications_fnc_spawnFortification",2,false];

    if (_builder getVariable ["grad_fortifications_currentMode", "NORMAL"] == "NORMAL") then {
        [_builder,_builder getVariable ["grad_fortifications_currentType",""],1] call grad_fortifications_fnc_removeFort;
    };
    if (_anim) then {
        [_builder] call grad_fortifications_fnc_stopAnimation;
    };
};


if (_builder getVariable ["grad_fortifications_isColliding",true] || !(_builder getVariable ["grad_fortifications_isOnGround",false]) || (_builder getVariable ["grad_fortifications_isOnRoad",false]) || !(_builder getVariable ["grad_fortifications_isCustomCondition",false])) then {
    playSound "AddItemFailed";

} else {
    [] call grad_fortifications_fnc_removeAllEHs;
    [] call ace_interaction_fnc_hideMouseHint;

    _currentType = typeOf (_builder getVariable ["grad_fortifications_currentFort", objNull]);

    _objBuildTimeAuto = 3*([_currentType] call grad_fortifications_fnc_getObjectSize);
    _objBuildTime = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _currentType >> "buildTime"),"number",_objBuildTimeAuto] call CBA_fnc_getConfigEntry;
    _buildTime = _objBuildTime * (_builder getVariable ["grad_fortifications_buildTimeFactor",grad_fortifications_buildTimeFactor]);

    if ([_currentType] call grad_fortifications_fnc_isVehicle) then {_buildTime = 0};

    _onBuildStart = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _currentType >> "onBuildStart"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onBuildStart"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;
    [_builder,_currentType,_builder getVariable ["grad_fortifications_currentFort", objNull]] call compile _onBuildStart;

    if (_buildTime < 1) then {
        [_builder,false] call _doPlace;
    } else {
        [_builder,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;
        [
            _buildTime,
            [_builder,true],
            _doPlace,
            {(_this select 0) call grad_fortifications_fnc_stopAnimation; [] call grad_fortifications_fnc_cancelPlacement},
            "Placing..."
        ] call ace_common_fnc_progressBar;
    };
};
