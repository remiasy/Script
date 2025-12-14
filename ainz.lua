if game.PlaceId == 18219125606 then
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    TeleportService:Teleport(16146832113, player)
end

-- ==========================================
-- SERVICES
-- ==========================================
local VirtualUser = game:service("VirtualUser")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- ==========================================
-- ANTI-AFK SETUP
-- ==========================================
game:service("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)


-- ==========================================
-- WEBHOOK NOTIFICATION SYSTEM
-- ==========================================

-- Default Configuration
local defaultConfig = {
    Webhook_Url = "https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE",
    Notification_Every = 1,
    Enable_Notifications = true,
    Show_Debug = false,
    Only_Notify_With_Escanor = false
}

-- Initialize or merge configuration
if not getgenv().WebhookConfig then
    getgenv().WebhookConfig = defaultConfig
else
    -- Merge missing keys from default config
    for key, value in pairs(defaultConfig) do
        if getgenv().WebhookConfig[key] == nil then
            getgenv().WebhookConfig[key] = value
        end
    end
end

local config = getgenv().WebhookConfig


local webhookEnabled = true

if config.Webhook_Url == "https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE" then
    warn("⚠️ Webhook URL ไม่ได้ตั้งค่า - ระบบ Webhook จะไม่ทำงาน")
    webhookEnabled = false
end

if config.Notification_Every < 0.1 then
    warn("⚠️ Notification_Every น้อยเกินไป - ใช้ค่าเริ่มต้น 1 นาที")
    config.Notification_Every = 1
end

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Variables
local lastNotificationTime = 0
local notificationInterval = config.Notification_Every * 60 
local webhookConnection = nil

-- Custom Emoji IDs
local EMOJI_Leaves = "<:Leaves:1402870422952738896>"
local EMOJI_GEMS = "<:gems:1411201104179499142>"
local EMOJI_FLOWERS = "<:flowers:1386654997693071452>"
local EMOJI_ESCANOR = "<:escanor:1411213531122106378>"

-- ==========================================
-- FUNCTIONS
-- ==========================================

local function debugPrint(message)
    if config.Show_Debug then
        print("[WEBHOOK DEBUG]", message)
    end
end

-- Function to check Iscanor
local function checkIscanor()
    local TARGET_NAME = "Lich King (Ruler)"

    local player = game:GetService("Players").LocalPlayer

    local unitsFolder = player.PlayerGui
        :WaitForChild("Windows")
        :WaitForChild("GlobalInventory")
        :WaitForChild("Holder")
        :WaitForChild("LeftContainer")
        :WaitForChild("FakeScrollingFrame")
        :WaitForChild("Items")
        :WaitForChild("CacheContainer")

    for _, guiItem in ipairs(unitsFolder:GetChildren()) do
        
        local nameLabel = guiItem:FindFirstChild("Name") or guiItem:FindFirstChild("Title") or guiItem:FindFirstChild("UnitName")

        if nameLabel then
            local unitName = nameLabel.Text
            if unitName == TARGET_NAME then
                return true
            end
        end
    end

    return false
end

local function sendWebhook()
    -- ตรวจสอบว่า webhook เปิดใช้งานไหม
    if not webhookEnabled then
        debugPrint("Webhook disabled - URL not configured")
        return
    end
    
    if not config.Enable_Notifications then
        debugPrint("Notifications disabled")
        return
    end
    
    
    local hasIscanor = checkIscanor()
    
    
    if config.Only_Notify_With_Escanor and not hasIscanor then
        debugPrint("Escanor not found - skipping notification (Only_Notify_With_Escanor = true)")
        return
    end
    
    -- Get player stats
    local gems = player:GetAttribute("Gems") or 0
    local Leaves = player:GetAttribute("Leaves") or 0
    local flowers = player:GetAttribute("Flowers") or 0
    
    local iscanorEmoji = hasIscanor and "✅" or "❌"
    local iscanorStatus = hasIscanor and "มี" or "ไม่มี"
    
    -- เปลี่ยนสีเป็นทอง (gold) ถ้ามี Escanor
    local embedColor = hasIscanor and 16766720 or 4759794 
    
    local data = {
        ["content"] = "",
        ["username"] = "Escanor Private Script",
        ["avatar_url"] = "",
        ["embeds"] = {
            {
                ["title"] = hasIscanor and "🌞 ESCANOR FOUND!" or "เเจ้งงานฟามเอสคานอร์",
                ["description"] = hasIscanor and "🎉 **พบ Escanor แล้ว!** 📊 สถิติปัจจุบัน:" or "เเจ้งงานฟามเอสคานอร์",
                ["color"] = embedColor,
                ["fields"] = {
                    {
                        ["name"] = "👤 Player Statistics",
                        ["value"] = "**" .. player.DisplayName .. "** (@" .. player.Name .. ")",
                        ["inline"] = false
                    },
                    {
                        ["name"] = EMOJI_GEMS .. " Gems",
                        ["value"] = tostring(gems),
                        ["inline"] = true
                    },
                    {
                        ["name"] = EMOJI_Leaves .. " Iced Tea", 
                        ["value"] = tostring(Leaves),
                        ["inline"] = true
                    },
                    {
                        ["name"] = EMOJI_FLOWERS .. " Flowers",
                        ["value"] = tostring(flowers),
                        ["inline"] = true
                    },
                    {
                        ["name"] = EMOJI_ESCANOR .. " Iscanur (Pride)",
                        ["value"] = iscanorEmoji .. " " .. iscanorStatus,
                        ["inline"] = false
                    }
                },
                ["thumbnail"] = {
                    ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(player.UserId) .. "&width=150&height=150&format=png"
                },
                ["footer"] = {
                    ["text"] = "Infinite Game Mode • " .. os.date("%H:%M:%S"),
                    ["icon_url"] = "https://img2.pic.in.th/pic/20fe6f723c5a36c13.webp"
                }
            }
        }
    }
    
    local jsonData = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
        ["content-type"] = "application/json"
    }
    
    spawn(function()
        local success, response = pcall(function()
            request = http_request or request or HttpPost or syn.request
            local requestData = {
                Url = config.Webhook_Url,
                Body = jsonData,
                Method = "POST",
                Headers = headers
            }
            request(requestData)
        end)
        
        if success then
            debugPrint("✅ Webhook sent! Gems: " .. gems .. ", Iced Tea: " .. Leaves .. ", Flowers: " .. flowers .. ", Escanor: " .. iscanorStatus)
        else
            warn("❌ Webhook failed:", response)
        end
    end)
end

-- ==========================================
-- MAIN WEBHOOK LOOP
-- ==========================================

local function onHeartbeat()
    local currentTime = tick()
    
    if currentTime - lastNotificationTime >= notificationInterval then
        lastNotificationTime = currentTime
        sendWebhook()
    end
end

-- ==========================================
-- STARTUP
-- ==========================================

if webhookEnabled then
    debugPrint("🚀 Webhook System Started")
    debugPrint("📊 Notification interval: " .. config.Notification_Every .. " minutes")
    debugPrint("🌞 Only notify with Escanor: " .. tostring(config.Only_Notify_With_Escanor))
    
    
    wait(2) 
    sendWebhook()
    
   
    webhookConnection = RunService.Heartbeat:Connect(onHeartbeat)
    
    print("✅ Webhook System loaded successfully!")
else
    print("⚠️ Webhook System disabled - URL not configured")
    webhookConnection = nil
end

-- ==========================================
-- GLOBAL FUNCTIONS
-- ==========================================


getgenv().StopWebhookNotifications = function()
    if webhookConnection then
        webhookConnection:Disconnect()
        webhookConnection = nil
        print("🛑 Webhook Notifications stopped")
    end
end


getgenv().SendWebhookNow = function()
    sendWebhook()
    print("📤 Webhook sent manually")
end


getgenv().UpdateWebhookConfig = function(newConfig)
    for key, value in pairs(newConfig) do
        if config[key] ~= nil then
            config[key] = value
            debugPrint("Updated " .. key .. " = " .. tostring(value))
        end
    end
end



-- ==========================================
-- CONFIGURATION
-- ==========================================


if not getgenv().Configuration then
    getgenv().Configuration = {}
end

local defaultConfig = {
    CODES = {
        "Fall25",
        "FallenKingdom",
        "HorseRacing",
    },
    
    UNIT_POSITIONS = {
        Vector3.new(442.2826, 3.7291, -342.2381),
        Vector3.new(442.1568, 3.7291, -345.2569),
        Vector3.new(442.2632, 3.7291, -339.7381),
        Vector3.new(441.6166, 3.7291, -348.1028),
        Vector3.new(442.4483, 3.7291, -336.8802),
        Vector3.new(442.5588, 3.7291, -334.0656)
    },

    UNWANTED_SETTINGS = {
        "AutoSkipWaves",
        "DisableVisualEffects",
        "DisableDamageIndicators",
        "SimplifiedEnemyGui",
        "DisableCameraShake",
        "DisableGlobalMessages",
        "DisableEnemyTags",
        "LowDetailMode",
        "DisableMatchEndRewardsView"
    },

    PLACE_IDS = {
        LOBBY = 16146832113,
        GAME = 16277809958,
        AFK = 18219125606
    },

    DELAYS = {
        CODE_REDEEM = 1,
        UNIT_EQUIP = 0.2,
        UNIT_PLACE = 1,
        UNIT_UPGRADE = 0.2,
        SETTING_TOGGLE = 1,
        GENERAL = 1
    },
    
    THRESHOLDS = getgenv().THRESHOLDS or {
        LOBBY_SUMMON = 1500,
        SPECIAL_PLACE = 100000
    }
}

for key, value in pairs(defaultConfig) do
    if getgenv().Configuration[key] == nil then
        getgenv().Configuration[key] = value
    end
end

local CONFIG = getgenv().Configuration

-- ==========================================
-- GLOBAL VARIABLES
-- ==========================================
local farmLoaded = false

-- ==========================================
-- UTILITY FUNCTIONS
-- ==========================================
local Utils = {}

function Utils.safeWait(duration)
    task.wait(duration or CONFIG.DELAYS.GENERAL)
end

function Utils.safeCall(func, errorMessage)
    local success, result = pcall(func)
    if not success then
        warn(errorMessage or "Function call failed:", result)
        return false
    end
    return true
end

function Utils.waitForChild(parent, childName, timeout)
    timeout = timeout or 10
    return parent:WaitForChild(childName, timeout)
end

function Utils.log(category, message, ...)
    local timestamp = os.date("[%H:%M:%S]")
    local formattedMessage = string.format(message or "", ...)
    -- print(string.format("%s [%s] %s", timestamp, category, formattedMessage))
    
end

-- ==========================================
-- HELPER FUNCTIONS
-- ==========================================
local function isInSpecialPlace()
    local success, result = pcall(function()
        local mapRoot = workspace:FindFirstChild("Map")
        if not mapRoot then return false end

        local innerMap = mapRoot:FindFirstChild("Map") 
        if not innerMap then return false end

        
        local candle = innerMap:FindFirstChild("OverlordCandleLight")
        if candle then
            return true
        end

        return false
    end)

    return success and result or false
end


local function getattr(attrName, default)
    local lp = Players.LocalPlayer
    if not lp then
        return default
    end
    local v = lp:GetAttribute(attrName)
    if v == nil then
        return default
    end
    return tonumber(v) or v
end

local function tpToLobby()
    return Utils.safeCall(function()
        ReplicatedStorage:WaitForChild("Networking"):WaitForChild("TeleportEvent"):FireServer("Lobby")
    end, "Failed to teleport to lobby")
end

-- ==========================================
-- GAME FUNCTIONS
-- ==========================================
local GameFunctions = {}

function GameFunctions.cleanupLocalScripts()
    Utils.log("CLEANUP", "Cleaning up LocalScripts...")
    return Utils.safeCall(function()
        if getnilinstances then
            for i, v in next, getnilinstances() do
                if v:IsA("LocalScript") and v.Enabled then
                    v:Destroy()
                end
            end
        end
    end, "Failed to cleanup LocalScripts")
end

function GameFunctions.equipAllUnits()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local player = Players.LocalPlayer

    if not player:GetAttribute("Level") then
        player:GetAttributeChangedSignal("Level"):Wait()
    end
    local level = player:GetAttribute("Level")

    local allowedUnits = level >= 11
        and { Ackers = true }
        or  { Luffo = true, Ackers = true }

    local EquipEvent = ReplicatedStorage.Networking.Units.EquipEvent
    EquipEvent:FireServer("UnequipAll")
    task.wait(0.5)

    local unitsFolder = player.PlayerGui.Windows.GlobalInventory.Holder.LeftContainer
        .FakeScrollingFrame.Items.CacheContainer

    for _, guiItem in ipairs(unitsFolder:GetChildren()) do
        local uuid = guiItem.Name
        local nameObj = guiItem:FindFirstChild("Container")
            and guiItem.Container.Holder.Main.UnitName

        if uuid and nameObj then
            local unitName = nameObj.Text:match("^%s*(.-)%s*$")
            print("Checking:", unitName)

            if allowedUnits[unitName] then
                EquipEvent:FireServer("Equip", uuid)
                print("✔ Equipped:", unitName)
                task.wait(0.1)
            end
        end
    end
end





