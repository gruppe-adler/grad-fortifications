private _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

private _condition = {
    params [["_vehicle",objNull],["_unit",objNull]];

    alive _vehicle &&
    {!(locked _vehicle in [2,3])} &&
    {isNull (objectParent _unit)} &&
    {!(_vehicle getVariable ["ace_cookoff_isCookingOff",false])} &&
    {!(_unit getVariable ["grad_fortifications_isPlacing", false])} &&
    {
        [
            missionConfigFile >> "CfgGradFortifications" >> "Vehicles" >> typeOf _vehicle,
            "isStorage",
            [0,1] select ([configFile >> "CfgVehicles" >> typeOf (_vehicle),"maximumLoad",-1] call BIS_fnc_returnConfigEntry > 0)
        ] call BIS_fnc_returnConfigEntry > 0
    } &&
    {
        (count (((_this select 0) getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0) ||
        (count (((_this select 1) getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0)
    }
};

private _onActivate = {
    [grad_fortifications_fnc_loadVehicleDialog,[_this select 0, _this select 1]] call CBA_fnc_execNextFrame;
};

_action = ["grad_fortifications_containerBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa",_onActivate,_condition] call ace_interact_menu_fnc_createAction;

_action
