if (player getVariable ["grad_fortifications_isColliding",true] || !(player getVariable ["grad_fortifications_isOnGround",false])) then {

    player say2d "AddItemFailed";

} else {
    [] call grad_fortifications_fnc_removeAllEHs;
    call ace_interaction_fnc_hideMouseHint;
    [player,player getVariable ["grad_fortifications_currentFort", objNull],true] remoteExec ["grad_fortifications_fnc_hideObjectClients",0,false];
    player forceWalk false;
    [false] call grad_fortifications_fnc_openHint;
    player setVariable ["grad_fortifications_isPlacing", false];

    if (player getVariable ["grad_fortifications_currentMode", "NORMAL"] == "NORMAL") then {
        [player,player getVariable ["grad_fortifications_currentType",""],1] call grad_fortifications_fnc_removeFort;
    };

    if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
        (player getVariable ["grad_fortifications_currentFort", objNull]) hideObjectGlobal false;
    };
};
