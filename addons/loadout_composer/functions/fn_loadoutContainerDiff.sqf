/* AIL_fnc_loadoutContainerDiff

Params:
	0 container: 
	1 loadout1: 
	2 loadout2: 
	3 strategy: 
Return:
	
*/

#include "includes.hpp"

params ["_container", "_loadout1", "_loadout2", "_strategy"];
private _items1 = [_loadout1, _container] call AIL_fnc_loadoutContainerItems;
private _items2 = [_loadout2, _container] call AIL_fnc_loadoutContainerItems;
[_items1, _items2, _strategy] call AIL_fnc_itemsDiff;