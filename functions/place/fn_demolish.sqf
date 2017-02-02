params ["_crate","_unit"];

if (isNull _crate) exitWith {};

_type = typeOf _crate;
_size = [_type] call grad_fortifications_fnc_getObjectSize;

_objDemolitionTimeAuto = 10*(_size);
_objDemolitionTime = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "demolitionTime"),"number",_objDemolitionTimeAuto] call CBA_fnc_getConfigEntry;
_demolitionTime = _objDemolitionTime * (player getVariable ["grad_fortifications_demolishTimeFactor",grad_fortifications_demolishTimeFactor]);

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
