#include "gui_grid.inc"
#include "gui_styles.inc"
#include "gui_ids.inc"
#include "loadouts_macros.inc"

class RscBackground;
class RscButton;
class RscControlsGroupNoScrollbars;
class RscListBox;
class RscListNBox;
class RscProgress;
class RscStructuredText;
class RscFrame;
class RscText;
class RscToolbox;
class ctrlButton;
class ctrlStaticBackground;
class ctrlStaticTitle;

class AIL_progressBackground: RscBackground {
	x = 0; 
	y = 1 * LINE_H + 2 * GRID_H;
	w = PANEL_W;
	h = LINE_H;
	colorBackground[] = {COLOR_PROGRESS_BG};
};

class AIL_progressFrame: RscFrame {
	idc = -1;
	x = 0;
	y = 1 * LINE_H + 2 * GRID_H;
	w = PANEL_W;
	h = LINE_H;
	colorText[] = {0,0,0,1};
};

class AIL_containerGroup: RscControlsGroupNoScrollbars {
	w = PANEL_W;
	h = CONTAINER_PANEL_H;
};

class AIL_progress: RscProgress {
	x = 0; 
	y = 1 * LINE_H + 2 * GRID_H;
	w = PANEL_W;
	h = LINE_H;
};
class AIL_progressOverflow: AIL_progress { colorBar[] = {COLOR_PROGRESS_OVERFLOW}; };
class AIL_progressAdd: AIL_progress { colorBar[] = {COLOR_PROGRESS_ADD}; };
class AIL_progressMerge: AIL_progress { colorBar[] = {COLOR_PROGRESS_MERGE}; };
class AIL_progressCurrent: AIL_progress { colorBar[] = {COLOR_PROGRESS_CURRENT}; };

class AIL_button: RscButton
{
	w = GRID_CELL_W;
	h = GRID_CELL_H;
	color[] = {COLOR_BUTTON_TEXT};
};

class AIL_listButton: RscButton {
	x = -1; y = -1; w = -1; h = -1;
	onButtonClick = "_this call AIL_fnc_listButtonClick";
};
class AIL_listButtonMinus: AIL_listButton { text = "-"; };
class AIL_listButtonPlus: AIL_listButton { text = "+"; };

class AIL_itemList: RscListNBox {
	x = 0;
	y = (2 * LINE_H) + (3 * GRID_H);
	w = PANEL_W;
	h = 11 * LINE_H;
	columns[] = {LIST_COL_POSITIONS};
	sizeEx = LINE_H;
	rowHeight = LINE_H;
	colorSelect[] = {COLOR_LIST_SELECT};
	colorSelect2[] = {COLOR_LIST_SELECT};
	colorSelectBackground[] = {COLOR_TRANSPARENT};
	colorSelectBackground2[] = {COLOR_TRANSPARENT};
	colorBackground[] = {0,0,0,0.3};
};

class AIL_text: RscText {
	idc = -1;
	x = 0; 
	y = GRID_H;
	w = PANEL_W;
	h = LINE_H;
	sizeEx = LINE_H;
	colorBackground[] = {0,0,0,0.3};
};

class AIL_choice: RscToolbox {
	idc = CHOICE_IDENTICAL_IDC;
	x = PANEL_W - (80 * GRID_W);
	y = GRID_H;
	w = 80 * GRID_W;
	h = LINE_H;
	sizeEx = LINE_H;
	rows = 1;
	columns = 4;
	strings[] = {"$STR_AIL_KEEP","$STR_AIL_REPLACE","$STR_AIL_MERGE","$STR_AIL_ADD"};
	checked_strings[] = {"$STR_AIL_KEEP","$STR_AIL_REPLACE","$STR_AIL_MERGE","$STR_AIL_ADD"};
	values[] = {STRATEGY_KEEP, STRATEGY_REPLACE, STRATEGY_MERGE, STRATEGY_ADD};
	onLoad = "(_this select 0) lbSetCurSel 2";
	onToolBoxSelChanged = "_this call AIL_fnc_selectStrategy";
};

class AIL_buttonShow: ctrlButton {
	idc = -1;
	x = safezoneW + safezoneX - 79 * GRID_W;
	y = safezoneH + safezoneY - 9 * GRID_H;
	w = 45 * GRID_W;
	h = 7 * GRID_H;
	sizeEx = LINE_H;
	text =  "$STR_AIL_TITLE";
	shortcuts[]= {"0x01"};
	tooltip= "";
	onButtonClick = "_this call AIL_fnc_openAIL";
};

