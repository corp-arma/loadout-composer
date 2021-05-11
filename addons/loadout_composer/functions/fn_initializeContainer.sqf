/* AIL_fnc_initializeContainer

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
private _currentLoadout = getUnitLoadout player;
private _selectedLoadout = call AIL_fnc_selectedLoadout;
private _loadoutDiff = if (isNil "_selectedLoadout") then {
	[[getUnitLoadout player, _container] call AIL_fnc_loadoutContainerItems, [], []]
} else {
	private _strategyCtrl = switch (_container) do {
		case "uniform": {(AIL_DISPLAY displayCtrl UNIFORM_CHOICE_IDC)};
		case "vest": {(AIL_DISPLAY displayCtrl VEST_CHOICE_IDC)};
		case "backpack": {(AIL_DISPLAY displayCtrl BACKPACK_CHOICE_IDC)};
	};
	private _strategy = _strategyCtrl lbValue (lbCurSel _strategyCtrl);
	[_container, getUnitLoadout player, _selectedLoadout, _strategy] call AIL_fnc_loadoutContainerDiff;
};
[_container, _loadoutDiff] call AIL_fnc_fillContainerLnb;
[_container] call AIL_fnc_updateContainer;