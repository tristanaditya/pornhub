local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    warn("⚠️ UI failed to loaded!")
    return
else
    print("✓ UI loaded successfully!")
end

local Window = WindUI:CreateWindow({
    Title = "PORNHUB",
    Icon = "rbxassetid://122683047852451",
    Author = "BokepIndo | Fish It",
    Folder = "PORN_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    User = {
        Enabled = false,
        Anonymous = false,
        Callback = function()
            WindUI:SetTheme("Dark")
        end,
    },
})

Window:SetToggleKey(Enum.KeyCode.G)

Window:Tag({
    Title = "Version",
    Color = Color3.fromRGB(0, 255, 0),
    Radius = 17,
})

Window:Tag({
    Title = "Dev",
    Color = Color3.fromRGB(0, 0, 0),
    Radius = 17,
})

WindUI:Notify({
    Title = "PORN HUB Loaded",
    Content = "UI loaded successfully!",
    Duration = 3,
    Icon = "bell",
})

local Tab1 = Window:Tab({
    Title = "Info",
    Icon = "info",
})

local Section = Tab1:Section({
    Title = "Community Support",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab1:Button({
    Title = "Discord",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/jdmX43t5mY")
        end
    end
})

Tab1:Button({
    Title = "WhatsApp",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://whatsapp.com/channel/0029VbAwRihKAwEtwyowt62N")
        end
    end
})

Tab1:Button({
    Title = "Telegram",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://t.me/StreeCoumminty")
        end
    end
})

Tab1:Button({
    Title = "Website",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://stree-hub-nexus.lovable.app/")
        end
    end
})

local Section = Tab1:Section({
    Title = "Every time there is a game update or someone reports something, I will fix it as soon as possible.",
    TextXAlignment = "Left",
    TextSize = 17,
})

------------------ Variable ------------------------
_G.AutoFarm = false
_G.AutoRod = false
local AutoSellAnjay = false
_G.InfiniteJump = false
_G.AutoKaitun = false
_G.Radar = false
_G.AntiAFK = false
_G.AutoReconnect = false

------------------ Fishing logic -------------------
local function charge()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer()
end
local function lempar()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/RequestFishingMinigameStarted"):InvokeServer(-1.233184814453125, 0.9966885368402592, 1761532005.497536)
end
local function catch()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
end
local function cancel()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/CancelFishingInputs"):InvokeServer()
end
local function rod()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/EquipToolFromHotbar"):FireServer(1)
end
local function sell()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/SellAllItems"):InvokeServer()
end
local function radar()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/UpdateFishingRadar"):InvokeServer(true)
end
local function autoon()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/UpdateAutoFishingState"):InvokeServer(true)
    task.wait(0)
end

local function autosell()
    while AutoSellAnjay do
        sell()
        task.wait(selldelay)
    end
end

--------------------------------------- Fishing Logic V2 ------------------------------------------------
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local REBaitSpawned = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/BaitSpawned"]
    REBaitSpawned.OnClientEvent:Connect(function(playerWhoSpawned, baitName, position)
        if _G.Instant then
            wait(0.5)        
     
            pcall(function()
                ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/ChargeFishingRod"]:InvokeServer(2)
                ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/RequestFishingMinigameStarted"]:InvokeServer(-1.25, 1)
            end)
        end
    end)



------------------- Fishing Logic ------------------
local function instant()
    while _G.AutoFarm do
        task.wait(0)
        for i = 1, 15 do
            charge()
            task.wait(0)
            lempar()
            task.wait(0)
        end
        task.wait(delayfishing)
        catch()
        catch()
        catch()
        task.wait(0)
    end
end

local function icancel()
    charge()
    task.wait(0)
    lempar()
    task.wait(0)
    cancel()
    task.wait(20)
end

------------------- Main Tab -----------------------

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "landmark"
})

local MainSection = MainTab:Section({
    Title = "Main",
    TextXAlignment = "Left",
    TextSize = 17,
})

local AutoRod = MainTab:Toggle({
    Title = "Auto Rod",
    Desc = false,
    Icon = false,
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value) 
        _G.AutoRod = Value
        if Value then
            rod()
        else return end
    end
})

-- Pastikan fungsi instant(), autoon(), autooff(), cancel() udah didefinisikan di atas
-- Contoh ini buat WindUI

--// Dropdown Mode
local CurrentOption = "Instant"

local Dropdown = MainTab:Dropdown({
    Title = "Mode",
    Desc = false,
    Values = { "Instant", "Legit" },
    Value = "Instant",
    Multi = false,
    AllowNone = false,
    Callback = function(Option)
        CurrentOption = Option
        WindUI:Notify({
            Title = "Mode Selected",
            Content = "Mode: " .. Option,
            Duration = 3,
            Icon = "check"
        })
    end
})

--// Toggle Auto Farm
local AutoFarm = MainTab:Toggle({
    Title = "Auto Farm",
    Desc = false,
    Icon = false,
    Type = "Toggle",
    Value = false,
    Callback = function(Value)
        _G.AutoFarm = Value

        if Value then
            if CurrentOption == "Instant" then
                WindUI:Notify({
                    Title = "AutoFarm",
                    Content = "Instant Mode ON",
                    Duration = 3
                })
                task.spawn(function()
                    while _G.AutoFarm and CurrentOption == "Instant" do
                        instant()
                        task.wait(0.1)
                    end
                end)
            elseif CurrentOption == "Legit" then
                WindUI:Notify({
                    Title = "AutoFarm",
                    Content = "Legit Mode ON",
                    Duration = 3
                })
                task.spawn(function()
                    while _G.AutoFarm and CurrentOption == "Legit" do
                        autoon()
                        task.wait(1)
                    end
                end)
            end
        else
            WindUI:Notify({
                Title = "AutoFarm",
                Content = "AutoFarm OFF",
                Duration = 3
            })
            autooff()
            cancel()
        end
    end
})


local DelayFishing = MainTab:Slider({
    Title = "Delay",
    Desc = false,
    Step = 0.01,
    Value = {
        Min = 0,
        Max = 5,
        Default = 1,
    },
    Callback = function(Value)
        delayfishing = Value
    end
})

local PremiumSection = MainTab:Section({
    Title = "Premium",
    TextXAlignment = "Left",
    TextSize = 17,
})

local x5 = MainTab:Toggle({
    Title = "Super Instant Fishing",
    Value = _G.Instantt,
    Callback = function(value)
        _G.Instant = value    
    end
})

local Blantant = MainTab:Toggle({
    Title = "Blantant",
    Desc = false,
    Icon = false,
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value) 
        _G.AutoFarm = Value
        _G.Blantant = Value
        if Value then
            while _G.Blantant do
                task.wait(blantantdelay)
                icancel()
            end
        else return end
    end
})

local BlantantFishing = MainTab:Slider({
    Title = "Blantant Delay",
    Desc = false,
    Step = 0.01,
    Value = {
        Min = 0,
        Max = 10,
        Default = 1,
    },
    Callback = function(Value)
        blantantdelay = Value
    end
})

local SellSection = MainTab:Section({
    Title = "Sell",
    Icon = "hand-coins",
    TextXAlignment = "Left",
    TextSize = 17,
})

local AutoSell = MainTab:Toggle({
    Title = "Auto Sell",
    Desc = false,
    Icon = false,
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value) 
        AutoSellAnjay = Value
        if Value then
            autosell()
        end
    end
})

local SellDelay = MainTab:Slider({
    Title = "Sell Delay",
    Desc = false,
    Step = 1,
    Value = {
        Min = 1,
        Max = 120,
        Default = 30,
    },
    Callback = function(Value)
        selldelay = Value
    end
})

