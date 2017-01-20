params ["_lines"];

_smallLines = _lines apply {[(_x select 0) vectorMultiply 0.8, (_x select 1) vectorMultiply 0.8]};

_smallLines
