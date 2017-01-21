params ["_fort"];

if (isNull _fort) exitWith {};

_fort hideObject false;
_fort allowDamage true;
_fort enableCollisionWith player;
_type = typeOf _fort;


//demolition
_canDemolish = ([(missionConfigFile >> "CfgGradFortifications" >> _type >> "canDemolish"),"number",1] call CBA_fnc_getConfigEntry) == 1;
if (_canDemolish) then {
    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _action = ["grad_fortifications_demolishAction", "Demolish fortification", "", {[_this select 0, _this select 1] call grad_fortifications_fnc_demolish}, {player getVariable ["grad_fortifications_canDemolish", grad_fortifications_canDemolishDefault]}] call ace_interact_menu_fnc_createAction;
    [_fort, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};
