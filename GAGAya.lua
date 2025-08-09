getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 120, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 200,
		["Destroy Until"] = 280,

		["Safe Tree"] = {
			"Moon Blossom",
			"Fossilight",
		}
	},

	Seed = {
		Buy = {
			Mode = "Auto", -- Custom , Auto
			Custom = { -- any fruit u need to place
				"Carrot",
			}
		},
		Place = {
			Mode = "Lock", -- Select , Lock
			Select = {
				"Carrot"
			},
			Lock = {
				"Maple Apple",
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
				"Moon Melon",
				"Easter Egg",
				"Moon Mango",
				"Bone Blossom",
				"Fossilight",
			}
		}
	},

	["Seed Pack"] = {
		Locked = {

		}
	},

	Events = {
		["Cook Event"] = {
			Minimum_Money = 30_000_000,          -- minimum money to start play this event
			Rewards_Item = {   -- The top is the most top mean prefered.
				"Gorilla Chef",
				"Gourmet Egg",
				"Culinarian Chest",
				"Gourmet Seed Pack",
			}
		},
		["Traveling Shop"] = {
			"Bee Egg",
		},
		Craft = {
			"Anti Bee Egg",
		},
		Shop = {
			"Zen Egg",
			"Zen Seed Pack",
			"Spiked Mango",
			"Pet Shard Tranquil",
			"Pet Shard Corrupted",
			"Koi",
			"Soft Sunshine",
			"Sakura Bush",
			"Raiju",
		},
		Start_Do_Honey = 2_000_000             -- start trade fruit for honey at money
	},

	Gear = {
		Buy = {
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Level Up Lollipop",
			"Medium Treat",
			"Medium Toy",
		},
		Lock = {
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
		},
	},

	Eggs = {
		Place = {
			"Gourmet Egg",
			"Zen Egg",
			"Primal Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Bug Egg",
			"Paradise Egg",
			"Bee Egg",
			"Rare Summer Egg",
			"Mythical Egg",
			"Common Egg",
		},
		Buy = {
			"Bee Egg",
			"Oasis Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Rare Summer Egg",
			"Bug Egg",
			"Mythical Egg",
			"Common Egg",
		}
	},

	Pets = {
		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
				["Starfish"] = { 8, 75, 1 },
			},
			["Limit Upgrade"] = 2,      -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Gorilla Chef"] = { 3, 75, 1 },
				-- ["Tanchozuru"] = { 5, 100, 1 }, -- 5 on the first mean equip only 5 | pet , 100 mean equip only level pet lower than 100 | the one on the last is priority it will ues first if possible
				["Ostrich"] = { 3, 75, 2 },
				["Blood Kiwi"] = { 8, 75 },
				["Seal"] = { 8, 75 },
				["Rooster"] = { 8, 75 },
				["Starfish"] = { 5, 75 },
			},
		},
		Favorite_LockedPet = true,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"French Fry Ferret",
			"Spaghetti Sloth",
			"Corrupted Kitsune",
			"Kitsune",
			"Disco Bee",
			"Butterfly",
			"Queen Bee",
			"Dragonfly",
			"Raccoon",
			"Red Fox",
			"Mimic Octopus",
			"Brontosaurus",
			"Dilophosaurus",
			"Ankylosaurus",
			"Spinosaurus",
			"T-Rex",
			"Corrupted Kodama",
			["Mochi Mouse"] = 3,
			["Tarantula Hawk"] = 2,
			["Bald Eagle"] = 5,
			["Moon Cat"] = 10,
			["Chicken"] = 2,
			["Rooster"] = 2,
			["Blood Kiwi"] = 5,
			["Ostrich"] = 5,
			["Kappa"] = 5,
			["Capybara"] = 5,
			["Praying Mantis"] = 5,
			["Starfish"] = 10,
			["Nihonzaru"] = 5,
			["Triceratops"] = 5,
			["Bee"] = 3,
		},
		LockPet_Weight = 5, -- if Weight >= 10 they will locked
	},

	Webhook = {
		UrlPet =
		"https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS",
		UrlSeed = "",
		PcName = "PC",

		Noti = {
			Seeds = {
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
				"Honeysuckle",
				"Bone Blossom",
				"Fossilight",

			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Kitsune",
				"French Fry Ferret",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "O0ckL79tK6KwnmX2uanEfo7bosg2uYQt"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
--https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS
