/* AIL_fnc_containerLnbInfo

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
private _list = switch (_container) do {
	case "uniform": {AIL_DISPLAY displayCtrl UNIFORM_LIST_IDC};
	case "vest": {AIL_DISPLAY displayCtrl VEST_LIST_IDC};
	case "backpack": {AIL_DISPLAY displayCtrl BACKPACK_LIST_IDC};
};
(lnbSize _list) params ["_numRows", "_numCols"];
[_list, _numRows, _numCols]