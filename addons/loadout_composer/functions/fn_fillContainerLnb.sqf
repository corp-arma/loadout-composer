/* AIL_fnc_fillContainerLnb

Params:
	0 container: 
	1 loadoutDiff: 
Return:
	
*/

#include "includes.hpp"

params ["_container", "_loadoutDiff"];
private _listInfo = [_container] call AIL_fnc_containerLnbInfo;
_listInfo params ["_list", "_numRows", "_numCols"];
lnbClear _list;
{
	_x params ["_diffIndex", "_itemList"];
	{
		_x params ["_type", "_count"];
		private _row = _list lnbAddRow ["", "", "", "", "", ""];
		[_list, _row, _type, _count, _diffIndex] call AIL_fnc_setLnbRow;
	} forEach _itemList;
} forEach [
	[DIFF_INDEX_CURRENT, _loadoutDiff select DIFF_INDEX_CURRENT],
	[DIFF_INDEX_MERGE, _loadoutDiff select DIFF_INDEX_MERGE],
	[DIFF_INDEX_ADD, _loadoutDiff select DIFF_INDEX_ADD]
];