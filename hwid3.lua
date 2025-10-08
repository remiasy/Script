repeat task.wait() until game:IsLoaded()
-- ========================================================================================
task.spawn(function()
    -- เรียกครั้งแรกทันที
    setfpscap(10)
    print("Setfpscap : Done (initial)")

    -- จากนั้นค่อยวนทุก 5 นาที
    while task.wait(60) do
        setfpscap(10)
        print("Setfpscap : Done (loop)")
    end
end)


function Farm_Script()
print("Farm");
local Keys = loadstring(game:HttpGet("https://raw.githubusercontent.com/remiasy/Script/refs/heads/main/banana.txt"))()
getgenv().Key = Keys[_G.PC]
print("Key Loaded:", getgenv().Key or "Key not found for "..tostring(_G.PC))
print("This PC is:", _G.PC or "Not Set")
    getgenv().SettingFarm ={
        ["Hide UI"] = false,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = true,
                    ["All Fruit"] = true, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = false,
            ["FPS"] = 10,
        },
        ["Get Items"] = {
            ["Saber"] = true,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = false,
            ["Valkyrie Helm"] = true,
            ["Mirror Fractal"] = true,
            ["Cursed Dual Katana"] = true,
            ["Upgrade Race V2-V3"] = true,
            ["Auto Pull Lever"] = true,
            ["Shark Anchor"] = false, --- if have cdk,sg,godhuman
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = false,
            ["Dragon Trident"] = false, 
            ["Pole (1st Form)"] = false,
            ["Gravity Blade"]  = false,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = true,
            ["Text"] = "ไก่ตัน สุดคุ้ม pangpream . rdcw . xyz",
        },
        ["Auto Summon Rip Indra"] = true, --- auto buy haki and craft haki legendary 
        ["Select Hop"] = { -- 70% will have it
            ["Hop Server If Have Player Near"] = false, 
            ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = false, 
            ["Hop Find Dough King Get Mirror Fractal"] = false,
            ["Hop Find Raids Castle [CDK]"] = false,
            ["Hop Find Cake Queen [CDK]"] = false,
            ["Hop Find Soul Reaper [CDK]"] = false,
            ["Hop Find Darkbeard [SG]"] = false,
            ["Hop Find Mirage [ Pull Lever ]"] = true,
        },
        ["Farm Mastery"] = {
            ["Melee"] = true,
            ["Sword"] = true,
        },
        ["Buy Haki"] = {
            ["Enhancement"] = true,
            ["Skyjump"] = true,
            ["Flash Step"] = true,
            ["Observation"] = true,
        },
        ["Sniper Fruit Shop"] = {
            ["Enabled"] = false, -- Auto Buy Fruit in Shop Mirage and Normal
            ["Fruit"] = {"Kitsune-Kitsune"},
        },
        ["Lock Fruit"] = {"Kitsune-Kitsune"},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()
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
    ["EnableAddFriends"] = false, -- แอดเพื่อนให้เอง ทุกๆ 1นาที
    ["LockFps"] = {
        ["EnableLockFps"] = false,
        ["LockFpsAmount"] = 10 
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
function Autochat_Script()
print("Autochat");
repeat task.wait() until game:IsLoaded()
-- auto_chat_textchatservice_batch.lua
local Messages = {
    "ไก่ตัน สุดคุ้ม pangpream . rdcw . xyz",
    "kaitun at pangpream . rdcw . xyz",
}

local DELAY_BETWEEN_MSG = 15   -- เวลาห่างระหว่างข้อความแต่ละอัน (วินาที)
local DELAY_AFTER_BATCH = 600  -- เวลาหลังจบชุด (วินาที) เช่น 60 = 1 นาที
local LOOP = true             -- true = ส่งชุดเรื่อย ๆ, false = ส่งครั้งเดียวแล้วหยุด
local RANDOM_ORDER = false    -- true = สุ่มลำดับ, false = ตามลำดับ

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ChatService = game:GetService("Chat")
local LocalPlayer = Players.LocalPlayer

-- หา TextChannel (มักชื่อ RBXGeneral)
local function getDefaultChannel()
    local channels = TextChatService:WaitForChild("TextChannels", 5)
    if not channels then return nil end
    local g = channels:FindFirstChild("RBXGeneral")
    if g then return g end
    for _, v in ipairs(channels:GetChildren()) do
        if v:IsA("TextChannel") then
            return v
        end
    end
    return nil
end

local textChannel = getDefaultChannel()

local function send_via_textchat(msg)
    if not textChannel then return false end
    local ok = pcall(function()
        textChannel:SendAsync(msg)
    end)
    return ok
end

local function send_via_bubble(msg)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local head = char and char:FindFirstChild("Head")
    if head then
        ChatService:Chat(head, msg, Enum.ChatColor.White)
        return true
    end
    return false
end

local function sendMessage(msg)
    if send_via_textchat(msg) then
        print("[AutoChat] ส่ง:", msg)
        return true
    end
    if send_via_bubble(msg) then
        print("[AutoChat] ส่ง (bubble):", msg)
        return true
    end
    warn("[AutoChat] ส่งไม่สำเร็จ:", msg)
    return false
end

local function loop()
    while true do
        local order = {}
        for i = 1, #Messages do
            table.insert(order, i)
        end
        if RANDOM_ORDER then
            for i = #order, 2, -1 do
                local j = math.random(i)
                order[i], order[j] = order[j], order[i]
            end
        end

        -- ส่งครบทุกข้อความในชุด
        for _, idx in ipairs(order) do
            sendMessage(Messages[idx])
            task.wait(DELAY_BETWEEN_MSG)
        end

        -- รอหลังจบชุด
        print("[AutoChat] รอ", DELAY_AFTER_BATCH, "วินาที ก่อนเริ่มชุดใหม่")
        task.wait(DELAY_AFTER_BATCH)

        if not LOOP then break end
    end
end

-- เริ่มอัตโนมัติ
task.defer(loop)
end
-- ========================================================================================
function Fps_Script()
print("Fps");
--[[ FPS Overlay — Separate boxes: Current FPS & 5-min AVG (no graph) ]]--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer

-- ===== Parent (CoreGui > gethui > PlayerGui) =====
local parent do
    if typeof(gethui) == "function" then
        local ok, ui = pcall(gethui)
        if ok and ui then parent = ui end
    end
    if not parent then
        local ok2, core = pcall(function() return game:GetService("CoreGui") end)
        if ok2 and core then parent = core end
    end
    if not parent then
        parent = lp:WaitForChild("PlayerGui")
    end
end

-- ===== Clear old =====
local old = parent:FindFirstChild("FPS_Overlay_UI")
if old then old:Destroy() end

-- ===== ScreenGui =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPS_Overlay_UI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.DisplayOrder = 99999999
screenGui.Parent = parent

--========== helpers ==========
local function styledBox(name, size, pos)
    local f = Instance.new("Frame")
    f.Name = name
    f.Size = size
    f.Position = pos
    f.AnchorPoint = Vector2.new(1,1)
    f.BackgroundColor3 = Color3.fromRGB(25,27,31)
    f.BackgroundTransparency = 0.15
    f.Active = true
    f.ZIndex = 999990
    f.Parent = screenGui
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 12)
    local st = Instance.new("UIStroke", f)
    st.Thickness = 1
    st.Transparency = 0.25
    st.Color = Color3.fromRGB(255,255,255)
    return f
end

local function makeDraggable(frame)
    local dragging, dragStart, startPos
    local function begin(input)
        dragging = true
        dragStart, startPos = input.Position, frame.Position
    end
    local function enddrag() dragging = false end
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            begin(input)
        end
    end)
    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            enddrag()
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local function colorFromFPS(fps)
    if fps >= 90 then return Color3.fromRGB(0,200,120)
    elseif fps >= 60 then return Color3.fromRGB(120,200,0)
    elseif fps >= 45 then return Color3.fromRGB(255,170,0)
    else return Color3.fromRGB(235,65,65) end
end

--========== Box 1: Current FPS (bottom-right) ==========
local fpsBox = styledBox("FPS_Box",
    UDim2.fromOffset(160, 64),
    UDim2.new(1, -16, 1, -12)
)

local title1 = Instance.new("TextLabel")
title1.BackgroundTransparency = 1
title1.Size = UDim2.new(1, -10, 0, 18)
title1.Position = UDim2.fromOffset(10, 6)
title1.Font = Enum.Font.GothamMedium
title1.TextXAlignment = Enum.TextXAlignment.Left
title1.TextColor3 = Color3.fromRGB(180,185,195)
title1.TextSize = 12
title1.Text = "Performance"
title1.ZIndex = 999991
title1.Parent = fpsBox

local fpsLabel = Instance.new("TextLabel")
fpsLabel.BackgroundTransparency = 1
fpsLabel.Size = UDim2.new(1, -10, 0, 32)
fpsLabel.Position = UDim2.fromOffset(10, 24)
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.TextColor3 = Color3.fromRGB(230,235,245)
fpsLabel.TextSize = 24
fpsLabel.Text = "FPS: --"
fpsLabel.ZIndex = 999991
fpsLabel.Parent = fpsBox

local statusBar = Instance.new("Frame")
statusBar.AnchorPoint = Vector2.new(1, 0.5)
statusBar.Position = UDim2.new(1, -10, 0.5, 0)
statusBar.Size = UDim2.fromOffset(8, 36)
statusBar.BackgroundColor3 = Color3.fromRGB(0,200,120)
statusBar.BorderSizePixel = 0
statusBar.ZIndex = 999992
statusBar.Parent = fpsBox
Instance.new("UICorner", statusBar).CornerRadius = UDim.new(0, 6)

makeDraggable(fpsBox)

--========== Box 2: AVG 5-min (stacked above FPS box) ==========
local avgBox = styledBox("AVG_Box",
    UDim2.fromOffset(160, 54),
    UDim2.new(1, -16, 1, -12 - 64 - 8) -- วางเหนือกล่องแรก 8px
)

local title2 = Instance.new("TextLabel")
title2.BackgroundTransparency = 1
title2.Size = UDim2.new(1, -10, 0, 16)
title2.Position = UDim2.fromOffset(10, 6)
title2.Font = Enum.Font.GothamMedium
title2.TextXAlignment = Enum.TextXAlignment.Left
title2.TextColor3 = Color3.fromRGB(180,185,195)
title2.TextSize = 12
title2.Text = "Average (5 min)"
title2.ZIndex = 999991
title2.Parent = avgBox

local avgLabel = Instance.new("TextLabel")
avgLabel.BackgroundTransparency = 1
avgLabel.Size = UDim2.new(1, -10, 0, 24)
avgLabel.Position = UDim2.fromOffset(10, 24)
avgLabel.Font = Enum.Font.GothamBold
avgLabel.TextXAlignment = Enum.TextXAlignment.Left
avgLabel.TextColor3 = Color3.fromRGB(230,235,245)
avgLabel.TextSize = 20
avgLabel.Text = "AVG: --"
avgLabel.ZIndex = 999991
avgLabel.Parent = avgBox

makeDraggable(avgBox)

--========== Logic ==========
local smoothedFPS = 60

-- buffer เก็บตัวอย่าง 5 นาที (time-weighted)
local WINDOW = 300      -- วินาที
local sampleInterval = 1
local accum = 0
local samples = {}      -- {t=..., fps=...}

local function prune(now)
    while #samples > 0 and (now - samples[1].t) > WINDOW do
        table.remove(samples, 1)
    end
end

