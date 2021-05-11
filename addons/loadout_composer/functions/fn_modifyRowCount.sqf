/* AIL_fnc_modifyRowCount

Params:
	0 listIdc: 
	1 countMod: 
Return:
	
*/

#include "includes.hpp"

params ["_listIdc", "_countMod"];
private _list = AIL_DISPLAY displayCtrl _listIdc;
private _row = lnbCurSelRow _list;
private _type = _list lnbData [_row, COL_INDEX_TYPE];
private _diffIndex = _list lnbValue [_row, COL_INDEX_TYPE];
private _container = switch (_listIdc) do {
	case UNIFORM_LIST_IDC: {"uniform"};
	case VEST_LIST_IDC: {"vest"};
	case BACKPACK_LIST_IDC: {"backpack"};
};
[_list, _row, _type, _countMod, _diffIndex] call AIL_fnc_setLnbRow;
[_container] call AIL_fnc_updateContainer;