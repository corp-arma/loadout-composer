/* AIL_fnc_loadoutContainerLoad

Params:
	0 loadout: 
	1 container: 
Return:
	
*/

#include "includes.hpp"

params ["_loadout", "_container"];
private _items = _this call AIL_fnc_loadoutContainerItems;
[_items] call AIL_fnc_itemsLoad;