------------------ Player Tab ------------------
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local PlayerTab = Window:Tab({
    Title = "Player",
    Icon = "user"
})

local Speed = PlayerTab:Slider({
    Title = "Speed",
    Desc = false,
    Step = 1,
    Value = {
        Min = 18,
        Max = 100,
        Default = 18,
    },
    Callback = function(Value)
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = Value
    end
})

local Jump = PlayerTab:Slider({
    Title = "Jump",
    Desc = false,
    Step = 1,
    Value = {
        Min = 50,
        Max = 500,
        Default = 50,
    },
    Callback = function(Value)
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = Value
    end
})

local UserInputService = game:GetService("UserInputService")

local InfiniteJump = PlayerTab:Toggle({
    Title = "Infinite Jump",
    Desc = false,
    Icon = false,
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value)
        _G.InfiniteJump = Value

        if Value then
            print("✅ Infinite Jump Active")

            -- Buat koneksi satu kali
            InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
                if _G.InfiniteJump then
                    local character = Player.Character or Player.CharacterAdded:Wait()
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        else
            print("❌ Infinite Jump Inactive")
            end
        end
})

local FlyGui = PlayerTab:Button({
    Title = "FlyGui V3",
    Desc = false,
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        Notify("Fly GUI Activated")
    end
})

local Shop = Window:Tab({
    Title = "Shop",
    Icon = "badge-dollar-sign",
})