function GameFunctions.LobbyFuser()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local player = Players.LocalPlayer
    local FuseEvent = ReplicatedStorage.Networking.Units.FuseEvent
    local SummonEvent = ReplicatedStorage.Networking.Units.SummonEvent

    local unitsFolder = player.PlayerGui.Windows.GlobalInventory.Holder.LeftContainer
        .FakeScrollingFrame.Items.CacheContainer

    -- ===============================
    -- CONFIG
    -- ===============================
    local MAIN_UNIT_NAME = "Ackers"
    local STOP_LEVEL = 60
    local SUMMON_BANNER = "Special" -- เปลี่ยนได้

    local bannedUnits = {
    ["Luffo"] = true,
    ["Lich King (Ruler)"] = true,
    ["Horsegirls (Racers)"] = true,
    ["Unstable (Psychosis)"] = true,
    ["Black Hole (Ninjutsu)"] = true,
    ["Ghost Girl (Umbrella)"] = true,
    ["Ghoul (Winged)"] = true,
    ["Jailer (Underworld)"] = true,
    ["Horsegirls"] = true,
    ["Unstable"] = true,
    ["Black Hole"] = true,
    ["Ghost Girl"] = true,
    ["Ghoul"] = true,
    ["Jailer"] = true,
}

    -- ===============================
    -- FIND ACKERS + CHECK LEVEL
    -- ===============================
    local mainUUID, ackersLevel = nil, 0

    for _, guiItem in ipairs(unitsFolder:GetChildren()) do
        local main = guiItem:FindFirstChild("Container")
            and guiItem.Container:FindFirstChild("Holder")
            and guiItem.Container.Holder:FindFirstChild("Main")

        local nameObj = main and main:FindFirstChild("UnitName")
        local levelObj = main and main:FindFirstChild("LevelFrame")
            and main.LevelFrame:FindFirstChild("Level")

        if nameObj and nameObj.Text == MAIN_UNIT_NAME then
            mainUUID = guiItem.Name
            ackersLevel = tonumber(levelObj and levelObj.Text) or 0
            break
        end
    end

    if not mainUUID then
        warn("❌ ไม่พบ Ackers")
        return
    end

    print("✔ Ackers Level:", ackersLevel)

    -- ===============================
    -- STOP CONDITION
    -- ===============================
    if ackersLevel >= STOP_LEVEL then
        warn("🛑 Ackers Lv.60 → หยุด Fuse + หยุดสุ่ม Banner")
        return
    end

    -- ===============================
    -- COLLECT FUSE MATERIALS
    -- ===============================
    local fuseList = {}

    for _, guiItem in ipairs(unitsFolder:GetChildren()) do
        if guiItem.Name ~= mainUUID then
            local nameObj = guiItem:FindFirstChild("Container")
                and guiItem.Container.Holder.Main.UnitName

            if nameObj then
                local unitName = nameObj.Text:match("^%s*(.-)%s*$")
                if not bannedUnits[unitName] then
                    table.insert(fuseList, guiItem.Name)
                end
            end
        end
    end

    -- ===============================
    -- FIRE FUSE
    -- ===============================
    if #fuseList > 0 then
        FuseEvent:FireServer("Fuse", {
            mainUUID,
            fuseList
        })
        print("🔥 Fuse:", #fuseList)
        task.wait(0.5)
    end

    -- ===============================
    -- SUMMON BANNER
    -- ===============================
    -- ตรวจซ้ำอีกครั้งกัน edge case
    if ackersLevel < STOP_LEVEL then
        SummonEvent:FireServer("SummonTen", SUMMON_BANNER)
        print("🎰 Summon Banner:", SUMMON_BANNER)
    end
end




function GameFunctions.redeemAllCodes()
    Utils.log("CODES", "Starting code redemption process...")
    
    return Utils.safeCall(function()
        local codesEvent = Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "CodesEvent")
        
        for i, code in ipairs(CONFIG.CODES) do
            Utils.log("CODES", "Redeeming code %d/%d: %s", i, #CONFIG.CODES, code)
            
            local codeSuccess = Utils.safeCall(function()
                codesEvent:FireServer(code)
            end, "Failed to redeem code: " .. code)
            
            if codeSuccess then
                Utils.log("CODES", "Successfully redeemed: %s", code)
            else
                Utils.log("CODES", "Failed to redeem: %s", code)
            end
            
            Utils.safeWait(CONFIG.DELAYS.CODE_REDEEM)
        end
        
        Utils.log("CODES", "Code redemption completed!")
        return true
    end, "Failed to redeem codes")
end

function GameFunctions.completeDialogue()
    Utils.log("DIALOGUE", "Starting dialogue interaction...")
    
    return Utils.safeCall(function()
        local dialogueEvent = Utils.waitForChild(
            Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "State"),
            "DialogueEvent"
        )
        
        local unitSelectionEvent = Utils.waitForChild(
            Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "Units"),
            "UnitSelectionEvent"
        )
        
        -- Fire dialogue interactions
        local function fireDialogue(step, action)
            dialogueEvent:FireServer("Interact", {"StarterUnitDialogue", step, action})
            Utils.safeWait()
        end
        
        fireDialogue(1, "Okay!")
        fireDialogue(2, "Okay!")
        
        -- Select unit
        unitSelectionEvent:FireServer("Select", "Luffo")
        
        Utils.log("DIALOGUE", "Dialogue completed successfully")
        return true
    end, "Failed to complete dialogue")
end

function GameFunctions.claimBattlepass()
    Utils.log("BATTLEPASS", "Claiming battlepass rewards...")
    
    local networking = ReplicatedStorage:FindFirstChild("Networking")
    if not networking then
        Utils.log("BATTLEPASS", "Networking not found")
        return false
    end
    
    local claimSuccess = false
    
    -- Claim Battlepass
    local battlepassEvent = networking:FindFirstChild("BattlepassEvent")
    if battlepassEvent then
        local success = Utils.safeCall(function()
            battlepassEvent:FireServer("ClaimAll")
        end, "Failed to claim battlepass rewards")
        if success then
            Utils.log("BATTLEPASS", "Battlepass rewards claimed")
            claimSuccess = true
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local AnniversaryEvent = ReplicatedStorage.Networking:WaitForChild("DailyRewardEvent")
            for i = 1, 7 do
            AnniversaryEvent:FireServer("Claim", {"Anniversary", i})
    task.wait(0.2)
end

local NewPlayerEvent = ReplicatedStorage.Networking:WaitForChild("NewPlayerRewardsEvent")
for i = 1, 7 do
    NewPlayerEvent:FireServer("Claim", i)
    task.wait(0.2)
end
        end
    else
        Utils.log("BATTLEPASS", "BattlepassEvent not found")
    end
    
    -- Claim Quest
    local quests = networking:FindFirstChild("Quests")
    if quests then
        local claimQuest = quests:FindFirstChild("ClaimQuest")
        if claimQuest then
            local success = Utils.safeCall(function()
                claimQuest:FireServer("ClaimAll")
            end, "Failed to claim quest rewards")
            if success then
                Utils.log("BATTLEPASS", "Quest rewards claimed")
                claimSuccess = true
            end
        else
            Utils.log("BATTLEPASS", "ClaimQuest not found under Quests")
        end
    else
        Utils.log("BATTLEPASS", "Quests not found under Networking")
    end
    
    return claimSuccess
end

function GameFunctions.selectStoryMode()
    Utils.log("STORY", "Selecting story mode...")
    
    return Utils.safeCall(function()
        local lobbyEvent = Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "LobbyEvent")
        
        lobbyEvent:FireServer("AddMatch", {
            Difficulty = "Normal",
            Act = "Act1",
            StageType = "Story",
            Stage = "Stage1",
            FriendsOnly = false
        })
        
        Utils.log("STORY", "Story mode selected successfully")
        return true
    end, "Failed to select story mode")
end

function GameFunctions.trySpecialPlace()
    task.wait(1)
    local args = {
	"Create",
	"Infinite"
}
game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Fall"):WaitForChild("FallLTMEvent"):FireServer(unpack(args))

end

function GameFunctions.startMatch()
    Utils.log("MATCH", "Starting match...")
    
    return Utils.safeCall(function()
        local lobbyEvent = Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "LobbyEvent")
        
        lobbyEvent:FireServer("StartMatch")
        Utils.log("MATCH", "Match started successfully")
        return true
    end, "Failed to start match")
end

function GameFunctions.skipWave()
    Utils.log("SKIP", "Skipping current wave...")
    
    return Utils.safeCall(function()
        local skipWaveEvent = Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "SkipWaveEvent")
        
        skipWaveEvent:FireServer("Skip")
        Utils.log("SKIP", "Wave skipped successfully")
        return true
    end, "Failed to skip wave")
end

function GameFunctions.deployUnits()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local UnitEvent = ReplicatedStorage.Networking.UnitEvent
    local player = Players.LocalPlayer

    local function placeUnit(name, slot, pos)
        UnitEvent:FireServer("Render", {name, slot, pos, 0})
    end

    local function sellAllUnits()
        local units = workspace:FindFirstChild("Units")
        if not units then return end
        
        for _, unit in ipairs(units:GetChildren()) do
            UnitEvent:FireServer("Sell", unit.Name) 
            task.wait(0.1)
        end
    end

    local function getWave()
        local pg = player:FindFirstChild("PlayerGui")
        local hud = pg and pg:FindFirstChild("HUD")
        local waves = hud and hud:FindFirstChild("Map") and hud.Map:FindFirstChild("WavesAmount")
        local text = waves and (waves.ContentText or waves.Text)
        return text and tonumber(text:match("^(%d+)"))
    end

    
    local firstPositions = {
        vector.create(345.04986572265625, 48.49005889892578, -33.34515380859375),
        vector.create(342.0235595703125, 48.49005889892578, -33.28343200683594),
        vector.create(338.8519287109375, 48.49005889892578, -32.89971923828125)
    }

    
    local secondPositions = {
        vector.create(354.5499267578125, 48.49005889892578, -162.36744689941406),
        vector.create(351.4119873046875, 48.49006271362305, -164.4468231201172),
        vector.create(349.35943603515625, 48.49005889892578, -166.8121795654297)
    }

    
    local wave = getWave()
    if not wave then return end

    -- ===========================================================
    --  WAVE 1 → วางตัวชุดแรก
    -- ===========================================================
    if wave == 1 then
        for _, pos in ipairs(firstPositions) do
            placeUnit("Ackers", 241, pos)
            task.wait(1)
        end
    end

    -- ===========================================================
    --  WAVE 16 → ขายทั้งหมด + วางชุดสอง
    -- ===========================================================
    if wave == 16 then
        sellAllUnits()
        task.wait(1)

        for _, pos in ipairs(secondPositions) do
            placeUnit("Ackers", 241, pos)
            task.wait(1)
        end
    end
end



function GameFunctions.upgradeAllUnits()
    Utils.log("UPGRADE", "Upgrading all units...")
    
    return Utils.safeCall(function()
        local unitEvent = Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "UnitEvent")
        local unitFolder = Utils.waitForChild(workspace, "Units")
        local upgradedCount = 0
        
        for _, unit in ipairs(unitFolder:GetChildren()) do
            if unit:IsA("Model") then
                local uuid = unit.Name
                unitEvent:FireServer("Upgrade", uuid)
                Utils.log("UPGRADE", "Upgraded unit: %s", uuid)
                upgradedCount = upgradedCount + 1
                Utils.safeWait(CONFIG.DELAYS.UNIT_UPGRADE)
            end
        end
        
        Utils.log("UPGRADE", "Upgrade completed! Total units upgraded: %d", upgradedCount)
        return true
    end, "Failed to upgrade units")
end

function GameFunctions.configureGameSettings()
    if GameFunctions._settingsConfigured then
        Utils.log("SETTINGS", "Settings already configured this session, skipping...")
        return true
    end
    
    Utils.log("SETTINGS", "Configuring game settings...")
    
    local success = Utils.safeCall(function()
        local settingsEvent = Utils.waitForChild(
            Utils.waitForChild(Utils.waitForChild(ReplicatedStorage, "Networking"), "Settings"),
            "SettingsEvent"
        )
        
        for _, settingName in ipairs(CONFIG.UNWANTED_SETTINGS) do
            settingsEvent:FireServer("Toggle", settingName)
            Utils.log("SETTINGS", "Toggled setting: %s", settingName)
            Utils.safeWait(CONFIG.DELAYS.SETTING_TOGGLE)
        end
        
        Utils.log("SETTINGS", "Game settings configured successfully")
        GameFunctions._settingsConfigured = true
        return true
    end, "Failed to configure settings")
    
    return success
end

function GameFunctions.removeNotifications()
    Utils.log("CLEANUP", "Removing notifications...")
    
    return Utils.safeCall(function()
        game:GetService("Players").LocalPlayer.PlayerGui.Notification:Destroy()

            Utils.log("CLEANUP", "Notifications removed successfully")
        return true
    end, "Failed to remove notifications")
end

function GameFunctions.checkForReplay()
    Utils.log("REPLAY", "Checking for replay option...")
    
    return Utils.safeCall(function()
        local networking = ReplicatedStorage:WaitForChild("Networking")
        local endScreen = networking:FindFirstChild("EndScreen")
        if endScreen then
            local voteEvent = endScreen:FindFirstChild("VoteEvent")
            if voteEvent then
                voteEvent:FireServer("Retry")
                Utils.log("REPLAY", "Retry vote submitted")
            end
        end
        return true
    end, "Failed to check replay")
end

function GameFunctions.checkWaveRestart()
    Utils.log("WAVE", "Checking wave count for restart...")
    
    return Utils.safeCall(function()
        local pg = Players.LocalPlayer:FindFirstChild("PlayerGui")
        local hud = pg and pg:FindFirstChild("HUD")
        local waves = hud and hud:FindFirstChild("Map") and hud.Map:FindFirstChild("WavesAmount")
        local current = waves and (waves.ContentText or waves.Text)
        
        if current then
            local waveNum = tonumber(current:match("^(%d+)"))
            if waveNum and waveNum >= 20 then
                local networking = ReplicatedStorage:WaitForChild("Networking")
                local restartEvent = networking:FindFirstChild("MatchRestartSettingEvent")
                if restartEvent then
                    restartEvent:FireServer("Vote")
                    Utils.log("WAVE", "Restart vote submitted at wave %d", waveNum)
                end
            end
        end
        return true
    end, "Failed to check wave restart")
end

function GameFunctions.summonTenSummer()
    local args = {
	"SummonMany",
	"Fall",
	10
}
game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Units"):WaitForChild("SummonEvent"):FireServer(unpack(args))
    task.wait(1)
end


function GameFunctions.deleteModule()
    Utils.log("MODULE", "Deleting AFK Chamber module...")
    
    return Utils.safeCall(function()
        local module = StarterPlayer.Modules.Miscellaneous:FindFirstChild("AFKChamberClient")
        if module then
            module:Destroy()
            Utils.log("MODULE", "AFK Chamber module deleted")
        else
            Utils.log("MODULE", "AFK Chamber module not found")
        end
        return true
    end, "Failed to delete module")
end

function GameFunctions.summonUntilLow()
    Utils.log("SUMMON", "Checking Leaves for summon gate")

    while getattr("Leaves", 0) >= CONFIG.THRESHOLDS.LOBBY_SUMMON do
        local before = getattr("Leaves", 0)

        game:GetService("ReplicatedStorage")
            :WaitForChild("Networking")
            :WaitForChild("Units")
            :WaitForChild("SummonEvent")
            :FireServer("SummonMany", "Fall", 10)

        
        local timeout = os.clock() + 10
        while os.clock() < timeout do
            task.wait(0.2)
            if getattr("Leaves", 0) < before then
                break
            end
        end

        Utils.safeWait(1)
    end

    Utils.log("SUMMON", "Leaves below threshold, exiting summon gate")
    return true
end

