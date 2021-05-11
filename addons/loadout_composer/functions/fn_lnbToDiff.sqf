/* AIL_fnc_lnbToDiff

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
private _loadoutDiff = [[], [], []];
private _listInfo = [_container] call AIL_fnc_containerLnbInfo;
_listInfo params ["_list", "_numRows", "_numCols"];
for "_row" from 0 to (_numRows - 1) do {
	private _type = _list lnbData [_row, COL_INDEX_TYPE];
	private _diffIndex = _list lnbValue [_row, COL_INDEX_TYPE];
	private _count = _list lnbValue [_row, COL_INDEX_COUNT];
	(_loadoutDiff select _diffIndex) pushBack [_type, _count];
};
_loadoutDiff