class AIL_panel: RscControlsGroupNoScrollbars {
	idc = -1;
	x = safezoneW + safezoneX - (300 * GRID_W) - WIDTH_GAP;
	y = safezoneY + (LINE_H);
	w = PANEL_W;
	h = safezoneH - (34 * GRID_H);
	class Controls {
		class frame: RscFrame {
			idc = -1;
			x = 0;
			y = 0;
			w = PANEL_W;
			h = PANEL_H;
			colorText[] = {0,0,0,1};
		};
		class background: ctrlStaticBackground {
			idc = -1;
			x = 0;
			y = 0;
			w = PANEL_W;
			h = PANEL_H;
			colorBackground[] = {0.13,0.13,0.13,0.9};
		};
		class title: ctrlStaticTitle {
            style = 0x02; // ST_CENTER
			x = 0;
			y = 0;
			w = PANEL_W;
			h = LINE_H;
            sizeEx = LINE_H;
			text = "$STR_AIL_TITLE";
		};
		class uniformGroup: AIL_containerGroup {
			y = LINE_H;
			class Controls {
				class label: AIL_text {
					idc = UNIFORM_LABEL_IDC;
				};
				class choice: AIL_choice {
					idc = UNIFORM_CHOICE_IDC;
				};
				class list: AIL_itemList {
					idc = UNIFORM_LIST_IDC;
					idcLeft = UNIFORM_LIST_BUTTON_MINUS_IDC;
					idcRight = UNIFORM_LIST_BUTTON_PLUS_IDC;
				};
				class background: AIL_progressBackground {};
				class overflow: AIL_progressOverflow {idc = UNIFORM_OVERFLOW_IDC; };
				class add: AIL_progressAdd {idc = UNIFORM_ADD_IDC; };
				class merge: AIL_progressMerge {idc = UNIFORM_MERGE_IDC; };
				class current: AIL_progressCurrent {idc = UNIFORM_CURRENT_IDC; };
				class frame: AIL_progressFrame {};
				class listButtonMinus: AIL_listButtonMinus { idc = UNIFORM_LIST_BUTTON_MINUS_IDC; };
				class listButtonPlus: AIL_listButtonPlus { idc = UNIFORM_LIST_BUTTON_PLUS_IDC; };
			};
		};
		class vestGroup: AIL_containerGroup {
			y = LINE_H + CONTAINER_PANEL_H;
			class Controls {
				class label: AIL_text {
					idc = VEST_LABEL_IDC;
				};
				class choice: AIL_choice {
					idc = VEST_CHOICE_IDC;
				};
				class list: AIL_itemList {
					idc = VEST_LIST_IDC;
					idcLeft = VEST_LIST_BUTTON_MINUS_IDC;
					idcRight = VEST_LIST_BUTTON_PLUS_IDC;
				};
				class background: AIL_progressBackground {};
				class overflow: AIL_progressOverflow { idc = VEST_OVERFLOW_IDC; };
				class add: AIL_progressAdd { idc = VEST_ADD_IDC; };
				class merge: AIL_progressMerge { idc = VEST_MERGE_IDC; };
				class current: AIL_progressCurrent { idc = VEST_CURRENT_IDC; };
				class frame: AIL_progressFrame {};
				class listButtonMinus: AIL_listButtonMinus { idc = VEST_LIST_BUTTON_MINUS_IDC; };
				class listButtonPlus: AIL_listButtonPlus { idc = VEST_LIST_BUTTON_PLUS_IDC; };
			};
		};
		class backpackGroup: AIL_containerGroup {
			y = LINE_H + (2 * CONTAINER_PANEL_H);
			class Controls {
				class label: AIL_text {
					idc = BACKPACK_LABEL_IDC;
				};
				class choice: AIL_choice {
					idc = BACKPACK_CHOICE_IDC;
				};
				class list: AIL_itemList {
					idc = BACKPACK_LIST_IDC;
					idcLeft = BACKPACK_LIST_BUTTON_MINUS_IDC;
					idcRight = BACKPACK_LIST_BUTTON_PLUS_IDC;
				};
				class background: AIL_progressBackground {};
				class overflow: AIL_progressOverflow {idc = BACKPACK_OVERFLOW_IDC; };
				class add: AIL_progressAdd { idc = BACKPACK_ADD_IDC; };
				class merge: AIL_progressMerge { idc = BACKPACK_MERGE_IDC; };
				class current: AIL_progressCurrent { idc = BACKPACK_CURRENT_IDC; };
				class frame: AIL_progressFrame {};
				class listButtonMinus: AIL_listButtonMinus { idc = BACKPACK_LIST_BUTTON_MINUS_IDC; };
				class listButtonPlus: AIL_listButtonPlus { idc = BACKPACK_LIST_BUTTON_PLUS_IDC; };
			};
		};
	};
};