-- ==========================================
-- EXECUTION SEQUENCES
-- ==========================================
local function executeLobbySequence()
    Utils.log("MAIN", "=== Starting Lobby Sequence ===")
     GameFunctions.summonUntilLow()
    task.wait(1)
    GameFunctions.equipAllUnits()
    task.wait(1)
    GameFunctions.LobbyFuser()
    
    local playerLevel = getattr("Level", 1)
    local currentLeaves = getattr("Leaves", 0)
    Utils.log("MAIN", "Player level: %d, Leaves: %d", playerLevel, currentLeaves)
    
    
    if currentLeaves >= CONFIG.THRESHOLDS.LOBBY_SUMMON then
        Utils.log("SUMMON", "Leaves %d >= %d → Starting summon sequence (staying in lobby)", currentLeaves, CONFIG.THRESHOLDS.LOBBY_SUMMON)
        
        local summonSequence = {
            {func = GameFunctions.redeemAllCodes, name = "Code Redemption"},
            {func = GameFunctions.completeDialogue, name = "Dialogue Completion"},
            {func = GameFunctions.claimBattlepass, name = "Battlepass Claim"},
            {func = function()
                -- Loop summon until Leaves runs low
                while getattr("Leaves", 0) >= CONFIG.THRESHOLDS.LOBBY_SUMMON do
                    local success = GameFunctions.summonTenSummer()
                    if not success then
                        Utils.log("SUMMON", "Summon failed, stopping summon loop")
                        break
                    end
                    local newAmount = getattr("Leaves", 0)
                    Utils.log("SUMMON", "After summon - Leaves: %d", newAmount)
                    Utils.safeWait(2)
                end
                Utils.log("SUMMON", "Summon loop completed - Leaves below threshold")
                return true
            end, name = "Continuous Summer Summon"}
        }
        
        for _, step in ipairs(summonSequence) do
            Utils.log("SUMMON", "Executing: %s", step.name)
            local success = step.func()
            if not success then
                Utils.log("SUMMON", "%s failed, continuing...", step.name)
            end
            Utils.safeWait()
        end
        
        Utils.log("SUMMON", "=== Summon Sequence Completed ===")
        return
    end
    
    -- Normal match sequence (Leaves < 1500)
    Utils.log("MAIN", "Leaves %d < %d → Entering match mode", currentLeaves, CONFIG.THRESHOLDS.LOBBY_SUMMON)
    local shouldUseSpecialPlace = playerLevel >= 11
    Utils.log("MAIN", "Mode selection: %s", shouldUseSpecialPlace and "Special Place" or "Story Mode")

    local sequence = {
        {func = GameFunctions.redeemAllCodes, name = "Code Redemption"},
        {func = GameFunctions.completeDialogue, name = "Dialogue Completion"},
        {func = GameFunctions.claimBattlepass, name = "Battlepass Claim"},
        
        -- Conditional mode selection based on level
        {func = function()
            if shouldUseSpecialPlace then
                Utils.log("MODE", "Attempting Special Place (Level %d >= 11)", playerLevel)
                local success = GameFunctions.trySpecialPlace()
                if success then
                    Utils.log("MODE", "Special Place entry successful")
                    return true
                else
                    Utils.log("MODE", "Special Place failed, falling back to Story Mode")
                    return GameFunctions.selectStoryMode()
                end
            else
                Utils.log("MODE", "Using Story Mode (Level %d < 11)", playerLevel)
                return GameFunctions.selectStoryMode()
            end
        end, name = "Mode Selection"},
        
        {func = GameFunctions.startMatch, name = "Match Start"},
        {func = GameFunctions.deleteModule, name = "Module Cleanup"}
    }

    for _, step in ipairs(sequence) do
        Utils.log("MAIN", "Executing: %s", step.name)
        local success = step.func()
        if not success then
            Utils.log("MAIN", "%s failed, continuing...", step.name)
        end
        Utils.safeWait()
    end

    Utils.log("MAIN", "=== Lobby Sequence Completed ===")
end





function GameFunctions.startMatchGame()
    Utils.log("MATCH", "Starting match...")
    
    local success = Utils.safeCall(function()
        local lobbyEvent = Utils.waitForChild(
            Utils.waitForChild(ReplicatedStorage, "Networking"),
            "LobbyEvent"
        )
        
        lobbyEvent:FireServer("StartMatch")
        Utils.log("MATCH", "Match started successfully")
    end, "Failed to start match")
    
    return success
end

function GameFunctions.skipWaveGame()
    Utils.log("SKIP", "Skipping current wave...")
    
    local success = Utils.safeCall(function()
        local skipWaveEvent = Utils.waitForChild(
            Utils.waitForChild(ReplicatedStorage, "Networking"),
            "SkipWaveEvent"
        )
        
        skipWaveEvent:FireServer("Skip")
        Utils.log("SKIP", "Wave skipped successfully")
    end, "Failed to skip wave")
    
    return success
end

function GameFunctions.deployUnitsGame()
    Utils.log("DEPLOY", "Deploying units to battlefield...")
    
    local success = Utils.safeCall(function()
        local unitEvent = Utils.waitForChild(
            Utils.waitForChild(ReplicatedStorage, "Networking"),
            "UnitEvent"
        )
        
        for i, position in ipairs(CONFIG.UNIT_POSITIONS) do
            unitEvent:FireServer("Render", {"Luffo", 39, position, 0})
            Utils.log("DEPLOY", "Deployed unit %d at position: %s", i, tostring(position))
            Utils.safeWait(CONFIG.DELAYS.UNIT_PLACE)
        end
        
        Utils.log("DEPLOY", "All units deployed successfully")
    end, "Failed to deploy units")
    
    return success
end

function GameFunctions.upgradeAllUnitsGame()
    Utils.log("UPGRADE", "Upgrading all units...")
    
    local success = Utils.safeCall(function()
        local unitEvent = Utils.waitForChild(
            Utils.waitForChild(ReplicatedStorage, "Networking"), 
            "UnitEvent"
        )
        
        local unitFolder = Utils.waitForChild(workspace, "Units")
        local upgradedCount = 0
        
        for _, unit in ipairs(unitFolder:GetChildren()) do
            if unit:IsA("Model") then
                local uuid = unit.Name
                unitEvent:FireServer("Upgrade", uuid)
                Utils.log("UPGRADE", "Upgraded unit: %s", uuid)
                upgradedCount = upgradedCount + 1
                Utils.safeWait(CONFIG.DELAYS.UNIT_UPGRADE)
            end
        end
        
        Utils.log("UPGRADE", "Upgrade completed! Total units upgraded: %d", upgradedCount)
    end, "Failed to upgrade units")
    
    return success
end

function GameFunctions.configureGameSettingsGame()
    -- Check if settings have already been configured this session
    if GameFunctions._settingsConfigured then
        Utils.log("SETTINGS", "Settings already configured this session, skipping...")
        return true
    end
    
    Utils.log("SETTINGS", "Configuring game settings...")
    
    local success = Utils.safeCall(function()
        local settingsEvent = Utils.waitForChild(
            Utils.waitForChild(
                Utils.waitForChild(ReplicatedStorage, "Networking"),
                "Settings"
            ),
            "SettingsEvent"
        )
        
        for _, settingName in ipairs(CONFIG.UNWANTED_SETTINGS) do
            settingsEvent:FireServer("Toggle", settingName)
            Utils.log("SETTINGS", "Toggled setting: %s", settingName)
            Utils.safeWait(CONFIG.DELAYS.SETTING_TOGGLE)
        end
        
        Utils.log("SETTINGS", "Game settings configured successfully")
        -- Mark settings as configured for this session
        GameFunctions._settingsConfigured = true
    end, "Failed to configure settings")
    
    return success
end

function GameFunctions.removeNotificationsGame()
    Utils.log("CLEANUP", "Removing notifications...")
    
    local success = Utils.safeCall(function()
        local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        local notification = playerGui:FindFirstChild("Notification")
        
        if notification then
            notification:Destroy()
            Utils.log("CLEANUP", "Notifications removed successfully")
        else
            Utils.log("CLEANUP", "No notifications found to remove")
        end
    end, "Failed to remove notifications")
    
    return success
end

function GameFunctions.checkForReplayGame()
    Utils.log("REPLAY", "Checking for replay option...")
    
    return Utils.safeCall(function()
        local networking = ReplicatedStorage:WaitForChild("Networking")
        local endScreen = networking:FindFirstChild("EndScreen")
        if endScreen then
            local voteEvent = endScreen:FindFirstChild("VoteEvent")
            if voteEvent then
                voteEvent:FireServer("Retry")
                Utils.log("REPLAY", "Retry vote submitted")
            end
        end
        return true
    end, "Failed to check replay")
