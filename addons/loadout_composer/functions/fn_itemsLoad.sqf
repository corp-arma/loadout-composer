/* AIL_fnc_itemsLoad

Params:
	0 items: 
Return:
	
*/

#include "includes.hpp"

params ["_items"];
private _load = 0;
{
	_load = _load + (_x call AIL_fnc_itemStackLoad);
} forEach _items;
_load