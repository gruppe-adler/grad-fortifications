#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_container","_caller"];

_caller setVariable ["grad_fortifications_currentContainer", _container];

disableSerialization;
createDialog "grad_fortifications_vehicle";
private _dialog = findDisplay grad_fortifications_DIALOG;
private _modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
private _listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;

[_container] call grad_fortifications_fnc_updateItemList;
[_caller,true] call grad_fortifications_fnc_updateListTitles;