end





local function executeGameSequence()
    Utils.log("MAIN", "=== Starting Game Sequence ===")
    
    -- Check if should teleport to lobby (level > 11 but not in Special Place)
    local playerLevel = getattr("Level", 1)
    if playerLevel > 11 and not isInSpecialPlace() then
        Utils.log("TELEPORT", "Level %d > 11 and not in Special Place → Teleporting to Lobby", playerLevel)
        local success = tpToLobby()
        if success then
            Utils.log("TELEPORT", "Successfully teleported to Lobby")
            return
        else
            Utils.log("TELEPORT", "Failed to teleport, continuing with game sequence")
        end
    end

    local sequence = {
        {func = GameFunctions.skipWaveGame, name = "Wave Skip"},
        {func = GameFunctions.deployUnitsGame, name = "Unit Deployment"},
        {func = GameFunctions.upgradeAllUnitsGame, name = "Unit Upgrades"},
        {func = GameFunctions.configureGameSettingsGame, name = "Settings Configuration"},
        {func = GameFunctions.removeNotificationsGame, name = "Notification Cleanup"},
        {func = GameFunctions.checkForReplayGame, name = "Replay Check"}
    }

    for _, step in ipairs(sequence) do
        if game.PlaceId ~= CONFIG.PLACE_IDS.GAME then
            Utils.log("MAIN", "PlaceId changed - Exiting game sequence")
            break
        end

        Utils.log("MAIN", "Executing: %s", step.name)
        local success = step.func()
        if not success then
            Utils.log("MAIN", "%s failed, continuing...", step.name)
        end
        Utils.safeWait()
    end

    Utils.log("MAIN", "=== Game Sequence Completed ===")
end

local function executeSpecialPlaceSequence()
    Utils.log("SPECIAL", "=== Starting Special Place Sequence ===")
    
    local sequence = {
        {func = GameFunctions.deployUnits, name = "Unit Deployment"},
        {func = GameFunctions.upgradeAllUnits, name = "Unit Upgrades"},
        {func = GameFunctions.skipWave, name = "Wave Skip"},
        {func = GameFunctions.checkForReplay, name = "Replay Check"},
        {func = GameFunctions.checkWaveRestart, name = "Wave Restart Check"}
    }

    for _, step in ipairs(sequence) do
        if not isInSpecialPlace() then
            Utils.log("SPECIAL", "Left Special Place - Exiting sequence")
            break
        end

        Utils.log("SPECIAL", "Executing: %s", step.name)
        local success = step.func()
        if not success then
            Utils.log("SPECIAL", "%s failed, continuing...", step.name)
        end
        Utils.safeWait()
    end

    Utils.log("SPECIAL", "=== Special Place Sequence Completed ===")
end

-- ==========================================
-- MAIN FARM LOGIC
-- ==========================================
local function mainFarmLoop()
    Utils.log("FARM", "=== Main Farm Loop Start ===")
    if getgenv().HasEscanor then
    CONFIG.THRESHOLDS.SPECIAL_PLACE = 5000000  -- ฟาร์มถึง 5M
    Utils.log("ESCANOR", "Escanor owned → Farming until 5,000,000 Leaves")
else
    CONFIG.THRESHOLDS.SPECIAL_PLACE = 300000   -- ฟาร์มถึง 100k ปกติ
    Utils.log("ESCANOR", "Escanor not owned → Farming until 100,000 Leaves")
end
    
    if game.PlaceId == CONFIG.PLACE_IDS.LOBBY then
        Utils.log("FARM", "Currently in Lobby")
        executeLobbySequence()
        return
    end
    
    if game.PlaceId == CONFIG.PLACE_IDS.GAME then
        local playerLevel = getattr("Level", 1)
        local isSpecial = isInSpecialPlace()
        
        Utils.log("FARM", "In Game - Level: %d, Special Place: %s", playerLevel, tostring(isSpecial))
        
        if isSpecial then
            Utils.log("FARM", "Detected Special Place - Using Special Place sequence")
            executeSpecialPlaceSequence()
            
            -- Check if should leave Special Place
            local iced = getattr("Leaves", 0)
            if iced >= CONFIG.THRESHOLDS.SPECIAL_PLACE then
                Utils.log("FARM", "Leaves %d >= %d → Teleporting to Lobby", iced, CONFIG.THRESHOLDS.SPECIAL_PLACE)
                tpToLobby()
            end
        else
            -- Not in Special Place - check if should teleport based on level
            if playerLevel > 11 then
                Utils.log("TELEPORT", "Level %d > 11 and not in Special Place → Teleporting to Lobby", playerLevel)
                local success = tpToLobby()
                if success then
                    Utils.log("TELEPORT", "Successfully teleported to Lobby")
                    return
                else
                    Utils.log("TELEPORT", "Failed to teleport, continuing with game sequence")
                end
            end
            
            Utils.log("FARM", "Using normal Game sequence")
            executeGameSequence()
        end
        return
    end
    
    Utils.log("FARM", "Unknown PlaceId: %d", game.PlaceId)
end

local function startFarmSystem()
    if farmLoaded then return end
    farmLoaded = true
    Utils.log("FARM", "Farm system started successfully")

    task.spawn(function()
        while farmLoaded do
            local success, err = pcall(function()
                mainFarmLoop()
            end)
            if not success then
                Utils.log("FARM", "Error in main farm loop: " .. tostring(err))
                farmLoaded = false
                break
            end
            Utils.safeWait(2)
        end
    end)
end

-- ==========================================
-- UI SYSTEM
-- ==========================================
local uiVisible = true -- Global UI visibility state

