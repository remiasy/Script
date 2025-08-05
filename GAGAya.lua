--setfpscap(3)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,
	["Block Pet Gift"] = false,

	Collect_Cooldown = 60,
	JustFuckingCollectAll = false, -- Collect all (fruit not wait mutation) -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,
	
	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 450,
		["Destroy Untill"] = 450,
		
		["Safe Tree"] = {
			"Moon Blossom",
			"Bone Blossom",
			"Moon Melon",
			"Maple Apple",
			"Moon Mango",
			"Dragon Pepper",
			"Elephant Ears",
			"Fossilight",
		}
	},

	Seed = {
		Buy = {
			Mode = "Auto", -- Custom , Auto
			Custom = {

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
		["Cook Event"] = {
			Minimum_Money = 20_000_000, -- minimum money to start play this event
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
		Shop = {
			--"Traveler's Fruit",
			--"Summer Seed Pack",
			--"Flower Seed Pack",
			--"Hamster",
			--"Oasis Egg",
			--"Delphinium",
			--"Lily of the Valley",
			--"Raiju",
			"Zen Egg",
			--"Spiked Mango",
			"Zen Seed Pack",
			--"Zenflare",
			--"Soft Sunshine",
			--"Koi",
			--"Spiked Mango",
			--"Pet Shard Tranquil",
		},
		Start_Do_Honey = 1_000_000
	},
	
	Gear = {
		Buy = { 
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			--"Lightning Rod",
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
				--["Kodama"] = { 8, 75, 1 },
				["Starfish"] = { 8, 75, 1, true },
			},
			["Limit Upgrade"] = 5,
			["Equip When Done"] = {
				["Tarantula Hawk"] = { 2, 101, 1 },
				--["Corrupted Kodama"] = { 8, 101, 2 },
				--["Kodama"] = { 8, 101, 3 },
				["Blood Kiwi"] = { 8, 101, 2 },
				["Rooster"] = { 8, 101, 3 },
				["Ostrich"] = { 5, 101, 4 },
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
			["Ostrich"] = 5,
			["Spaghetti Sloth"] = 10,
			["Corrupted Kodama"] = 8,
			["Kodama"] = 8,
			["Tarantula Hawk"] = 2,
			["Bald Eagle"] = 5,
			["Moon Cat"] = 10,
			["Chicken"] = 2,
			["Rooster"] = 2,
			["Blood Kiwi"] = 5,
			["Starfish"] = 8,
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
		}
	},

	Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1394858891162026086/1htmJFMaJWT8G1U2gqpYjCia-2tDaoTzZm0SfAazE0kKP10w6sVUkLZFAlNSck4Rx6ih",
		UrlSeed = "https://discord.com/api/webhooks/1394858891162026086/1htmJFMaJWT8G1U2gqpYjCia-2tDaoTzZm0SfAazE0kKP10w6sVUkLZFAlNSck4Rx6ih",
		PcName = "remia",
		
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
				"Spaghetti Sloth",
				"French Fry Ferret",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "O0ckL79tK6KwnmX2uanEfo7bosg2uYQt"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
--https://discord.com/api/webhooks/1394858891162026086/1htmJFMaJWT8G1U2gqpYjCia-2tDaoTzZm0SfAazE0kKP10w6sVUkLZFAlNSck4Rx6ih
