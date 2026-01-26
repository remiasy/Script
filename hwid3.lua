repeat task.wait() until game:IsLoaded()
task.spawn(function()
    local FPS = 10
    while task.wait(60) do
        pcall(setfpscap, FPS)
    end
end)


-- ================= SAFE SPAWN =================
local function safe_spawn(fn, name)
    task.spawn(function()
        local ok, err = pcall(fn)
        if not ok then
            warn((name or "task") .. " error: " .. tostring(err))
        end
    end)
end

-- =================================================
-- =============== PUT YOUR SCRIPTS HERE ===========
-- =================================================

-- Script Slot 1
local function SCRIPT_1()
repeat task.wait() until game:IsLoaded()
getgenv().Mode = "OneClick"
getgenv().Setting = {
    ["Team"] = "Pirates", -- Options "Pirates", "Marines"
    ["FucusOnLevel"] = true,
    ["Fruits"] = {  -- setting for fruits u want
        ["Primary"] = { -- if current fruit is not in this list, eat/buy
            "Dough-Dough",
            "T-Rex-T-Rex",
            "Mammoth-Mammoth",
            "Venom-Venom",
            "Spirit-Spirit",
            -- u can configs add mores/remove and must end with , (comma symbol)
        },
        ["Normal"] = { -- it just a normal fruit list
            "Dark-Dark",
            "Buddha-Buddha",
            -- u can configs add mores/remove and must end with , (comma symbol)
        }
        -- run this for get all fruit name `local t={};for _,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GetFruits"))do table.insert(t,v.Name)end;setclipboard(table.concat(t, "\n"))`
    },
    ["Lock Fruits"] = { -- don't use or eat fruits in this list
        "Yeti-Yeti",
        "T-Rex-T-Rex",
        "Kitsune-Kitsune",
        "Tiger-Tiger",
        "Gas-Gas",
        "Yeti-Yeti"
    },
    ["IdleCheck"] = 300, -- every (x) seconds if not moving rejoin
};

getgenv().user_key = 'remia'
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/OneClick/BF.lua"))()
end

-- Script Slot 2
local function SCRIPT_2()

getgenv().Hermanos_Settings = {

    ['key'] = 'b338ae2e-56e4-4a52-8925-5515fe5699f2',
	['PC'] = _G.PC,


    ['webhooks'] = {
        ['fullmoon'] = 'https://discord.com/api/webhooks/',
        ['mirage'] = 'https://discord.com/api/webhooks/',
    },
    ['Sword'] = {'Cursed Dual Katana', 'Shark Anchor', 'Tushita', 'Yama', 'Dark Dagger', 'Hallow Scythe', 'Saber'},
    ['Gun'] = {'Soul Guitar', 'Serpent Bow', 'Kabucha', 'Acidum Rifle'},
    ['Accessories'] = {'Dark Coat', 'Leviathan Shield', 'Leviathan Crown', 'Pale Scarf', 'Kitsune Mask', 'Kitsune Ribbon'},
    ['Fruit'] = {
        'Kitsune', 'Leopard', 'Dragon (West)', 'Spirit', 'Control', 'Venom', 'Gas', 'Yeti',
        'Shadow', 'Dough', 'Mammoth', 'T-Rex', 'Dragon (East)'
    }

}
 
