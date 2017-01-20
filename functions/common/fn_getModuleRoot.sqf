/*  Finds root directory of buymenu
*
*/

_functionsPath = [(missionConfigFile >> "CfgFunctions" >> "GRAD_fortifications" >> "common" >> "file"), "text", ""] call CBA_fnc_getConfigEntry;
_functionsPathArray = _functionsPath splitString "\";
_functionsPathArray deleteAt (count _functionsPathArray - 1);
_functionsPathArray deleteAt (count _functionsPathArray - 1);
_root = _functionsPathArray joinString "\";

_root