local function createUI()
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
    
    if not PlayerGui then
        Utils.log("UI", "Failed to find PlayerGui")
        return nil
    end
    
    -- Cleanup existing UI
    local existingUI = PlayerGui:FindFirstChild("LeavesHUD")
    if existingUI then
        existingUI:Destroy()
        task.wait(0.1) -- Small delay to ensure cleanup
    end
    

    
    -- Create ScreenGui with modern properties
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LeavesHUD"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local uiScale = Instance.new("UIScale")
    uiScale.Scale = 0.6  -- 0.7 = เล็กลง 30%
    uiScale.Parent = screenGui
    
    -- Protected assignment with error handling
    local success = Utils.safeCall(function()
        screenGui.Parent = PlayerGui
    end, "Failed to parent ScreenGui")
    
    if not success then
        screenGui:Destroy()
        return nil
    end
    
    -- Main container with glassmorphism effect (fullscreen)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainContainer"
    mainFrame.Size = UDim2.fromScale(1, 1)
    mainFrame.Position = UDim2.fromScale(0, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 15)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- Modern rounded corners (smaller for fullscreen)
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 0)
    mainCorner.Parent = mainFrame
    
    -- Gradient background (darker for fullscreen)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 20)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 5, 15)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 18))
    }
    gradient.Rotation = 45
    gradient.Parent = mainFrame
    
    -- Remove border for fullscreen
    -- No stroke needed for fullscreen overlay
    
    -- Layout organizer for fullscreen (centered with larger spacing)
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 40)
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Parent = mainFrame
    
    -- Padding for fullscreen (much larger)
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 100)
    padding.PaddingBottom = UDim.new(0, 100)
    padding.PaddingLeft = UDim.new(0, 200)
    padding.PaddingRight = UDim.new(0, 200)
    padding.Parent = mainFrame
    
    -- Title with fullscreen styling (much larger)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.LayoutOrder = 1
    titleLabel.Size = UDim2.new(1, 0, 0, 120)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "ANIME VANGUARDS KIWZU"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextStrokeTransparency = 0.5
    titleLabel.TextStrokeColor3 = Color3.fromRGB(100, 150, 255)
    titleLabel.Parent = mainFrame
    
    -- Utility functions with error handling
    local function formatWithCommas(n)
        n = tonumber(n) or 0
        if n == 0 then return "0" end
        
        local s = tostring(math.floor(math.abs(n)))
        local k
        repeat
            s, k = s:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        until k == 0
        
        return (n < 0 and "-" or "") .. s
    end
    
    local function createStatCard(name, text, iconText, colorRGB, order)
        local card = Instance.new("Frame")
        card.Name = name
        card.LayoutOrder = order
        card.Size = UDim2.new(1, 0, 0, 150)
        card.BackgroundColor3 = Color3.fromRGB(colorRGB[1], colorRGB[2], colorRGB[3])
        card.BackgroundTransparency = 0.15
        card.BorderSizePixel = 0
        card.Parent = mainFrame
        
        -- Card corner (smaller for fullscreen)
        local cardCorner = Instance.new("UICorner")
        cardCorner.CornerRadius = UDim.new(0, 20)
        cardCorner.Parent = card
        
        -- Card gradient (enhanced for visibility)
        local cardGradient = Instance.new("UIGradient")
        cardGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(colorRGB[1] + 20, colorRGB[2] + 20, colorRGB[3] + 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(colorRGB[1], colorRGB[2], colorRGB[3]))
        }
        cardGradient.Rotation = 90
        cardGradient.Parent = card
        
        -- Card border (more visible for fullscreen)
        local cardStroke = Instance.new("UIStroke")
        cardStroke.Thickness = 2
        cardStroke.Color = Color3.fromRGB(255, 255, 255)
        cardStroke.Transparency = 0.5
        cardStroke.Parent = card
        
        -- Icon label (much larger for fullscreen)
        local iconLabel = Instance.new("TextLabel")
        iconLabel.Name = "Icon"
        iconLabel.Size = UDim2.new(0, 120, 1, 0)
        iconLabel.Position = UDim2.new(0, 0, 0, 0)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Text = iconText
        iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        iconLabel.TextScaled = true
        iconLabel.Font = Enum.Font.GothamBold
        iconLabel.Parent = card
        
        -- Value label (much larger text for fullscreen)
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Name = "Value"
        valueLabel.Size = UDim2.new(1, -140, 1, 0)
        valueLabel.Position = UDim2.new(0, 140, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = text
        valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        valueLabel.TextScaled = true
        valueLabel.Font = Enum.Font.GothamSemibold
        valueLabel.TextXAlignment = Enum.TextXAlignment.Left
        valueLabel.Parent = card
        
        return card, valueLabel
    end
    
    -- Create stat cards
    local playerCard, playerValueLabel = createStatCard("PlayerCard", "Loading...", "👤", {60, 80, 120}, 2)
    local LeavesCard, LeavesValueLabel = createStatCard("LeavesCard", "0", "🍃", {40, 120, 80}, 3)
    local levelCard, levelValueLabel = createStatCard("LevelCard", "0", "LEVEL", {120, 80, 40}, 4)
    local expCard, expValueLabel = createStatCard("ExpCard", "0", "EXP", {80, 40, 120}, 5)
    local escanorCard, escanorValueLabel = createStatCard("EscanorCard", "Checking...", "AINZ OWN GOAL", {120, 40, 40}, 6)
    
    -- Modern toggle hint (fullscreen size)
    local toggleHint = Instance.new("TextLabel")
    toggleHint.Name = "ToggleHint"
    toggleHint.LayoutOrder = 7
    toggleHint.Size = UDim2.new(1, 0, 0, 60)
    toggleHint.BackgroundTransparency = 1
    toggleHint.Text = "Press 'B' to toggle UI visibility"
    toggleHint.TextColor3 = Color3.fromRGB(200, 200, 200)
    toggleHint.TextScaled = true
    toggleHint.Font = Enum.Font.GothamMedium
    toggleHint.TextTransparency = 0.3
    toggleHint.Parent = mainFrame
    
    -- Smooth pop animation with bounce effect
    local function popCard(card)
        if not card or not card.Parent then return end
        
        local originalSize = card.Size
        local tween1 = card:TweenSize(
            originalSize + UDim2.new(0, 4, 0, 4),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Back,
            0.15,
            true,
            function()
                if card and card.Parent then
                    card:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.2, true)
                end
            end
        )
    end
    
    -- Update functions with null checks
    local function updatePlayerName()
        if not LocalPlayer or not playerValueLabel then return end
        
        local playerName = LocalPlayer.Name or "Unknown"
        local displayName = LocalPlayer.DisplayName or playerName
        
        local displayText = (displayName ~= playerName) 
            and string.format("%s (@%s)", displayName, playerName)
            or playerName
            
        playerValueLabel.Text = displayText
    end
    
    local function updateLeaves()
        if not LocalPlayer or not LeavesValueLabel then return end
        
        local value = LocalPlayer:GetAttribute("Leaves") or 0
        LeavesValueLabel.Text = formatWithCommas(value)
        Utils.safeCall(function() popCard(LeavesCard) end)
    end
    
    local function updateLevel()
        if not LocalPlayer or not levelValueLabel then return end
        
        local value = LocalPlayer:GetAttribute("Level") or 0
        levelValueLabel.Text = formatWithCommas(value)
        Utils.safeCall(function() popCard(levelCard) end)
    end
    
    local function updateExperience()
        if not LocalPlayer or not expValueLabel then return end
        
        local value = LocalPlayer:GetAttribute("Experience") or 0
        expValueLabel.Text = formatWithCommas(value)
        Utils.safeCall(function() popCard(expCard) end)
    end
    
    -- Initialize with safe calls
    task.spawn(function()
        task.wait(0.5) -- Allow UI to fully load
        Utils.safeCall(updatePlayerName, "Failed to update player name")
        Utils.safeCall(updateLeaves, "Failed to update Leaves")
        Utils.safeCall(updateLevel, "Failed to update level")
        Utils.safeCall(updateExperience, "Failed to update experience")
    end)
    
    -- Protected attribute listeners
    local connections = {}
    
    Utils.safeCall(function()
        connections[#connections + 1] = LocalPlayer:GetAttributeChangedSignal("Leaves"):Connect(function()
            Utils.safeCall(updateLeaves, "Failed in Leaves listener")
        end)
    end, "Failed to connect Leaves listener")
    
    Utils.safeCall(function()
        connections[#connections + 1] = LocalPlayer:GetAttributeChangedSignal("Level"):Connect(function()
            Utils.safeCall(updateLevel, "Failed in Level listener")
        end)
    end, "Failed to connect Level listener")
    
    Utils.safeCall(function()
        connections[#connections + 1] = LocalPlayer:GetAttributeChangedSignal("Experience"):Connect(function()
            Utils.safeCall(updateExperience, "Failed in Experience listener")
        end)
    end, "Failed to connect Experience listener")
    

local TARGET_NAME = "Lich King (Ruler)"