local function timeWeightedAvg(now)
    if #samples == 0 then return 0 end
    local totalTime, weighted = 0, 0
    for i=1, #samples do
        local t0 = samples[i].t
        local t1 = (i < #samples) and samples[i+1].t or now
        local dt = math.max(0, t1 - t0)
        totalTime += dt
        weighted += samples[i].fps * dt
    end
    if totalTime <= 0 then return 0 end
    return weighted / totalTime
end

RunService.RenderStepped:Connect(function(dt)
    if dt <= 0 then return end
    if dt > 1 then dt = 1 end
    local instant = math.clamp(1/dt, 0, 1000)
    local alpha = 1 - math.exp(-8 * dt) -- EMA ตาม dt
    smoothedFPS = smoothedFPS + (instant - smoothedFPS) * alpha

    fpsLabel.Text = ("FPS: %d"):format(math.floor(smoothedFPS + 0.5))
    statusBar.BackgroundColor3 = colorFromFPS(instant)
end)

RunService.Heartbeat:Connect(function(dt)
    accum += dt
    if accum < sampleInterval then return end
    accum -= sampleInterval

    local now = tick()
    table.insert(samples, {t = now, fps = smoothedFPS})
    prune(now)

    local avg = timeWeightedAvg(now)
    avgLabel.Text = string.format("AVG: %d", math.floor(avg + 0.5))
end)

-- Optional: ปุ่ม F8 ซ่อน/โชว์ทั้งสองกล่องพร้อมกัน
local visible = true
UserInputService.InputBegan:Connect(function(input,gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F8 then
        visible = not visible
        fpsBox.Visible = visible
        avgBox.Visible = visible
    end
end)
end
-- ========================================================================================
function FarmMaru_Script()
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
        [1] = "T-Rex-T-Rex",
        [2] = "Dough-Dough",            
        [3] = "Dragon-Dragon",            
        [4] = "Kitsune-Kitsune",
        [5] = "Mammoth-Mammoth",
        [6] = "Leopard-Leopard",   
        [7] = "Yeti-Yeti",   
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
                ["Fishman"] = false
            },
            ["RerollsWhenFragments"] = 200000
        }
    }
}
_G.Fruits_Settings = {
    ['Main_Fruits'] = {''},
    ['Select_Fruits'] = {"Ice-Ice", "Light-Light", "Dark-Dark", "Magma-Magma", "Buddha-Buddha"}
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
(getgenv()).key = "MARU9HJ3ZVJHYJJA34GS1PWUB0";
(getgenv()).id = "895247128409038888";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruComkak/main/PCBit.lua"))()
end
-- ========================================================================================
function Check_level_horst()
    -- Horst: Level watcher (per-instance safe)

repeat task.wait(5) until game:IsLoaded()
print("Check_level_horst")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

-- ===== One-shot guard per executor/instance =====
getgenv().HORST_DONE_SENT = getgenv().HORST_DONE_SENT or false
local DONE_SENT = function() return getgenv().HORST_DONE_SENT end
local MARK_DONE = function() getgenv().HORST_DONE_SENT = true end

-- ===== Wait Data ready =====
local function waitDataReady(timeout)
    local t0 = os.clock()
    while os.clock() - t0 < (timeout or 60) do
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") then
            return true
        end
        task.wait(0.25)
    end
    return false
end

if not waitDataReady(90) then
    warn("[Horst] Data not ready after timeout; aborting watcher to avoid false DONE.")
    return
end

-- ===== Main check (debounced, one-shot) =====
local TARGET = 2801
local CHECK_INTERVAL = 20 -- วินาที

local function checkAndMaybeDone()
    if DONE_SENT() then return end
    local level = player.Data.Level.Value

    if level >= TARGET then
        print(("[Horst] Level %d >= %d -> sending DONE only for this instance"):format(level, TARGET))
        local ok, err = true, nil
        if _G.Horst_AccountChangeDone then
            ok, err = _G.Horst_AccountChangeDone()
        else
            ok, err = false, "Horst_AccountChangeDone not found"
        end

        if ok then
            MARK_DONE()
            print("[Horst] ✅ DONE sent (guard set).")
        else
            warn("[Horst] ❌ Failed to send DONE:", err)
        end
    else
        print(("[Horst] Level %d/%d (waiting)"):format(level, TARGET))
    end
end

-- เรียกครั้งแรกทันที แล้วค่อยวน
pcall(checkAndMaybeDone)
while not DONE_SENT() do
    task.wait(CHECK_INTERVAL)
    pcall(checkAndMaybeDone)
end

print("[Horst] Watcher finished for this instance.")
end
-- ========================================================================================
function Private_Server_Bloxfruit()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/remiasy/Script/refs/heads/main/Private_server_bf"))()
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
-- Log_script(), Farm_Script(), Api_Script() , Autochat_Script() , Fps_Script()
-- ============================================

-- ทางเลือก A: สตาร์ตแบบขนาน
safe_spawn(Log_script, "Log_script")
task.wait(0.1)
safe_spawn(Api_Script, "Api_Script")   -- ให้ API ขึ้นก่อน
task.wait(0.1)
safe_spawn(Farm_Script, "Farm_Script") -- Banana
task.wait(0.1) -- Banana
--safe_spawn(FarmMaru_Script, "FarmMaru_Script") -- Maru
--task.wait(0.1) -- Maru
safe_spawn(Autochat_Script, "Autochat_Script")
safe_spawn(Private_Server_Bloxfruit, "Private_Server_Bloxfruit")
safe_spawn(Check_level_horst, "Check_level_horst")
