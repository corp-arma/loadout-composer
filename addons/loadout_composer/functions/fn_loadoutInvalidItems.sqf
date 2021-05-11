/* AIL_fnc_loadoutInvalidItems

Params:
	0 loadout: 
Return:
	
*/

#include "includes.hpp"

params ["_loadout"];
(UNIFORM_ITEMS(_loadout) + VEST_ITEMS(_loadout) + BACKPACK_ITEMS(_loadout)) select {
	isNull (ITEM_TYPE(_x) call CBA_fnc_getItemConfig);
};