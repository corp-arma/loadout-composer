/* AIL_fnc_containerLoadInfo

Params:
	0 container: 
Return:
	
*/

#include "includes.hpp"

params ["_container"];
private _items = [_container] call AIL_fnc_lnbToItems;
private _containerMaxLoad = call compile format ["getContainerMaxLoad %1 player", _container];
[[_items] call AIL_fnc_itemsLoad, _containerMaxLoad]