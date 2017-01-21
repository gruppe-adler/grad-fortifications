params ["_crate","_unit"];

if (isNull _crate) exitWith {};

_type = typeOf _crate;
_size = [_type] call grad_fortifications_fnc_getObjectSize;

_demolitionTime = 10 * _size * (missionNamespace getVariable ["grad_fortifications_demolishTimeFactor",1]);
_demolitionTime = [(missionConfigFile >> "CfgGradFortifications" >> _type >> "demolitionTime"),"number",_demolitionTime] call CBA_fnc_getConfigEntry;

[_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;
_onComplete = {
    _args = _this select 0;
    _args params ["_crate","_unit"];
    [_unit] call grad_fortifications_fnc_stopAnimation;
    deleteVehicle _crate;
};
_onCancel = {
    _args = _this select 0;
    _args params ["_crate","_unit"];
    [_unit] call grad_fortifications_fnc_stopAnimation;
};
[_demolitionTime, [_crate,_unit], _onComplete, _onCancel, "Demolishing..."] call ace_common_fnc_progressBar;
