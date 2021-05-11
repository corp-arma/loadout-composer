/* AIL_fnc_loadoutContainerItems

Params:
	0 loadout: 
	1 container: 
Return:
	
*/

#include "includes.hpp"

params ["_loadout", "_container"];
switch (_container) do {
	case "uniform": {UNIFORM_ITEMS(_loadout)};
	case "vest": {VEST_ITEMS(_loadout)};
	case "backpack": {BACKPACK_ITEMS(_loadout)};
	default {[]};
};