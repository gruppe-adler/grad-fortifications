params ["_listCtrl","_curSel"];

_type = _listCtrl lnbData [_curSel,0];
[_listCtrl,_type] call grad_fortifications_fnc_updateModel;

//save last category selection
player setVariable ["grad_fortifications_ui_lastSelectedItem", _curSel];
