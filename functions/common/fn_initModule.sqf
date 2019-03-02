if (hasInterface) then {

    [] call grad_fortifications_fnc_addVehicleInteractions;
    private _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    private _action = ["grad_fortifications_mainBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa", {
        [grad_fortifications_fnc_loadFortDialog,[_this select 0, _this select 1]] call CBA_fnc_execNextFrame
    },{
        params ["","_unit"];
        isNull (objectParent _unit) &&
        {count ((_unit getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0} &&
        {!(_unit getVariable ["grad_fortifications_isPlacing", false])}
    }] call ace_interact_menu_fnc_createAction;

    ["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
