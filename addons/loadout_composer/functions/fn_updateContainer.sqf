/* AIL_fnc_updateContainer

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
private _loadoutDiff = [_container] call AIL_fnc_lnbToDiff;
private _containerMaxLoad = call compile format ["getContainerMaxLoad %1 player", _container];
private _controls = [_container] call AIL_fnc_containerProgressControls;
private _loads = _loadoutDiff apply {[_x] call AIL_fnc_itemsLoad};
_loads params ["_current", "_add", "_merge"];
private _totalLoad = _current + _merge + _add;
private _overflow = _totalLoad - _containerMaxLoad;
_merge = _merge - (0 max _overflow);
private _ratios = [_current ,_merge ,_add, _overflow] apply {_x / (_containerMaxLoad max _totalLoad)};
_ratios params ["_currentRatio" ,"_mergeRatio" ,"_addRatio", "_overflowRatio"];
(_controls get "add") progressSetPosition _currentRatio + _mergeRatio + _addRatio;
(_controls get "merge") progressSetPosition _currentRatio + _mergeRatio;
(_controls get "current") progressSetPosition _currentRatio;
(_controls get "label") ctrlSetText format [
	"%1 %2/%3",
	(format ["STR_AIL_%1", toUpper _container]) call BIS_fnc_localize,
	(_current + _merge + _add + _overflow),
	_containerMaxLoad
];
if (_overflow > 0) then {
	(_controls get "overflow") progressSetPosition 1;
	(_controls get "label") ctrlSetTextColor [COLOR_TEXT_OVERFLOW];
} else {
	(_controls get "overflow") progressSetPosition 0;
	(_controls get "label") ctrlSetTextColor [COLOR_WHITE ];
};
call AIL_fnc_setLoadButtonState;