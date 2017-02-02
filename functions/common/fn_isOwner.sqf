params ["_fort","_unit"];

_fortOwner = (_this select 0) getVariable ["grad_fortifications_fortOwner",objNull];

_isOwner = switch (typeName _fortOwner) do {
    case ("OBJECT"): {
        _unit == _fortOwner;
    };
    case ("GROUP"): {
        _unit in (units _fortOwner);
    };
    case ("SIDE"): {
        side _unit == _fortOwner;
    };
};

_isOwner
