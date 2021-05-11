/* AIL_fnc_itemStackLoad

Params:
	0 type: 
	1 count: 
Return:
	
*/

#include "includes.hpp"

params ["_type", "_count"];
private _mass = [_type] call AIL_fnc_itemMass;
_mass * _count;