task.spawn(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/main.lua'))() end)
    
end

-- Script Slot 3
local function SCRIPT_3()
task.spawn(function()
	repeat
		task.wait()
	until game:IsLoaded()

	local BaseURL = "https://cdk.ckshop.pro"
	local CacheInventory = {
		Data = {},
		Time = 0,
	}
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local Reparent = require(game.ReplicatedStorage:WaitForChild("Reparent"))
	local Unparent
	Unparent = hookfunction(
		Reparent.Unparent,
		newcclosure(function(Map, num, func)
			if table.find({ "Turtle", "Boat Castle" }, Map.Root.Name) then
				return
			end
			return Unparent(Map, num, func)
		end)
	)

	local SkinController = require(game:GetService("ReplicatedStorage").Controllers.SkinController)
	function findAura(AuraList: { string })
		local Skin = SkinController:GetInventory()
		if not Skin then
			return false
		end
		local A = 0
		for i, v in pairs(Skin) do
			if v["Type"] == "AuraSkin" and table.find(AuraList, v.DisplayName) and v.Count > 0 then
				A += 1
			end
		end
		return A == #AuraList
	end

	function findItem(item: string)
		if (tick() - CacheInventory.Time) < 120 then
			for i, v in pairs(CacheInventory.Data) do
				if v.Name == item then
					return true
				end
			end
			return false
		end
		local RequestGetInvertory = nil
		RequestGetInvertory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
		CacheInventory.Data = RequestGetInvertory
		CacheInventory.Time = tick()
		for i, v in pairs(RequestGetInvertory) do
			if v.Name == item then
				return true
			end
		end
		return false
	end
	function allPressPlate()
		for i, v in pairs(workspace.Map["Boat Castle"].Summoner.Circle:GetChildren()) do
			if v:IsA("Part") and v:FindFirstChild("Part") and v:FindFirstChild("TouchInterest") then
				if v.Part.Color == Color3.fromRGB(99, 95, 98) then
					return false
				end
			end
		end
		return true
	end
	task.spawn(function()
		while true do
			task.wait()
			local Action = request({
				Url = BaseURL .. string.format("/actions/%s", LocalPlayer.Name),
				Method = "GET",
			})
			if Action.Body == "SEND_PACKET" and #Players:GetPlayers() < 12 and not allPressPlate() then
				request({
					Url = BaseURL .. "/actions/update/" .. game.JobId .. "/" .. game.Players.LocalPlayer.Name,
					Method = "GET",
				})
				task.wait(5)
			end
		end
	end)
end)

end

-- Script Slot 4
local function SCRIPT_4()
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer.Team ~= nil
getgenv().HorstConfig = {
    ["EnableLog"] = true,
    ["Whitescreen"] = false,
    ["EnableAddFriends"] = false,
    ["LockFps"] = {
        ["EnableLockFps"] = false,
        ["LockFpsAmount"] = 30 
    },
    ["AutoFunctions"] = {
        ["Enable"] = false,
        ["BF"] = { 
            ["MAIN"] = {
                ["Level"] = 2800,
                ["Fragments"] = 10000,
                ["Full_Mastery_DF"] = false,
                ["Full_Awake_DF"] = false,
                ["Lever"] = false,
                ["Lock_Race"] = {
                    ["Enable"] = false,
                    ["Race"] = "Cyborg",
                    ["Ability"] = "V3",
                },
                ["Inventory"] = { -- จะส่งไอเท็มาใน log + เช็คตอน DONE ถ้าไม่มีของ จะไม่ DONE
                    ["Enable"] = false,
                    ["Name"] = {
                        "Leviathan Heart",
                        "Kitsune",
                    },
                    ["Amount"] = { -- อย่าลืมใส่จำนวนให้ตรง
                        1,
                        1
                    }
                }
            },
            ["PASS"] = false,
            ["GOD"] = false,
            ["GOD_CDK"] = false,
            ["GOD_SA"] = false, 
            ["GOD_MIR_VAL"] = false, 
            ["GOD_CDK_MIR_VAL"] = false,
            ["SANGUINE_ART"] = false
        }
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/HorstSpaceX/last_update/refs/heads/main/on_loaded.lua"))()
end


-- =================================================
-- ================== START RUN ====================
-- =================================================

safe_spawn(SCRIPT_1, "SCRIPT_1")
task.wait(0.1)

safe_spawn(SCRIPT_2, "SCRIPT_2")
task.wait(0.1)

safe_spawn(SCRIPT_3, "SCRIPT_3")
task.wait(0.1)

safe_spawn(SCRIPT_4, "SCRIPT_4")
task.wait(0.1)
