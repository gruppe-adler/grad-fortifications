params ["_type","_dir","_vectorUp","_posASL",["_owner",objNull]];

private _fort = createVehicle [_type, [0,0,0], [], 0, "NONE"];
_fort setDir _dir;
_fort setVectorUp _vectorUp;
_fort setPosASL _posASL;

[_fort,_owner] remoteExec ["grad_fortifications_fnc_initFort",0,true];

if !([_type] call grad_fortifications_fnc_isVehicle) then {
    switch (grad_fortifications_fortificationOwnerType) do {
        case ("BUILDER"): {
            _fort setVariable ["grad_fortifications_fortOwner",_owner,true];
        };
        case ("GROUP"): {
            _fort setVariable ["grad_fortifications_fortOwner",group _owner,true];
        };
        case ("SIDE"): {
            _fort setVariable ["grad_fortifications_fortOwner",side _owner,true];
        };
        default {
            _fort setVariable ["grad_fortifications_fortOwner",objNull,true];
        };
    };
};

private _onBuildComplete = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "onBuildComplete"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onBuildComplete"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;
[_owner,_fort] call compile _onBuildComplete;

_fort
