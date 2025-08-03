setfpscap(3)
getgenv().ConfigsKaitun = {
	["Block Pet Gift"] = false,

	Collect_Cooldown = 60,      -- cooldown to collect fruit
	JustFuckingCollectAll = false, -- Collect all (fruit not wait mutation)

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

	["Rejoin When Update"] = false,

	["Limit Tree"] = {
		["Limit"] = 350,
		["Destroy Untill"] = 300,

		["Safe Tree"] = {
			"Moon Blossom",
			"Bone Blossom",
			"Candy Blossom",

			"Serenity",
			"Moon Melon",
			"Horned Dinoshroom",
			"Firefly Fern",

			"Fossilight",

			-- locked fruit for zen event
			-- ["Tomato"] = 10,
			-- ["Strawberry"] = 10,
			-- ["Blueberry"] = 10,
			-- ["Orange Tulip"] = 10,
			-- ["Corn"] = 10,
			-- ["Daffodil"] = 10,
			-- ["Bamboo"] = 10,
			-- ["Apple"] = 10,
			-- ["Coconut"] = 10,
			-- ["Pumpkin"] = 10,
			-- ["Watermelon"] = 10,
			-- ["Cactus"] = 10,
			-- ["Dragon Fruit"] = 10,
			-- ["Mango"] = 10,
			-- ["Grape"] = 10,
			-- ["Mushroom"] = 10,
			-- ["Pepper"] = 10,
			-- ["Cacao"] = 10,
			-- ["Zenflare"] = 10,
			-- ["Serenity"] = 10,
		}
	},

	Seed = {
		Buy = {
			Mode = "Custom", -- Custom , Auto
			Custom = {
				"Tomato", "Bamboo", "Carrot", "Watermelon", "Pumpkin", "Mushroom", "Beanstalk", "Cacao", "Pepper",
				"Grape", "Mango", "Dragon Fruit", "Rose", "Foxglove", "Lilac", "Crocus", "Succulent",
				"Violet Corn", "Bendboo", "Cocovine", "Cauliflower", "Green Apple", "Avocado", "Banana", "Pineapple",
				"Kiwi",
				"Bell Pepper", "Prickly Pear", "Loquat", "Feijoa", "Rafflesia", "Pitcher", "Wild Carrot",
				"Pear", "Cantaloupe", "Parasol Flower", "Rosy Delight", "Liberty Lily", "Firework Flower", "Burning",
				"Stonebite", "Paradise Petal", "Horned Dinoshroom", "Boneboo", "Firefly Fern", "Taro Flower",
				"Zen Rocks", "Hinomai", "Soft Sunshine", "Spiked",


				"Zenflare", "Serenity",

				"Pepper", "Cacao", "Ember Lily", "Sugar Apple", "Giant Pinecone",

				"Fossilight", "Bone Blossom", "Candy Blossom", "Maple Apple",
			}
		},
		Place = {
			Mode = "Lock", -- Select , Lock
			Select = {

			},
			Lock = {
				"Sunflower",
				"Elephant Ears",
				"Dragon Pepper",
				"Pink Lily",
				"Purple Dahlia",
				"Honeysuckle",

				"Tranquil Bloom",
				"Maple Apple",
				"Grand Tomato"
			}
		}
	},

	["Seed Pack"] = {
		Locked = {

		}
	},

	Events = {
		Dino = true,
		["Cook Event"] = {
			Minimum_Money = 30000000, -- minimum money to start play this event
		},
		["Zen Event"] = {
			["Restocking"] = { -- Minimumthing to restock
				Max_Restocks_Price = 200000000,
				Minimum_Money = 5000000,
				Minimum_Chi = 100
			},
			["Doing"] = {
				Minimum_Money = 1000000, -- minimum money to start play this event
				First_Upgrade_Tree = 1,
				Maximum_Chi = 450,
			},
			Skip_Fox = false,     -- Skip The Middle Fox Trade (Corrupted Kitsune)
			Skip_Corrupted_OldMan = false, -- Skip The OldMan Trade (Kodama)
		},

		["Traveling Shop"] = {
			"Bald Eagle",
			"Night Staff",
			"Bee Egg",
			"Star Caller"
		},
		Craft = {
			--"Zen Seed Pack",
			--"Zen Egg",

			"Primal Egg",
			"Ancient Seed Pack",
			"Anti Bee Egg",

			-- "Honeysuckle",
			-- "Small Treat",

			"Small Toy",
			"Lightning Rod"
		},
		Shop = {
			"Zen Seed Pack",
			"Zen Egg",

			-- "Raiju",

			-- "Pet Shard Tranquil",
			-- "Pet Shard Corrupted",

			--"Traveler's Fruit",

			--"Summer Seed Pack",
			--"Flower Seed Pack",

			--"Hamster",

			--"Oasis Egg",

			--"Delphinium",
			-- "Lily of the Valley",
			-- "Spiked Mango",
			-- "Koi",
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
			"Medium Toy",
			"Medium Treat",
			"Levelup Lollipop",
			"Tanning Mirror"
		},
		Lock = {
		},
	},

	Eggs = {
		Place = {
			"Zen Egg",
			"Gourmet Egg",

			"Primal Egg",
			"Dinosaur Egg",

			"Night Egg",
			"Anti Bee Egg",
			"Oasis Egg",

			"Savannah Egg",
			"Bug Egg",
			"Paradise Egg",
			"Mythical Egg",
			"Bee Egg",

			"Common Summer Egg",
			"Rare Egg",
			"Uncommon Egg",
			"Common Egg"
		},
		Buy = {
			"Zen Egg",
			"Gourmet Egg",

			"Primal Egg",
			"Dinosaur Egg",

			"Night Egg",
			"Anti Bee Egg",
			"Oasis Egg",

			"Savannah Egg",
			"Bug Egg",
			"Paradise Egg",
			"Mythical Egg",
			"Bee Egg",

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
				["Starfish"] = { 6, 75, 1 },
			},
			["Limit Upgrade"] = 3,
			["Equip When Done"] = {

				["Bald Eagle"] = { 2, 70 },
				["Blood Kiwi"] = { 1, 70 },
				["Rooster"] = { 1, 70 },
				["Chicken"] = { 1, 70 }
			},
		},
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Kitsune",
			"Corrupted Kitsune",
			"Raiju",
			"Corrupted Kodama",
			"French Fry Ferret",

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
			"Ankylosaurus",
			["Bald Eagle"] = 5,
			["Moon Cat"] = 10,
			["Chicken"] = 2,
			["Rooster"] = 4,
			["Blood Kiwi"] = 5,
			["Ostrich"] = 5,
			["Capybara"] = 5,
			["Praying Mantis"] = 5,
			["Scarlet Macaw"] = 5,
			["Dilophosaurus"] = 5,
		},
		LockPet_Weight = 7, -- if Weight >= 10 they will locked,
		Instant_Sell = {
		}
	},

	Webhook = {
		UrlPet =
		"https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS",
		UrlSeed =
		"https://discord.com/api/webhooks/1399732832762331177/PVr6gW2RG2Gokz2CQEtZuJ_BplaBiIZmd8hzTj1Q8FkdoBdCjGo62NuKW0_6puoYpZLS",
		PcName = "PCALL",

		Noti = {
			Seeds = {
				"Sunflower",
				"Elephant Ears",
				"Dragon Pepper",
				"Pink Lily",
				"Purple Dahlia",
				"Honeysuckle"
			},
			SeedPack = {
				"Idk",
			},
			Pets = {
				"Kitsune",
				"Corrupted Kitsune",
				"Dragonfly",
				"Night Owl",
				"Queen Bee",
				"Raccoon",
				-- "Disco Bee",
				-- "Fennec Fox",
				-- "Disco Bee",
				-- "Butterfly",
				"Mimic Octopus",
				"Red Fox",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "O0ckL79tK6KwnmX2uanEfo7bosg2uYQt"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
