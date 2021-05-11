/* AIL_fnc_containerProgressControls

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
switch (_container) do {
	case "uniform": {UNIFORM_IDCLIST};
	case "vest": {VEST_IDCLIST};
	case "backpack": {BACKPACK_IDCLIST};
} params [
	"_overflowIdc", 
	"_addIdc", 
	"_mergeIdc", 
	"_currentIdc", 
	"_labelIdc"
];
createHashMapFromArray [
	["overflow", AIL_DISPLAY displayCtrl _overflowIdc],
	["add", AIL_DISPLAY displayCtrl _addIdc],
	["merge", AIL_DISPLAY displayCtrl _mergeIdc],
	["current", AIL_DISPLAY displayCtrl _currentIdc],
	["label", AIL_DISPLAY displayCtrl _labelIdc]
];