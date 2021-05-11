/* AIL_fnc_selectStrategy

Params:
	0 control: 
	1 selectedIndex: 
Return:
	
*/

#include "includes.hpp"

params ["_control", "_selectedIndex"];
private _container = switch (ctrlIdc _control) do {
	case UNIFORM_CHOICE_IDC: {"uniform"};
	case VEST_CHOICE_IDC: {"vest"};
	case BACKPACK_CHOICE_IDC: {"backpack"};
};
[_container] call AIL_fnc_initializeContainer;