#include "..\..\dialog\menu\defines.hpp"

disableSerialization;
private _dialog = findDisplay grad_fortifications_DIALOG;
private _modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
private _listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;

private _builder = ACE_player;

private _curSelID = lnbCurSelRow _listCtrl;
private _type = _listCtrl lnbData [_curSelID,0];
private _container = _builder getVariable ["grad_fortifications_currentContainer", objNull];

[_container,_type] call grad_fortifications_fnc_removeFort;
[_builder,_type] call grad_fortifications_fnc_addFort;
[_container] call grad_fortifications_fnc_updateItemList;
