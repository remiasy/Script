setfpscap(5)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 300, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 250,
		["Destroy Until"] = 250,

		["Safe Tree"] = {
			"Moon Blossom",
			"Bone Blossom",
			"Moon Melon",
			"Maple Apple",
			"Moon Mango",
			"Dragon Pepper",
			"Elephant Ears",
			"Fossilight",
			"Princess Thorn",
			-- for the event
			["Blueberry"] = 15,
			["Strawberry"] = 15,
			["Apple"] = 15,
			["Coconut"] = 15,
			["Dragon Fruit"] = 15,
			["Mango"] = 15,
			["Tomato"] = 20,
			["Cactus"] = 15,
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
		["Bean Event"] = {
			Minimum_Money = 10000000000, -- minimum money to start play this event
		},
		MaxMoney_Restocks = 10000000000,
		Shop = { -- un comment to buy
			"Sprout Seed Pack",
			"Sprout Egg",
			-- "Mandrake",
			"Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			["Spriggan"] = 8,
			-- Friend Shop
			"Skyroot Chest",
			"Pet Shard GiantBean",
		},
		["Traveling Shop"] = {
			"Bee Egg",
		},
		Craft = {
			"Anti Bee Egg",
			"Pet Shard GiantBean",
			"Sprout Egg",
		},
		Start_Do_Honey = 2000000 -- start trade fruit for honey at money
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
			"Sprout Egg",
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
			--"Rare Summer Egg",
			"Mythical Egg",
			"Rare Egg",
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
			"Rare Egg",
			"Uncommon Egg",
			"Common Egg",
		}
	},

	Pets = {
		["Auto Feed"] = true,

		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
				--["Bacon Pig"] = { 8, 75, 1 },
				["Starfish"] = { 8, 75, 1 },
				["Chicken"] = { 8, 75, 2 },
				["Rooster"] = { 8, 75, 3 },
			},
			["Limit Upgrade"] = 5, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Tarantula Hawk"] = { 2, 101, 1 },
				--["Gorilla Chef"] = { 8, 101, 1 },
				--["Bacon Pig"] = { 8, 101, 2 },
				--["Tanchozuru"] = { 8, 101, 3 },
				--["Kappa"] = { 8, 101, 4 },
				--["Spaghetti Sloth"] = { 8, 101, 5 },
				--["Corrupted Kodama"] = { 8, 101, 6 },
				--["Kodama"] = { 8, 101, 7 },
				["Blood Kiwi"] = { 8, 101, 2 },
				["Rooster"] = { 8, 101, 3 },
				["Sunny-Side Chicken"] = { 1, 101, 4 },
				["Chicken"] = { 8, 101, 5 },
				["Starfish"] = { 8, 75, 6 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = true,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Griffin",
			"Golden Goose",
			"Golem",
			"French Fry Ferret",
			"Spaghetti Sloth",
			"Corrupted Kitsune",
			"Raiju",
			"Koi",
			"Tanuki",
			"Tanchozuru",
			"Kappa",
			"Kitsune",
			"Dilophosaurus",
			"Moon Cat",
			"Capybara",
			"Spinosaurus",
			"Bear Bee",
			"T-Rex",
			"Brontosaurus",
			"Disco Bee",
			"Butterfly",
			"Queen Bee",
			"Dragonfly",
			"Raccoon",
			"Fennec Fox",
			"Mimic Octopus",
			"Red Fox",
			"Blood Owl",
			"Chicken Zombie",
			["Starfish"] = 10,
		},
		LockPet_Weight = 7, -- if Weight >= 10 they will locked
		Ignore_Pet_Weight = {
			"NAME oF PET THAT U DONT NEED LOCK",
		},
		Instant_Sell = {
			"NAME oF SOMETHING",
		}
	},

	Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS",
		UrlSeed = "",
		PcName = "RemiaLOVEPream",
		
		Noti = {
			Seeds = {
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
				"Honeysuckle",
				"Bone Blossom",
				"Fossilight",
				"Maple Apple",
				"Grand Tomato",
				"Cyclamen",
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Disco Bee",
				"Butterfly",
				"Mimic Octopus",
				"Queen Bee",
				"Dragonfly",
				"Raccoon",
				"Red Fox",
				"Fennec Fox",
				"Bald Eagle",
				"T-Rex",
				"Brontosaurus",
				"Spinosaurus",
				"Dilophosaurus",
				"Ankylosaurus",
				"Kitsune",
				"Corrupted Kitsune",
				"Raiju",
				"French Fry Ferret",
				"Lobster Thermidor",
				"Golden Goose",
				"Griffin",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "O0ckL79tK6KwnmX2uanEfo7bosg2uYQt"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
--https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS
