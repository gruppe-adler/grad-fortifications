_doPlace = {
    params ["_anim"];

    player forceWalk false;
    [false] call grad_fortifications_fnc_openHint;
    player setVariable ["grad_fortifications_isPlacing", false];

    _fort = player getVariable ["grad_fortifications_currentFort", objNull];
    _spawnParams = [typeOf _fort, getDir _fort, vectorUp _fort, getPosASL _fort, player];
    deleteVehicle _fort;
    _spawnParams remoteExec ["grad_fortifications_fnc_spawnFortification",2,false];

    if (player getVariable ["grad_fortifications_currentMode", "NORMAL"] == "NORMAL") then {
        [player,player getVariable ["grad_fortifications_currentType",""],1] call grad_fortifications_fnc_removeFort;
    };
    if (_anim) then {
        [player] call grad_fortifications_fnc_stopAnimation;
    };
};


if (player getVariable ["grad_fortifications_isColliding",true] || !(player getVariable ["grad_fortifications_isOnGround",false]) || (player getVariable ["grad_fortifications_isOnRoad",false]) || !(player getVariable ["grad_fortifications_isCustomCondition",false])) then {
    player say2d "AddItemFailed";

} else {
    [] call grad_fortifications_fnc_removeAllEHs;
    [] call ace_interaction_fnc_hideMouseHint;

    _currentType = typeOf (player getVariable ["grad_fortifications_currentFort", objNull]);

    _objBuildTimeAuto = 3*([_currentType] call grad_fortifications_fnc_getObjectSize);
    _objBuildTime = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _currentType >> "buildTime"),"number",_objBuildTimeAuto] call CBA_fnc_getConfigEntry;
    _buildTime = _objBuildTime * (player getVariable ["grad_fortifications_buildTimeFactor",grad_fortifications_buildTimeFactor]);

    if ([_currentType] call grad_fortifications_fnc_isVehicle) then {_buildTime = 0};

    _onBuildStart = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _currentType >> "onBuildStart"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onBuildStart"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;
    [player,_currentType,player getVariable ["grad_fortifications_currentFort", objNull]] call compile _onBuildStart;

    if (_buildTime < 1) then {
        [false] call _doPlace;
    } else {
        [player,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;
        [_buildTime, true, _doPlace, {[player] call grad_fortifications_fnc_stopAnimation; [] call grad_fortifications_fnc_cancelPlacement}, "Placing..."] call ace_common_fnc_progressBar;
    };
};
