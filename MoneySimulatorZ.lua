local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Gay HUB", "DarkTheme")
local Tab = Window:NewTab("Auto Fram")
local Section = Tab:NewSection("Auto Frame")

Section:NewToggle("Auto Click", "Click To Frame", function(C)
_G.Click = C
while _G.Click do wait ()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GenerateFaster"):FireServer()
    end
end)

Section:NewToggle("Auto ClickGem", "Click To Frame", function(CG)
_G.ClickGem = CG
while _G.ClickGem do wait ()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BoostGem"):FireServer()
    end
end)

Section:NewToggle("Auto Frame Gem", "Click To Frame", function(G)
 _G.Gem = G
while _G.Gem do wait()
for i,v in pairs(game:GetService("Workspace").Factory.Gems:GetDescendants()) do
    if v.Name == "TouchInterest" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
    wait(.1)
end
end
end
end)

local Tab = Window:NewTab("Auto Upgrade")
local Section = Tab:NewSection("Auto Upgrade")

Section:NewToggle("Auto Upgrade Slot1", "Click To Upgrade", function(S1)
    _G.UpgradeSlot1 = S1
    while _G.UpgradeSlot1 do wait ()
    local args = {
        [1] = 1,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UpgradeMachine"):FireServer(unpack(args))
    local args = {
        [1] = 1,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMoreMachines"):FireServer(unpack(args))

        end
    end)

Section:NewToggle("Auto Upgrade Slot2", "Click To Upgrade", function(S2)
    _G.UpgradeSlot2 = S2
    while _G.UpgradeSlot2 do wait ()
    local args = {
        [1] = 2,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UpgradeMachine"):FireServer(unpack(args))
    local args = {
        [1] = 2,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMoreMachines"):FireServer(unpack(args))

        end
    end)

Section:NewToggle("Auto Upgrade Slot3", "Click To Upgrade", function(S3)
    _G.UpgradeSlot3 = S3
    while _G.UpgradeSlot3 do wait ()
    local args = {
        [1] = 3,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UpgradeMachine"):FireServer(unpack(args))
    local args = {
        [1] = 3,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMoreMachines"):FireServer(unpack(args))
        end
    end)

Section:NewToggle("Auto Upgrade Slot4", "Click To Upgrade", function(S4)
    _G.UpgradeSlot4 = S4
    while _G.UpgradeSlot3 do wait ()
    local args = {
        [1] = 4,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UpgradeMachine"):FireServer(unpack(args))
    local args = {
        [1] = 4,
        [2] = 1,
        [3] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMoreMachines"):FireServer(unpack(args))
        end
    end)

local Tab = Window:NewTab("Auto BuyMachine")
local Section = Tab:NewSection("Auto BuyMachine")

Section:NewToggle("Auto BuyMachine", "Click To BuyMachine", function(B1)
    _G.BuyMachineSlot1 = B1
    while _G.BuyMachineSlot1 do wait ()
        local args = {
        [1] = 1,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 2,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 3,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 4,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 5,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 6,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 7,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 8,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
            local args = {
        [1] = 9,
        [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyMachine"):FireServer(unpack(args))
        end
    end)

local Tab = Window:NewTab("Auto UpFactory")
local Section = Tab:NewSection("Auto UpFactory")

Section:NewToggle("Auto UpFactory", "Click To UpFactory", function(UF)
    _G.UpFactory = UF
    while _G.UpFactory do wait ()
        local args = {
    [1] = 1,
    [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FactoryUpgrade"):FireServer(unpack(args))
    local args = {
    [1] = 2,
    [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FactoryUpgrade"):FireServer(unpack(args))
    local args = {
    [1] = 3,
    [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FactoryUpgrade"):FireServer(unpack(args))
    local args = {
    [1] = 4,
    [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FactoryUpgrade"):FireServer(unpack(args))
    local args = {
    [1] = 5,
    [2] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FactoryUpgrade"):FireServer(unpack(args))
        end
    end)

local Tab = Window:NewTab("Setting")
local Section = Tab:NewSection("OFF/ON")
Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

Section:NewButton("AntiAFK", "AntiAFK", function()
    loadstring(game:GetObjects("rbxassetid://14713089094")[1].Source)()
end)