-- แยกฟังก์ชันให้ชัดเจน ไม่ให้เรียกซ้อนกัน
local function findUnitInInventory()
    local player = game:GetService("Players").LocalPlayer
    
    -- ใช้ FindFirstChild แทน WaitForChild เพื่อป้องกัน infinite yield
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    
    local windows = playerGui:FindFirstChild("Windows")
    if not windows then return false end
    
    local globalInv = windows:FindFirstChild("GlobalInventory")
    if not globalInv then return false end
    
    local holder = globalInv:FindFirstChild("Holder")
    if not holder then return false end
    
    local leftContainer = holder:FindFirstChild("LeftContainer")
    if not leftContainer then return false end
    
    local fakeScroll = leftContainer:FindFirstChild("FakeScrollingFrame")
    if not fakeScroll then return false end
    
    local items = fakeScroll:FindFirstChild("Items")
    if not items then return false end
    
    local cache = items:FindFirstChild("CacheContainer")
    if not cache then return false end

    -- ค้นหา unit
    for _, guiItem in ipairs(cache:GetChildren()) do
        if guiItem:IsA("GuiObject") then
            local nameObj = guiItem:FindFirstChild("Container")
            if nameObj then
                nameObj = nameObj:FindFirstChild("Holder")
                if nameObj then
                    nameObj = nameObj:FindFirstChild("Main")
                    if nameObj then
                        nameObj = nameObj:FindFirstChild("UnitName")
                        if nameObj and nameObj.Text == TARGET_NAME then
                            return true
                        end
                    end
                end
            end
        end
    end

    return false
end


getgenv().HasEscanor = false

local function updateEscanor(found)
    if not escanorValueLabel then return end

    if found then
        escanorValueLabel.Text = "OWNED ✓"
        escanorValueLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        pcall(function() popCard(escanorCard) end)
    else
        escanorValueLabel.Text = "NOT OWNED ✗"
        escanorValueLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end

    getgenv().HasEscanor = found
end

local function checkEscanor()
    local success, found = pcall(function()
        
        if UnitWindowHandler and UnitWindowHandler._Cache then
            for _, v in pairs(UnitWindowHandler._Cache) do
                if v and v.UnitData and v.UnitData.Name == TARGET_NAME then
                    return true
                end
            end
        end
        
        
        return findUnitInInventory()
    end)
    
    if success then
        updateEscanor(found)
    else
        escanorValueLabel.Text = "ERROR"
        escanorValueLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
    end
end


task.spawn(function()
    task.wait(2) 
    checkEscanor()
end)

-- ถ้าต้องการเช็คซ้ำ
--[[
task.spawn(function()
    while task.wait(30) do 
        checkEscanor()
    end
end)
]]
    
    task.spawn(function()
        while screenGui and screenGui.Parent do
            task.wait(5)
            if not screenGui or not screenGui.Parent then break end
            Utils.safeCall(checkEscanor, "Failed periodic Escanor check")
        end
    end)
    
    
    local function cleanup()
        for _, connection in ipairs(connections) do
            if connection and connection.Connected then
                connection:Disconnect()
            end
        end
        table.clear(connections)
    end
    
   
    screenGui.AncestryChanged:Connect(function()
        if not screenGui.Parent then
            cleanup()
        end
    end)
    
    Utils.log("UI", "Modern UI created successfully with %d stat cards", 5)
    return screenGui
end

-- ==========================================
-- UI TOGGLE SYSTEM
-- ==========================================
local function setupUIToggle()
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    
    Utils.safeCall(function()
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == Enum.KeyCode.B then
                local ui = PlayerGui:FindFirstChild("LeavesHUD")
                if ui then
                    uiVisible = not uiVisible
                    ui.Enabled = uiVisible
                    Utils.log("UI", "UI %s", uiVisible and "shown" or "hidden")
                else
                    Utils.log("UI", "UI not found for toggle")
                end
            end
        end)
    end, "Failed to setup UI toggle")
    
    Utils.log("UI", "UI toggle setup complete - Press 'B' to toggle visibility")
end

-- ==========================================
-- MAP OPTIMIZATION
-- ==========================================
local function optimizeLargeMap()
    Utils.log("OPTIMIZE", "Starting map optimization...")
    
    local sequence = {
        {func = function()
            local lighting = game:GetService("Lighting")
            lighting.GlobalShadows = false
            lighting.FogEnd = 50
            lighting.Brightness = 1
            lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            
            if UserInputService.TouchEnabled then
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            else
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level03
            end
            return true
        end, name = "Graphics Settings"},
        
        {func = function()
            local map = workspace:FindFirstChild("Map")
            if not map then return false end
            
            local modelsToDelete = {
                "Decoration", "Details", "Props", "Rocks", "Trees", 
                "Grass", "Flowers", "Effects", "Particles", "Lighting"
            }
            
            for _, modelName in ipairs(modelsToDelete) do
                local model = map:FindFirstChild(modelName)
                if model then
                    model:Destroy()
                    Utils.log("OPTIMIZE", "Deleted %s folder", modelName)
                end
            end
            return true
        end, name = "Model Cleanup"},
        
        {func = function()
            local map = workspace:FindFirstChild("Map")
            if not map then return false end
            
            local deletedCount = 0
            local protectedCount = 0
            local KEEP_Y_POSITION = 50
            
            
            local function isProtectedFromOptimization(obj)
                local fullPath = obj:GetFullName()
                
                
                if fullPath:find("Lakepiece2") then
                    return true
                end
                
                
                local protectedNames = {"LTM", "Summer", "Special", "Event"}
                for _, protectedName in ipairs(protectedNames) do
                    if fullPath:find(protectedName) or obj.Name:find(protectedName) then
                        return true
                    end
                end
                
                return false
            end
            
            for _, child in pairs(map:GetDescendants()) do
                if child:IsA("BasePart") and child.Position.Y < KEEP_Y_POSITION then
                    if isProtectedFromOptimization(child) then
                        protectedCount = protectedCount + 1
                        Utils.log("OPTIMIZE", "Protected: %s", child:GetFullName())
                    else
                        child:Destroy()
                        deletedCount = deletedCount + 1
                    end
                end
            end
            
            Utils.log("OPTIMIZE", "Deleted %d parts, Protected %d parts for Special Place detection", deletedCount, protectedCount)
            return true
        end, name = "Part Optimization with Enhanced Protection"}
    }

    for _, step in ipairs(sequence) do
        Utils.log("OPTIMIZE", "Executing: %s", step.name)
        local success = Utils.safeCall(step.func, "Failed: " .. step.name)
        if not success then
            Utils.log("OPTIMIZE", "%s failed, continuing...", step.name)
        end
        Utils.safeWait(0.5)
    end
    
    Utils.log("OPTIMIZE", "Map optimization completed")
end

local function setupAutoOptimization()
    workspace.ChildAdded:Connect(function(child)
        if child.Name == "Map" then
            Utils.log("OPTIMIZE", "New map detected, starting optimization in 3 seconds...")
            task.wait(3)
            optimizeLargeMap()
        end
    end)
end
optimizeLargeMap()
wait(1)
setupAutoOptimization()
-- ==========================================
-- MAIN INITIALIZATION
-- ==========================================
local function initializeScript()
    Utils.log("INIT", "=== Initializing Script ===")
    
    local initSequence = {
        {func = createUI, name = "UI Creation"},
        {func = setupUIToggle, name = "UI Toggle Setup"},
        {func = GameFunctions.cleanupLocalScripts, name = "Script Cleanup"},
        {func = startFarmSystem, name = "Farm System Start"}
    }

    for _, step in ipairs(initSequence) do
        Utils.log("INIT", "Executing: %s", step.name)
        local success = Utils.safeCall(step.func, "Failed to initialize: " .. step.name)
        if not success then
            Utils.log("INIT", "%s failed, continuing...", step.name)
        end
        Utils.safeWait(0.5)
    end

    Utils.log("INIT", "=== Script Initialization Completed ===")
    Utils.log("INFO", "Press 'B' key to toggle UI visibility")
end

-- ==========================================
-- SCRIPT EXECUTION
-- ==========================================
initializeScript()  
