repeat task.wait() until game:IsLoaded()
-- ========================================================================================
setfpscap(15)
function Farm_Script()
print("Farm");
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
_G.Team = "Pirate" -- Marine / Pirate
getgenv().Script_Mode = "Kaitun_Script"
_G.MainSettings = {
    ["EnabledHOP"] = true,
    ['FPSBOOST'] = true,
    ["FPSLOCKAMOUNT"] = 60,
    ['WhiteScreen'] = true,
    ['CloseUI'] = false,
    ["NotifycationExPRemove"] = true,
    ['AFKCheck'] = 150,
    ["LockFragments"] = 200000,
    ["LockFruitsRaid"] = {
        [1] = "Dough-Dough",
        [2] = "Dragon-Dragon",        
        [3] = "T-Rex-T-Rex",
		[4] = "Kitsune-Kitsune",
		[5] = "Mammoth-Mammoth",
		[6] = "Leopard-Leopard",
    }
}
_G.SharkAnchor_Settings = {
    ["Enabled_Farm"] = false,
    ['FarmAfterMoney'] = 2500000
}
_G.Quests_Settings = {        
    ['Rainbow_Haki'] = true,
    ["MusketeerHat"] = true,
    ["PullLever"] = true,
    ['DoughQuests_Mirror'] = {
        ['Enabled'] = true,
        ['UseFruits'] = true
    }        
}
_G.Races_Settings = {
    ['Race'] = {
        ['EnabledEvo'] = true,
        ["v2"] = true,
        ["v3"] = true,
        ["Races_Lock"] = {
            ["Races"] = {
                ["Mink"] = true,
                ["Human"] = true,
                ["Fishman"] = true
            },
            ["RerollsWhenFragments"] = 200000
        }
    }
}
_G.Fruits_Settings = {
    ['Main_Fruits'] = {'Dough-Dough'},
    ['Select_Fruits'] = {"Flame-Flame", "Ice-Ice", "Quake-Quake", "Light-Light", "Dark-Dark", "Spider-Spider", "Rumble-Rumble", "Magma-Magma", "Buddha-Buddha"}
}
_G.Settings_Melee = {
    ['Superhuman'] = true,
    ['DeathStep'] = true,
    ['SharkmanKarate'] = true,
    ['ElectricClaw'] = true,
    ['DragonTalon'] = true,
    ['Godhuman'] = true
}
_G.SwordSettings = {
    ['Saber'] = true,
    ["Pole"] = false,
    ['MidnightBlade'] = false,
    ['Shisui'] = true,
    ['Saddi'] = true,
    ['Wando'] = false,
    ['Yama'] = true,
    ['Rengoku'] = false,
    ['Canvander'] = false,
    ['BuddySword'] = false,
    ['TwinHooks'] = false,
    ['HallowScryte'] = false,
    ['TrueTripleKatana'] = false,
    ['CursedDualKatana'] = true
}
_G.GunSettings = {
    ['Kabucha'] = false,
    ['SerpentBow'] = false,
    ['SoulGuitar'] = false
}
_G.FarmMastery_Settings = {
    ['Melee'] = true,
    ['Sword'] = true,
    ['DevilFruits'] = true,
    ['Select_Swords'] = {
        ["AutoSettings"] = true,
        ["ManualSettings"] = {
            "Saber",
            "Buddy Sword"
        }
    }
}
_G.Hop_Settings = {
    ["Find Tushita"] = false
}
-- Script Here !!!
(getgenv()).key = "MARUCW6QPM5LGPMIZ51LW7Y1Y3";
(getgenv()).id = "895247128409038888";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruComkak/main/PCBit.lua"))()
end
-- ========================================================================================
function Log_script()
print("Log");

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
-- ========================================================================================
function Api_Script()
print("Api");
repeat task.wait() until game:IsLoaded()

getgenv().HorstConfig = {
    ["EnableLog"] = true, -- ปรับเป็น true ถ้าอยากให้มันเช็คของ BF / GAG
    ["Whitescreen"] = false,
    ["EnableAddFriends"] = true, -- แอดเพื่อนให้เอง ทุกๆ 1นาที
    ["LockFps"] = {
        ["EnableLockFps"] = true,
        ["LockFpsAmount"] = 15 
    },
    ["AutoFunctions"] = {
        ["Enable"] = false, -- ออโต้เปลี่ยนไอดี สำคัญ !!
        ["BF"] = { 
            ["MAIN"] = {
                ["Level"] = 2750,
                ["Fragments"] = 30000, -- ถ้าต่ำกว่านี้จะไม่เปลี่ยนไอดีให้ until >=
                ["Full_Mastery_DF"] = false,
                ["Full_Awake_DF"] = false,
                ["Lever"] = false,
                ["Lock_Race"] = {
                    ["Enable"] = false,
                    ["Race"] = "Cyborg", -- ["Cyborg", "Ghoul", "Mink", "Fishman", "Skypiea", "Draco"]
                    ["Ability"] = "V3",
                    ["Tier"] = 10 -- ยังไม่ให้ใช้ เอามาประดับบารมีเฉยๆ
                }
            },
            ["GOD"] = true,
            ["GOD_CDK"] = false,
            ["GOD_SA"] = false, 
            ["GOD_MIR_VAL"] = false, 
            ["GOD_CDK_MIR_VAL"] = false 
        }
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/HorstSpaceX/last_update/refs/heads/main/on_loaded.lua"))()
end
-- ========================================================================================
repeat task.wait() until game:IsLoaded()

local function safe_spawn(fn, name)
    task.spawn(function()
        local ok, err = pcall(fn)
        if not ok then warn((name or "task").." error: "..tostring(err)) end
    end)
end

-- ===== ฟังก์ชันตามเดิมของคุณ (ไม่ต้องแก้) =====
-- Log_script(), Farm_Script(), Api_Script()
-- ============================================

-- ทางเลือก A: สตาร์ตแบบขนาน
safe_spawn(Log_script, "Log_script")
task.wait(0.1)
safe_spawn(Api_Script, "Api_Script")   -- ให้ API ขึ้นก่อน
task.wait(0.1)
safe_spawn(Farm_Script, "Farm_Script") -- ฟาร์มค่อยขึ้นท้ายสุด
