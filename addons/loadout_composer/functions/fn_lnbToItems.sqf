/* AIL_fnc_lnbToItems

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
private _items = [];
private _listInfo = [_container] call AIL_fnc_containerLnbInfo;
_listInfo params ["_list", "_numRows", "_numCols"];
for "_row" from 0 to (_numRows - 1) do {
	private _type = _list lnbData [_row, COL_INDEX_TYPE];
	private _count = _list lnbValue [_row, COL_INDEX_COUNT];
	private _cfg = _type call CBA_fnc_getItemConfig;
	private _i = [_type, _count];
	if (_count > 0) then {
		if ((configFile >> "CfgMagazines") in (configHierarchy _cfg)) then {
			_i pushBack getNumber (_cfg >> "count");
		};
		_items pushBack _i;
	};
};
_items