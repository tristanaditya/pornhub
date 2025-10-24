if game.PlaceId == 121864768012064 then
    local player = game.Players.LocalPlayer
    local udinui = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    local Window = udinui:CreateWindow({
        Title = "Seraphin",
        Icon = "rbxassetid://120248611602330",
        Author = "nat.sh | Fish It",
        Folder = "SERAPHIN_HUB",
        Size = UDim2.fromOffset(280, 320),
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 170,
        HasOutline = true
    })
    Window:EditOpenButton({
        Title = "PornHub",
        Icon = "fish",
        CornerRadius = UDim.new(0,16),
        StrokeThickness = 2,
        Color = ColorSequence.new( -- gradient
            Color3.fromHex("FF0F7B"), 
            Color3.fromHex("F89B29")
        ),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    })

    -------------- Variable --------------
    local AutoRodEnabled = false
    local autoFarmEnabled = false
    local autoSellEnabled = false
    local antiAFKEnabled = false
    local autoResetEnabled = false
    local blantantEnabled = false

    -------------- Logic -----------------
    local function instant()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer(1760263259.772593)
        task.wait(0)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/RequestFishingMinigameStarted"):InvokeServer(1, 1)
        task.wait(0)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
        task.wait(0)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
        task.wait(0)
    end
    local function catch()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
        task.wait(0)
    end
    local function icancel()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer(1760263259.772593)
        task.wait(0)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/RequestFishingMinigameStarted"):InvokeServer(1, 1)
        task.wait(0)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/CancelFishingInputs"):InvokeServer()
        task.wait(0)
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

    --------------------- AutoFarm ----------------------
    local function autofarm()
        while autoFarmEnabled do
        for i = 1, 8 do
            instant()
            task.wait(0)
        end
        end
    end
    
    local function blantant()
        while blantantEnabled do
            icancel()
            task.wait(0)
            cancel()
            task.wait(delay)
        end
    end

    --------------------- Auto Sell -----------------------
    local function autosell()
        while autoSellEnabled do
            sell()
            task.wait(selldelay)
        end
    end

    ------------------- Tab --------------------------------
    local FarmTab = Window:Tab({
    Title = "AutoFarm",
    Icon = "anchor", -- optional
    Locked = false,
    }, AutoFarm)

    ------------------- AutoFarm Ui -------------------------
    local AutoFarm = FarmTab:Toggle({
    Title = "AutoFarm",
    Desc = "Click to start",
    Icon = "fish",
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value) 
        autoFarmEnabled = Value
        if Value then
            autofarm()
        else
            cancel()
        end
    end
    })
    local Blantants = FarmTab:Toggle({
    Title = "Blantant",
    Desc = "Click to start",
    Icon = "fish",
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value) 
        blantantEnabled = Value
        if Value then
            blantant()
        else return
        end
    end
    })
    local blantantdelay = FarmTab:Slider({
    Title = "Blantant Delay",
    Desc = "Blantant Delay",
    Step = 0.01,
    Value = {
        Min = 0,
        Max = 3,
        Default = 1,
    },
    Callback = function(Value)
        delay = Value
    end
})
local Autosell = FarmTab:Toggle({
    Title = "Auto Sell",
    Desc = "Click to start",
    Icon = "fish",
    Type = "Toggle",
    Value = false, -- default value
    Callback = function(Value) 
        autoSellEnabled = Value
        if Value then
            autosell()
        else return
        end
    end
    })
 local selldelay = FarmTab:Slider({
    Title = "Sell Delay",
    Desc = "Sell Delay",
    Step = 1,
    Value = {
        Min = 1,
        Max = 120,
        Default = 1,
    },
    Callback = function(Value)
        selldelay = Value
    end
})

end
