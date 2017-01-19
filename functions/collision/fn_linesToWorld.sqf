params ["_lines","_fort"];

_linesCopy = +_lines;
_linesWorld = _linesCopy apply {[_fort modelToWorld (_x select 0),_fort modelToWorld (_x select 1)]};

_linesWorld
