#include "..\..\dialog\menu\defines.hpp"

params ["_container","_caller",["_mode","PLAYER"]];

disableSerialization;
createDialog "grad_fortifications";
_dialog = findDisplay grad_fortifications_DIALOG;
_modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
_titleCtrl = _dialog displayCtrl grad_fortifications_TITLE;
_buildCtrl = _dialog displayCtrl grad_fortifications_BUILDBUTTON;
_takeCtrl = _dialog displayCtrl grad_fortifications_DROPBUTTON;

_caller setVariable ["grad_fortifications_currentContainer", _container];

if (_mode == "CONTAINER") then {
    _displayName = [configFile >> "CfgVehicles" >> (typeOf _container) >> "displayName", "text", ""] call CBA_fnc_getConfigEntry;
    _titleCtrl ctrlSetText (format ["%1 FORTIFICATIONS", toUpper _displayName]);

    _buildCtrl buttonSetAction "['DROPPED'] call grad_fortifications_fnc_doBuild; closeDialog 0";

    _takeCtrl ctrlSetText "TAKE";
    _takeCtrl buttonSetAction "_this call grad_fortifications_fnc_doTake";
};

[_container] call grad_fortifications_fnc_updateItemList;
[_modelCtrl] call grad_fortifications_fnc_rotateModel;
