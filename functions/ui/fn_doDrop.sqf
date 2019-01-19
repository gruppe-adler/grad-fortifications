#include "..\..\dialog\menu\defines.hpp"

disableSerialization;
private _dialog = findDisplay grad_fortifications_DIALOG;
private _modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
private _listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;

private _curSelID = lnbCurSelRow _listCtrl;
private _type = _listCtrl lnbData [_curSelID,0];

[ACE_player,_type] call grad_fortifications_fnc_dropFort;
