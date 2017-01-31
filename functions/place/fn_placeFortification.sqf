if (player getVariable ["grad_fortifications_isColliding",true] || !(player getVariable ["grad_fortifications_isOnGround",false])) then {

    player say2d "AddItemFailed";

} else {
    [] call grad_fortifications_fnc_removeAllEHs;
    call ace_interaction_fnc_hideMouseHint;

    player forceWalk false;
    [false] call grad_fortifications_fnc_openHint;
    player setVariable ["grad_fortifications_isPlacing", false];

    _fort = player getVariable ["grad_fortifications_currentFort", objNull];
    _spawnParams = [typeOf _fort, getDir _fort, vectorUp _fort, getPosASL _fort];
    deleteVehicle _fort;
    _spawnParams remoteExec ["grad_fortifications_fnc_spawnFortification",2,false];


    if (player getVariable ["grad_fortifications_currentMode", "NORMAL"] == "NORMAL") then {
        [player,player getVariable ["grad_fortifications_currentType",""],1] call grad_fortifications_fnc_removeFort;
    };
};
