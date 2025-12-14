-- fix 101 again
function LobbyFuser()
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
    
    if ackersLevel < STOP_LEVEL then
        SummonEvent:FireServer("SummonTen", SUMMON_BANNER)
        print("🎰 Summon Banner:", SUMMON_BANNER)
    end
end
LobbyFuser()
