params ["_fort","_owner"];

if (!hasInterface) exitWith {};
if (isNull _fort) exitWith {};

_type = typeOf _fort;
switch (grad_fortifications_fortificationOwnerType) do {
    case ("BUILDER"): {
        _fort setVariable ["grad_fortifications_fortOwner",_owner,false];
    };
    case ("GROUP"): {
        _fort setVariable ["grad_fortifications_fortOwner",group _owner,false];
    };
    case ("SIDE"): {
        _fort setVariable ["grad_fortifications_fortOwner",side _owner,false];
    };
};

//demolition
_canDemolish = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canDemolish"),"number",1] call CBA_fnc_getConfigEntry) == 1;
if (_canDemolish) then {
    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _action = ["grad_fortifications_demolishAction", "Demolish fortification", "", {[_this select 0, _this select 1] call grad_fortifications_fnc_demolish}, {player getVariable ["grad_fortifications_canDemolish", grad_fortifications_canDemolishDefault]}] call ace_interact_menu_fnc_createAction;
    [_fort, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

//pack up
_canPackUp = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canPackUp"),"number",1] call CBA_fnc_getConfigEntry) == 1;
if (_canPackup) then {
    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _condition = {
        _fortOwner = (_this select 0) getVariable ["grad_fortifications_fortOwner",objNull];

        player getVariable ["grad_fortifications_canPackUp", grad_fortifications_canPackUpDefault] &&
        switch (typeName _fortOwner) do {
            case ("OBJECT"): {
                player == _fortOwner;
            };
            case ("GROUP"): {
                player in (units _fortOwner);
            };
            case ("SIDE"): {
                side player == _fortOwner;
            };
        };
    };
    _action = ["grad_fortifications_packUpAction", "Pack up fortification", "", {[_this select 0, _this select 1] call grad_fortifications_fnc_packUp}, _condition] call ace_interact_menu_fnc_createAction;
    [_fort, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};
