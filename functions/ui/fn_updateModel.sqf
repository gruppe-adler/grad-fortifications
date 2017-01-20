/*  Updates item picture
*
*/

#include "..\..\dialog\menu\defines.hpp"
disableSerialization;

params ["_listCtrl","_type"];

_dialog = findDisplay grad_fortifications_DIALOG;
if (isNull _dialog) exitWith {};

_modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;

_modelPath = getText (configfile >> "CfgVehicles" >> _type >> "model");
_modelSize = [_type] call grad_fortifications_fnc_getObjectSize;
_modelScale = 1/_modelSize * 0.65;

_modelCtrl ctrlSetModel _modelPath;
_modelCtrl ctrlSetModelScale _modelScale;

_modelCtrl ctrlCommit 0;
