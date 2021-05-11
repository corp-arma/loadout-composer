/* AIL_fnc_listButtonClick

Params:
	0 control: 
Return:
	
*/

#include "includes.hpp"

params ["_control"];
switch (ctrlIdc _control) do {
	case UNIFORM_LIST_BUTTON_MINUS_IDC: {[UNIFORM_LIST_IDC, -1]};
	case UNIFORM_LIST_BUTTON_PLUS_IDC: {[UNIFORM_LIST_IDC, 1]};
	case VEST_LIST_BUTTON_MINUS_IDC: {[VEST_LIST_IDC, -1]};
	case VEST_LIST_BUTTON_PLUS_IDC: {[VEST_LIST_IDC, 1]};
	case BACKPACK_LIST_BUTTON_MINUS_IDC: {[BACKPACK_LIST_IDC, -1]};
	case BACKPACK_LIST_BUTTON_PLUS_IDC: {[BACKPACK_LIST_IDC, 1]};
} params ["_listIdc", "_countMod"];
[_listIdc, _countMod] call AIL_fnc_modifyRowCount;