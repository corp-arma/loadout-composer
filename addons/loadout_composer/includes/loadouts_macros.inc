#define UNIFORM(LOADOUT) (LOADOUT select 3)
#define VEST(LOADOUT) (LOADOUT select 4)
#define BACKPACK(LOADOUT) (LOADOUT select 5)

#define CONTAINER_TYPE 0
#define CONTAINER_ITEMS 1

#define UNIFORM_TYPE(LOADOUT) (UNIFORM(LOADOUT) select CONTAINER_TYPE)
#define UNIFORM_ITEMS(LOADOUT) (UNIFORM(LOADOUT) select CONTAINER_ITEMS)
#define VEST_TYPE(LOADOUT) (VEST(LOADOUT) select CONTAINER_TYPE)
#define VEST_ITEMS(LOADOUT) (VEST(LOADOUT) select CONTAINER_ITEMS)
#define BACKPACK_TYPE(LOADOUT) (BACKPACK(LOADOUT) select CONTAINER_TYPE)
#define BACKPACK_ITEMS(LOADOUT) (BACKPACK(LOADOUT) select CONTAINER_ITEMS)

#define ITEM_TYPE(ITEM) (ITEM select 0)
#define ITEM_COUNT(ITEM) (ITEM select 1)
#define ITEM_AMMO(ITEM) (ITEM select 2)

#define DIFF_INDEX_CURRENT 0
#define DIFF_INDEX_ADD 1
#define DIFF_INDEX_MERGE 2

#define STRATEGY_KEEP 0
#define STRATEGY_REPLACE 1
#define STRATEGY_MERGE 2
#define STRATEGY_ADD 3


/* LOADOUT STRUCTURE:

	[
		"arifle_MX_GL_F","muzzle_snds_H", "acc_pointer_IR", "optic_Aco",	// Primary weapon, (weapon items) silencer, pointer, optic
		["30Rnd_65x39_caseless_mag", 30],									// Loaded mag in primary muzzle, ammo count
		["1Rnd_HE_Grenade_shell", 1],										// Loaded mag in secondary muzzle, ammo count
		""	// Bipod
	],
	[],	// Secondary weapon info (see primary above)
	[	// handGun info (see primary above)
		"hgun_P07_F", "", "", "",
		["16Rnd_9x21_Mag", 16],
		[],
		""
	],
	[	// Uniform
		"U_B_CombatUniform_mcam", // Uniform Type
		[	// Uniform Items
			["FirstAidKit", 1],	// Type, count
			["30Rnd_65x39_caseless_mag", 30, 2]
		]	// Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
	],
	[	// Vest Info
		"V_PlateCarrierGL_rgr",	// Vest Type
		[	// Vest Items
			["30Rnd_65x39_caseless_mag", 30, 3]
		]
	],
	[],	// Backpack Info (follows same layout as above for Uniform and Vest)
	"H_HelmetSpecB_blk",					// Helmet
	"G_Tactical_Clear",						//Facewear glasses/bandanna etc
	["Binocular", "", "", "", [], [], ""],	// Weapon Binocular (follows same layout as other weapons above)
	["ItemMap", "ItemGPS", "ItemRadio", "ItemCompass", "ItemWatch", "NVGoggles"]	// AssignedItems ItemGPS can also be a UAV Terminal
]*/