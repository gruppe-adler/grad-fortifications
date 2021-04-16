params ["_fort","_owner"];

if (!hasInterface) exitWith {};
if (isNull _fort) exitWith {};

private _type = typeOf _fort;
if ([_type] call grad_fortifications_fnc_isVehicle) exitWith {};

//demolition
_canDemolish = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canDemolish"),"number",1] call CBA_fnc_getConfigEntry) == 1;
if (_canDemolish) then {
    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _action = ["grad_fortifications_demolishAction", "Demolish fortification", "", {[_this select 0, _this select 1] call grad_fortifications_fnc_demolish}, {(_this select 1) getVariable ["grad_fortifications_canDemolish", grad_fortifications_canDemolishDefault]}] call ace_interact_menu_fnc_createAction;
    [_fort, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

//pack up
_canPackUp = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canPackUp"),"number",1] call CBA_fnc_getConfigEntry) == 1;
if (_canPackup) then {
    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _condition = {
        [_this select 0, _this select 1] call grad_fortifications_fnc_isOwner &&
        (_this select 1) getVariable ["grad_fortifications_canPackUp", grad_fortifications_canPackUpDefault]
    };
    _action = ["grad_fortifications_packUpAction", "Pack up fortification", "", {[grad_fortifications_fnc_packUp,[_this select 0, _this select 1]] call CBA_fnc_execNextFrame}, _condition] call ace_interact_menu_fnc_createAction;
    [_fort, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};