Shop:Section({   
    Title = "Buy Rod",  
    TextXAlignment = "Left",  
    TextSize = 17,  
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")  
local RFPurchaseFishingRod = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseFishingRod"]  

local rods = {  
    ["Luck Rod"] = 79,  
    ["Carbon Rod"] = 76,  
    ["Grass Rod"] = 85,  
    ["Demascus Rod"] = 77,  
    ["Ice Rod"] = 78,  
    ["Lucky Rod"] = 4,  
    ["Midnight Rod"] = 80,  
    ["Steampunk Rod"] = 6,  
    ["Chrome Rod"] = 7,  
    ["Astral Rod"] = 5,  
    ["Ares Rod"] = 126,  
    ["Angler Rod"] = 168,
    ["Bamboo Rod"] = 258
}  

local rodNames = {  
    "Luck Rod (350 Coins)", "Carbon Rod (900 Coins)", "Grass Rod (1.5k Coins)", "Demascus Rod (3k Coins)",  
    "Ice Rod (5k Coins)", "Lucky Rod (15k Coins)", "Midnight Rod (50k Coins)", "Steampunk Rod (215k Coins)",  
    "Chrome Rod (437k Coins)", "Astral Rod (1M Coins)", "Ares Rod (3M Coins)", "Angler Rod (8M Coins)",
    "Bamboo Rod (12M Coins)"
}  

local rodKeyMap = {  
    ["Luck Rod (350 Coins)"]="Luck Rod",  
    ["Carbon Rod (900 Coins)"]="Carbon Rod",  
    ["Grass Rod (1.5k Coins)"]="Grass Rod",  
    ["Demascus Rod (3k Coins)"]="Demascus Rod",  
    ["Ice Rod (5k Coins)"]="Ice Rod",  
    ["Lucky Rod (15k Coins)"]="Lucky Rod",  
    ["Midnight Rod (50k Coins)"]="Midnight Rod",  
    ["Steampunk Rod (215k Coins)"]="Steampunk Rod",  
    ["Chrome Rod (437k Coins)"]="Chrome Rod",  
    ["Astral Rod (1M Coins)"]="Astral Rod",  
    ["Ares Rod (3M Coins)"]="Ares Rod",  
    ["Angler Rod (8M Coins)"]="Angler Rod",
    ["Bamboo Rod (12M Coins)"]="Bamboo Rod"
}  

local selectedRod = rodNames[1]  

Shop:Dropdown({  
    Title = "Select Rod",  
    Values = rodNames,  
    Value = selectedRod,  
    Callback = function(value)  
        selectedRod = value  
        WindUI:Notify({Title="Rod Selected", Content=value, Duration=3})  
    end  
})  

Shop:Button({  
    Title="Buy Rod",  
    Callback=function()  
        local key = rodKeyMap[selectedRod]  
        if key and rods[key] then  
            local success, err = pcall(function()  
                RFPurchaseFishingRod:InvokeServer(rods[key])  
            end)  
            if success then  
                WindUI:Notify({Title="Rod Purchase", Content="Purchased "..selectedRod, Duration=3})  
            else  
                WindUI:Notify({Title="Rod Purchase Error", Content=tostring(err), Duration=5})  
            end  
        end  
    end  
})

local Section = Shop:Section({
    Title = "Buy Baits",
    TextXAlignment = "Left",
    TextSize = 17,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")  
local RFPurchaseBait = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseBait"]  

local baits = {
    ["TopWater Bait"] = 10,
    ["Lucky Bait"] = 2,
    ["Midnight Bait"] = 3,
    ["Chroma Bait"] = 6,
    ["Dark Mater Bait"] = 8,
    ["Corrupt Bait"] = 15,
    ["Aether Bait"] = 16
}

local baitNames = {
    "TopWater Bait (100 Coins)",
    "Lucky Bait (1k Coins)",
    "Midnight Bait (3k Coins)",
    "Chroma Bait (290k Coins)",
    "Dark Mater Bait (630k Coins)",
    "Corrupt Bait (1.15M Coins)",
    "Aether Bait (3.7M Coins)"
}

local baitKeyMap = {
    ["TopWater Bait (100 Coins)"] = "TopWater Bait",
    ["Lucky Bait (1k Coins)"] = "Lucky Bait",
    ["Midnight Bait (3k Coins)"] = "Midnight Bait",
    ["Chroma Bait (290k Coins)"] = "Chroma Bait",
    ["Dark Mater Bait (630k Coins)"] = "Dark Mater Bait",
    ["Corrupt Bait (1.15M Coins)"] = "Corrupt Bait",
    ["Aether Bait (3.7M Coins)"] = "Aether Bait"
}

local selectedBait = baitNames[1]  

Shop:Dropdown({  
    Title = "Select Bait",  
    Values = baitNames,  
    Value = selectedBait,  
    Callback = function(value)  
        selectedBait = value  
    end  
})  

Shop:Button({  
    Title = "Buy Bait",  
    Callback = function()  
        local key = baitKeyMap[selectedBait]  
        if key and baits[key] then  
            local success, err = pcall(function()  
                RFPurchaseBait:InvokeServer(baits[key])  
            end)  
            if success then  
                WindUI:Notify({Title = "Bait Purchase", Content = "Purchased " .. selectedBait, Duration = 3})  
            else  
                WindUI:Notify({Title = "Bait Purchase Error", Content = tostring(err), Duration = 5})  
            end  
        end  
    end  
})

local Section = Shop:Section({
    Title = "Buy Weather Event",
    TextXAlignment = "Left",
    TextSize = 17,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")  
local RFPurchaseWeatherEvent = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseWeatherEvent"]  

local weatherEvents = {  
    ["Windy"] = 10000,  
    ["Cloudy"] = 20000,  
    ["Stormy"] = 35000,  
    ["Shining"] = 50000,  
    ["Shark Hunt"] = 300000,  
    ["Snow"] = 15000  
}  

local weatherNames = {  
    "Windy (10k Coins)", "Cloudy (20k Coins)", "Stormy (35k Coins)", 
    "Shining (50k Coins)", "Shark Hunt (300k Coins)", "Snow (15k Coins)"  
}  

local weatherKeyMap = {  
    ["Windy (10k Coins)"] = "Windy",  
    ["Cloudy (20k Coins)"] = "Cloudy",  
    ["Stormy (35k Coins)"] = "Stormy",  
    ["Shining (50k Coins)"] = "Shining",  
    ["Shark Hunt (300k Coins)"] = "Shark Hunt",  
    ["Snow (15k Coins)"] = "Snow"  
}  

local selectedWeather = weatherNames[1]  

Shop:Dropdown({  
    Title = "Select Weather Event",  
    Values = weatherNames,  
    Value = selectedWeather,  
    Callback = function(value)  
        selectedWeather = value  
    end  
})  

Shop:Button({  
    Title = "Buy Weather Event",  
    Callback = function()  
        local key = weatherKeyMap[selectedWeather]  
        if key and weatherEvents[key] then  
            local success, err = pcall(function()  
                RFPurchaseWeatherEvent:InvokeServer(weatherEvents[key])  
            end)  
            if success then  
                WindUI:Notify({Title = "Weather Purchase", Content = "Purchased " .. selectedWeather, Duration = 3})  
            else  
                WindUI:Notify({Title = "Weather Purchase Error", Content = tostring(err), Duration = 5})  
            end  
        end  
    end  
})

local TeleportTab = Window:Tab({
    Title = "Teleport",
    Icon = "map-pin",
})

local Section = TeleportTab:Section({ 
    Title = "Island",
    TextXAlignment = "Left",
    TextSize = 17,
})

local IslandLocations = {
    ["Fisherman Island"] = Vector3.new(-175, 3, 2772),
    ["Ancient Jungle"] = Vector3.new(1518, 1, -186),
    ["Sacred Temple"] = Vector3.new(1498, -23, -644),
    ["Coral Refs"] = Vector3.new(-2855, 47, 1996),
    ["Crater Island"] = Vector3.new(997, 1, 5012),
    ["Enchant Room"] = Vector3.new(3221, -1303, 1406),
    ["Enchant Room 2"] = Vector3.new(1480, 126, -585),
    ["Esoteric Island"] = Vector3.new(1990, 5, 1398),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Kohana Volcano"] = Vector3.new(-545.302429, 17.1266193, 118.870537),
    ["Lost Isle"] = Vector3.new(-3643, 1, -1061),
    ["Sysyphus Statue"] = Vector3.new(-3783.26807, -135.073914, -949.946289),
    ["Treasure Room"] = Vector3.new(-3600, -267, -1575),
    ["Tropical Grove"] = Vector3.new(-2091, 6, 3703),
    ["Weather Machine"] = Vector3.new(-1508, 6, 1895),
    ["Halloween"] = Vector3.new(2106, 81, 3295),
    ["Admin Event"] = Vector3.new(-1981, -442, 7428),
    ["Crystal Cavern"] = Vector3.new(-1841, -456, 7186),
    ["Underground Cellar"] = Vector3.new(2135, -93, -701),
}

local SelectedIsland = nil

local IslandDropdown = TeleportTab:Dropdown({
    Title = "Select Island",
    Values = (function()
        local keys = {}
        for name in pairs(IslandLocations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedIsland = Value
    end
})

TeleportTab:Button({
    Title = "Teleport to Island",
    Callback = function()
        if SelectedIsland and IslandLocations[SelectedIsland] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(IslandLocations[SelectedIsland])
        end
    end
})

local Section = TeleportTab:Section({ 
    Title = "Fishing Spot",
    TextXAlignment = "Left",
    TextSize = 17,
})

local FishingLocations = {
    ["Coral Refs"] = Vector3.new(-2855, 47, 1996),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Levers 1"] = Vector3.new(1475,4,-847),
    ["Levers 2"] = Vector3.new(882,5,-321),
    ["levers 3"] = Vector3.new(1425,6,126),
    ["levers 4"] = Vector3.new(1837,4,-309),
    ["Sacred Temple"] = Vector3.new(1475,-22,-632),
    ["Spawn"] = Vector3.new(33, 9, 2810),
    ["Sysyphus Statue"] = Vector3.new(-3693,-136,-1045),
    ["Underground Cellar"] = Vector3.new(2135,-92,-695),
    ["Volcano"] = Vector3.new(-632, 55, 197),
}

local SelectedFishing = nil

local FishingDropdown = TeleportTab:Dropdown({
    Title = "Select Spot",
    Values = (function()
        local keys = {}
        for name in pairs(FishingLocations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedFishing = Value
    end
})

TeleportTab:Button({
    Title = "Teleport to Fishing Spot",
    Callback = function()
        if SelectedFishing and FishingLocations[SelectedFishing] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(FishingLocations[SelectedFishing])
        end
    end
})

local Section = TeleportTab:Section({
    Title = "Location NPC",
    TextXAlignment = "Left",
    TextSize = 17,
})

local NPC_Locations = {
    ["Alex"] = Vector3.new(43,17,2876),
    ["Aura kid"] = Vector3.new(70,17,2835),
    ["Billy Bob"] = Vector3.new(84,17,2876),
    ["Boat Expert"] = Vector3.new(32,9,2789),
    ["Esoteric Gatekeeper"] = Vector3.new(2101,-30,1350),
    ["Jeffery"] = Vector3.new(-2771,4,2132),
    ["Joe"] = Vector3.new(144,20,2856),
    ["Jones"] = Vector3.new(-671,16,596),
    ["Lava Fisherman"] = Vector3.new(-593,59,130),
    ["McBoatson"] = Vector3.new(-623,3,719),
    ["Ram"] = Vector3.new(-2838,47,1962),
    ["Ron"] = Vector3.new(-48,17,2856),
    ["Scott"] = Vector3.new(-19,9,2709),
    ["Scientist"] = Vector3.new(-6,17,2881),
    ["Seth"] = Vector3.new(107,17,2877),
    ["Silly Fisherman"] = Vector3.new(97,9,2694),
    ["Tim"] = Vector3.new(-604,16,609),
}

local SelectedNPC = nil

local NPCDropdown = TeleportTab:Dropdown({
    Title = "Select NPC",
    Values = (function()
        local keys = {}
        for name in pairs(NPC_Locations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedNPC = Value
    end
})

TeleportTab:Button({
    Title = "Teleport to NPC",
    Callback = function()
        if SelectedNPC and NPC_Locations[SelectedNPC] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(NPC_Locations[SelectedNPC])
        end
    end
})

local Section = TeleportTab:Section({
    Title = "Event Teleporter",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Event_Locations = {
    ["Black Hole"] = Vector3.new(883, -1.4, 2542),
    ["Ghost Shark Hunt"] = Vector3.new(489.559, -1.35, 25.406),
    ["Megalodon Hunt"] = Vector3.new(-1076.3, -1.4, 1676.2),
    ["Meteor Rain"] = Vector3.new(383, -1.4, 2452),
    ["Shark Hunt"] = Vector3.new(1.65, -1.35, 2095.725),
    ["Storm Hunt"] = Vector3.new(1735.85, -1.4, -208.425),
    ["Worm Hunt"] = Vector3.new(1591.55, -1.4, -105.925),
}

local ActiveEvent = nil

local EventDropdown = TeleportTab:Dropdown({
    Title = "Select Event",
    Values = (function()
        local keys = {}
        for name in pairs(Event_Locations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        ActiveEvent = Value
    end
})

TeleportTab:Button({
    Title = "Teleport to Event",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Char = Player.Character or Player.CharacterAdded:Wait()
        local HRP = Char:FindFirstChild("HumanoidRootPart")
        if not HRP then return end
        if ActiveEvent and Event_Locations[ActiveEvent] then
            HRP.CFrame = CFrame.new(Event_Locations[ActiveEvent])
        end
    end
})

local SettingsTab = Window:Tab({
    Title = "Settings",
    Icon = "settings",
})

local Toggle = SettingsTab:Toggle({
    Title = "AntiAFK",
    Desc = "Prevent Roblox from kicking you when idle",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.AntiAFK = state
        local VirtualUser = game:GetService("VirtualUser")

        if state then
            task.spawn(function()
                while _G.AntiAFK do
                    task.wait(60)
                    pcall(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                end
            end)

            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AntiAFK loaded!",
                Text = "Coded By nat.sh",
                Button1 = "Nigger",
                Duration = 5
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AntiAFK Disabled",
                Text = "Stopped AntiAFK",
                Duration = 3
            })
        end
    end
})

local Toggle = SettingsTab:Toggle({
    Title = "Auto Reconnect",
    Desc = "Automatic reconnect if disconnected",
    Icon = false,
    Default = false,
    Callback = function(state)
        _G.AutoReconnect = state
        if state then
            task.spawn(function()
                while _G.AutoReconnect do
                    task.wait(2)

                    local reconnectUI = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
                    if reconnectUI then
                        local prompt = reconnectUI:FindFirstChild("promptOverlay")
                        if prompt then
                            local button = prompt:FindFirstChild("ButtonPrimary")
                            if button and button.Visible then
                                firesignal(button.MouseButton1Click)
                            end
                        end
                    end
                end
            end)
        end
    end
})

local Section = SettingsTab:Section({ 
    Title = "Server",
    TextXAlignment = "Left",
    TextSize = 17,
})

SettingsTab:Button({
    Title = "Rejoin Server",
    Desc = "Reconnect to current server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

SettingsTab:Button({
    Title = "Server Hop",
    Desc = "Switch to another server",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        
        local function GetServers()
            local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"
            local response = HttpService:JSONDecode(game:HttpGet(url))
            return response.data
        end

        local function FindBestServer(servers)
            for _, server in ipairs(servers) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    return server.id
                end
            end
            return nil
        end

        local servers = GetServers()
        local serverId = FindBestServer(servers)

        if serverId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
        else
            warn("⚠️ No suitable server found!")
        end
    end
})

-- Server Script (ServerScriptService)
local HttpService = game:GetService("HttpService")

-- Ganti dengan webhook lo sendiri (jangan pake webhook orang lain)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1341830187570040892/vBVgvQe71bRJW1TF0QtgSH8S3cZeRvn-4hIVwBnN1pPc6Dyw8OOoibKwtNNKXG79Qllu"

-- Helper: kirim payload ke webhook (embed)
local function sendWebhookEmbed(title, description, fields)
    local embed = {
        ["title"] = title or "",
        ["description"] = description or "",
        ["color"] = 65280, -- angka warna (decimal)
        ["fields"] = fields or {},
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ") -- UTC ISO timestamp
    }

    local payload = {
        username = "Roblox Bot",
        embeds = { embed },
    }

    local ok, err = pcall(function()
        HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
    end)

    if not ok then
        warn("[Webhook] failed:", err)
    else
        print("[Webhook] sent:", title)
    end
end

-- Simple helper: kirim text message biasa (tanpa embed)
local function sendWebhookText(content)
    local payload = { content = content, username = "Roblox Bot" }
    local ok, err = pcall(function()
        HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
    end)

    if not ok then
        warn("[Webhook] failed:", err)
    else
        print("[Webhook] sent text")
    end
end

-- Contoh pemakaian (pastikan ini dipanggil dari server-side dengan data yang aman)
-- Contoh embed fields: { { name = "Player", value = "PlayerName", inline = true }, ... }
sendWebhookEmbed("🎣 Fish Caught", "Player caught a rare fish!", {
    { name = "Player", value = "ExamplePlayer", inline = true },
    { name = "Fish", value = "Golden Tuna", inline = true },
    { name = "Rarity", value = "Legendary", inline = true },
})

-- atau kirim pesan biasa
-- sendWebhookText("Server started at "..tostring(os.time()))
