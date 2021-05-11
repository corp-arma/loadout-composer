/* AIL_fnc_itemsDiff

Params:
	0 items1: 
	1 items2: 
	2 strategy: 
Return:
	
*/

#include "includes.hpp"

params ["_items1", "_items2", ["_strategy", STRATEGY_MERGE]];
if (_strategy == STRATEGY_KEEP) exitWith { [_items1, [], []] };
if (_strategy == STRATEGY_REPLACE) exitWith { [[], _items2, []] };
private _onlyIn1 = +_items1;
private _onlyIn2 = [];
private _inBoth = [];
{
	private _in2 = +_x;
	private _in1Index = _onlyIn1 findIf {ITEM_TYPE(_x) == ITEM_TYPE(_in2)};
	if (_in1Index == -1) then {
		_onlyIn2 pushBack _in2;
		continue
	};
	private _in1 = _onlyIn1 select _in1Index;
	private _diff = ITEM_COUNT(_in1) - ITEM_COUNT(_in2);
	if (_diff == 0) then {
		_inBoth pushBack (_onlyIn1 deleteAt _in1Index);
		continue
	};
	if (_diff > 0) then {
		_inBoth pushBack _in2;
		_in1 set [1, _diff];
		continue
	};
	if (_diff < 0) then {
		_inBoth pushBack (_onlyIn1 deleteAt _in1Index);
		_in2 set [1, -_diff];
		_onlyIn2 pushBack  _in2;
		continue
	};
} forEach _items2;
if (_strategy == STRATEGY_ADD) then {
	_onlyIn1 append _inBoth;
	_onlyIn2 append _inBoth;
	_inBoth = [];
};
[_onlyIn1, _onlyIn2, _inBoth];