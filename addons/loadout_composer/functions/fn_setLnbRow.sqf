/* AIL_fnc_setLnbRow

Params:
	0 list: 
	1 row: 
	2 type: 
	3 countMod: 
	4 diffIndex: 
Return:
	
*/

#include "includes.hpp"

params ["_list", "_row", "_type", "_countMod", "_diffIndex"];
_list lnbSetText [[_row, COL_INDEX_TYPE], [_type call CBA_fnc_getItemConfig] call BIS_fnc_displayName];
_list lnbSetData [[_row, COL_INDEX_TYPE], _type];
_list lnbSetValue [[_row, COL_INDEX_TYPE], _diffIndex];
_list lnbSetColor [[_row, COL_INDEX_TYPE], [[COLOR_TEXT_CURRENT], [COLOR_TEXT_ADD], [COLOR_TEXT_MERGE]] select _diffIndex];
private _baseCount = _list lnbValue [_row, COL_INDEX_BASECOUNT];
if (_baseCount == 0) then {
	_list lnbSetText [[_row, COL_INDEX_BASECOUNT], str _countMod];
	_list lnbSetValue [[_row, COL_INDEX_BASECOUNT], _countMod];
	_baseCount = _countMod;
	_countMod = 0;
};
_list lnbSetColor [[_row, COL_INDEX_BASECOUNT], [COLOR_TEXT_LIST]];
private _currentCountMod = _list lnbValue [_row, COL_INDEX_COUNTMOD];
private _newCountMod =  (-1 * _baseCount) max (_currentCountMod + _countMod);
private _count = _baseCount + _newCountMod;
switch (true) do {
	case (_newCountMod > 0): {
		_list lnbSetText [[_row, COL_INDEX_COUNTMOD], format ["+%1", _newCountMod]];
		_list lnbSetColor [[_row, COL_INDEX_COUNTMOD], [COLOR_TEXT_COUNTMOD_POSITIVE]];
	};
	case (_newCountMod < 0): {
		_list lnbSetText [[_row, COL_INDEX_COUNTMOD], str _newCountMod];
		_list lnbSetColor [[_row, COL_INDEX_COUNTMOD], [COLOR_TEXT_COUNTMOD_NEGATIVE]];
	};
	default { 
		_list lnbSetText [[_row, COL_INDEX_COUNTMOD], "0"];
		_list lnbSetColor [[_row, COL_INDEX_COUNTMOD], [COLOR_TEXT_COUNTMOD_ZERO]];
	};
};
_list lnbSetValue [[_row, COL_INDEX_COUNTMOD], _newCountMod];
_list lnbSetText [[_row, COL_INDEX_COUNT], str _count];
_list lnbSetValue [[_row, COL_INDEX_COUNT],_count];
_list lnbSetText [[_row, COL_INDEX_LOAD], str ([_type] call AIL_fnc_itemMass)];
_list lnbSetColor [[_row, COL_INDEX_LOAD], [COLOR_TEXT_LIST]];
_list lnbSetText [[_row, COL_INDEX_TOTAL], str ([_type, _count] call AIL_fnc_itemStackLoad)];