task.wait(5)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 60,
	JustFuckingCollectAll = false, -- Collect all (fruit not wait mutation) -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,
	
	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 400,
		["Destroy Untill"] = 400,
		
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
		}
	},

	Seed = {
		Buy = {
			Mode = "Auto", -- Custom , Auto
			Custom = {
				"Carrot",
			}
		},
		Place = {
			Mode = "Lock", -- Select , Lock
			Select = {
				"Carrot"
			},
			Lock = {

			}
		}
	},
	
	["Seed Pack"] = {
		Locked = {
			
		}
	},
	
	Events = {
		["Bean Event"] = {
			Minimum_Money = 100_000, -- minimum money to start play this event
		},
		Shop = { -- delete -- to buy
			"Sprout Egg",
			"Sprout Seed Pack",
			-- "Mandrake",
			"Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			"Spriggan",
		},
		["Traveling Shop"] = {
			"Bald Eagle",
			"Star Caller",
			"Bee Egg",
		},
		Craft = {
			"Primal Egg",
			"Ancient Seed Pack",
			"Anti Bee Egg",
			--"Honeysuckle",
			--"Lightning Rod",
		},
		Start_Do_Honey = 100_000
	},
	
	Gear = {
		Buy = { 
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Medium Toy",
			"Medium Treat",
			"Level Up Lollipop",
			"Tanning Mirror",
			"Grandmaster Spinkler"
		},
		Lock = {

		},
	},

	Eggs = {
		Place = {
			"Sprout Egg",
			"Gourmet Egg",
			"Zen Egg",
			"Anti Bee Egg",
			"Primal Egg",
			"Bug Egg",
			"Paradise Egg",
			"Night Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			--"Mythical Egg",
			--"Legendary Egg",
			"Common Summer Egg",
			"Rare Egg",
			"Uncommon Egg",
		},
		Buy = {
			"Sprout Egg",
			"Gourmet Egg",
			"Zen Egg",
			"Primal Egg",
			"Night Egg",
			"Bug Egg",
			"Anti Bee Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			"Paradise Egg",
			--"Mythical Egg",
			"Legendary Egg",
			"Bee Egg",
			"Rare Summer Egg",
			"Common Summer Egg",
			"Rare Egg",
			"Uncommon Egg",
			"Common Egg"
		}
	},
	
	Pets = {
		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
				--["Bacon Pig"] = { 8, 75, 1 },
				["Starfish"] = { 8, 75, 1 },
			},
			["Limit Upgrade"] = 5,
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
				["Starfish"] = { 8, 75, 5 },
			},
		},
		Favorite_LockedPet = true,
		Locked = {
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
			"Kitsune",
			"Dilophosaurus",
			"Corrupted Kitsune",
			"Raiju",
			"French Fry Ferret",
			"Lobster Thermidor",
			"Golden Goose",
			["Spriggan"] = 5,
			["Sunny-Side Chicken"] = 1,
			["Bacon Pig"] = 8,
			["Gorilla Chef"] = 8,
			["Ostrich"] = 5,
			["Spaghetti Sloth"] = 5,
			["Corrupted Kodama"] = 8,
			["Kodama"] = 8,
			["Tarantula Hawk"] = 2,
			["Bald Eagle"] = 5,
			["Moon Cat"] = 10,
			["Chicken"] = 2,
			["Rooster"] = 2,
			["Blood Kiwi"] = 5,
			["Starfish"] = 8,
			["Mochi Mouse"] = 5,
		},
		LockPet_Weight = 5, -- if Weight >= 7 they will locked,
		Instant_Sell = {
			"Grey Mouse",
			"Squirrel",
			"Snail",
			"Orangutan",
			"Brown Mouse",
			"Bunny",
			"Crab",
			"Caterpillar",
			"Shiba Inu",
			"Tanuki",
			"Manaki-Neko",
			"Seagull",
		}
	},

	Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS",
		UrlSeed = "https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS",
		PcName = "remiasy",
		
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
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "O0ckL79tK6KwnmX2uanEfo7bosg2uYQt"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
--https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS
