if (player getVariable ["grad_fortifications_isColliding",true] || !(player getVariable ["grad_fortifications_isOnGround",false])) then {
    player say2d "AddItemFailed";
} else {
    [] call grad_fortifications_fnc_removeAllEHs;
    if (player getVariable ["grad_fortifications_currentMode", "NORMAL"] == "NORMAL") then {
        [player,player getVariable ["grad_fortifications_currentType",""],1] call grad_fortifications_fnc_removeFort;
    };
};
