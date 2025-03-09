local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("GAMEKAK", "DarkTheme")
local Tab = Window:NewTab("Farm")
local Section = Tab:NewSection("AutoChop")
local SectionAutoMine = Tab:NewSection("AutoMine")  -- ส่วน UI สำหรับ Auto Mine

-- ฟังก์ชันที่เราจะใช้ในการทำ Auto Chop
local function autoChop()
    local TweenService = game:GetService("TweenService")
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local function findElderwoodWithInteractPrompt()
        local harvestable = workspace:WaitForChild("Harvestable")
        for _, object in pairs(harvestable:GetChildren()) do
            if object.Name == "Elderwood" then
                local interactPrompt = object:FindFirstChild("InteractPrompt")
                if interactPrompt then
                    return object, interactPrompt
                end
            end
        end
        return nil, nil
    end

    while true do
        local elderwood, interactPrompt = findElderwoodWithInteractPrompt()

        if elderwood then
            local choppedTrunk = elderwood:FindFirstChild("ChoppedTrunk")

            if choppedTrunk then
                local targetPosition = choppedTrunk.Position
                local speed = 100
                local distance = (targetPosition - humanoidRootPart.Position).Magnitude
                local time = distance / speed

                humanoidRootPart.CanCollide = false

                local function restoreCollision()
                    humanoidRootPart.CanCollide = true
                end

                local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local tweenGoal = { CFrame = CFrame.new(targetPosition) }
                local tween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)

                tween.Completed:Connect(function()
                    restoreCollision()

                    local args = {
                        [1] = {
                            ["player"] = game:GetService("Players").LocalPlayer,
                            ["Object"] = elderwood,
                            ["Action"] = "Chop"
                        }
                    }

                    local characterHandler = player.Character:FindFirstChild("CharacterHandler")
                    if characterHandler and characterHandler.Input and characterHandler.Input.Events and characterHandler.Input.Events.Interact then
                        characterHandler.Input.Events.Interact:FireServer(unpack(args))
                    else
                        warn("CharacterHandler or Interact Event not found!")
                    end

                    interactPrompt = elderwood:FindFirstChild("InteractPrompt")

                    if not interactPrompt then
                        local newElderwood, newInteractPrompt = findElderwoodWithInteractPrompt()
                        if newElderwood and newInteractPrompt then
                            print("New Elderwood with InteractPrompt found!")
                            elderwood = newElderwood
                            interactPrompt = newInteractPrompt
                        else
                            warn("No new Elderwood with InteractPrompt found!")
                        end
                    else
                        print("InteractPrompt is still in Elderwood!")
                    end
                end)

                tween:Play()
                wait(time)
            else
                warn("ChoppedTrunk not found!")
            end
        else
            warn("Elderwood not found!")
        end

        wait(5)
    end
end

-- ฟังก์ชันที่เราจะใช้ในการทำ Auto Mine
local function autoMine()
    local TweenService = game:GetService("TweenService")
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local function findMithrilWithInteractPrompt()
        -- หาตำแหน่งของ Mithril ที่มี InteractPrompt
        local harvestable = workspace:WaitForChild("Harvestable")
        for _, object in pairs(harvestable:GetChildren()) do
            if object.Name == "Platinum" then
                local interactPrompt = object:FindFirstChild("InteractPrompt")
                if interactPrompt then
                    return object, interactPrompt
                end
            end
        end
        return nil, nil
    end

    while true do
        -- หาตำแหน่ง Mithril และ InteractPrompt ใหม่ทุกครั้งใน loop
        local mithril, interactPrompt = findMithrilWithInteractPrompt()

        if mithril then
            local icosphere = mithril:FindFirstChild("Icosphere")  -- ใช้ Icosphere สำหรับ CFrame
            if icosphere then
                local targetPosition = icosphere.Position  -- ใช้ตำแหน่งของ Icosphere
                local speed = 100
                local distance = (targetPosition - humanoidRootPart.Position).Magnitude
                local time = distance / speed

                humanoidRootPart.CanCollide = false

                local function restoreCollision()
                    humanoidRootPart.CanCollide = true
                end

                local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local tweenGoal = { CFrame = CFrame.new(targetPosition) }
                local tween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)

                tween.Completed:Connect(function()
                    restoreCollision()

                    local args = {
                        [1] = {
                            ["player"] = game:GetService("Players").LocalPlayer,
                            ["Object"] = mithril,
                            ["Action"] = "Mine"
                        }
                    }

                    local characterHandler = player.Character:FindFirstChild("CharacterHandler")
                    if characterHandler and characterHandler.Input and characterHandler.Input.Events and characterHandler.Input.Events.Interact then
                        characterHandler.Input.Events.Interact:FireServer(unpack(args))
                    else
                        warn("CharacterHandler or Interact Event not found!")
                    end

                    interactPrompt = mithril:FindFirstChild("InteractPrompt")
                    
                    if not interactPrompt then
                        local newMithril, newInteractPrompt = findMithrilWithInteractPrompt()
                        if newMithril and newInteractPrompt then
                            print("New Platinum with InteractPrompt found!")
                            mithril = newMithril
                            interactPrompt = newInteractPrompt
                        else
                            warn("No new Platinum with InteractPrompt found!")
                        end
                    else
                        print("InteractPrompt is still in Platinum!")
                    end
                end)

                tween:Play()
                wait(time)
            else
                warn("Icosphere not found!")
            end
        else
            warn("Platinum not found!")
        end

        wait(3)
    end
end

-- ตัวแปรที่ใช้สำหรับควบคุมการทำงานของ `while` loop
local isChopRunning = false
local isMineRunning = false
local runningChopCoroutine = nil
local runningMineCoroutine = nil

-- เชื่อมต่อกับ Toggle UI สำหรับ Auto Chop
Section:NewToggle("Elderwood", "ToggleInfo", function(state)
    if state then
        print("Auto Chop Enabled")
        if not isChopRunning then
            isChopRunning = true
            runningChopCoroutine = coroutine.create(function()
                autoChop()
            end)
            coroutine.resume(runningChopCoroutine)
        end
    else
        print("Auto Chop Disabled")
        isChopRunning = false
        if runningChopCoroutine then
            coroutine.close(runningChopCoroutine)
            runningChopCoroutine = nil
        end
    end
end)

-- เชื่อมต่อกับ Toggle UI สำหรับ Auto Mine
SectionAutoMine:NewToggle("Platinum", "ToggleInfo", function(state)
    if state then
        print("Auto Mine Enabled")
        if not isMineRunning then
            isMineRunning = true
            runningMineCoroutine = coroutine.create(function()
                autoMine()
            end)
            coroutine.resume(runningMineCoroutine)
        end
    else
        print("Auto Mine Disabled")
        isMineRunning = false
        if runningMineCoroutine then
            coroutine.close(runningMineCoroutine)
            runningMineCoroutine = nil
        end
    end
end)

local Tab = Window:NewTab("TP")
local Section = Tab:NewSection("Tween")
Section:NewButton("Buy Scroll", "ButtonInfo", function()
    local TweenService = game:GetService("TweenService")
    
    -- ตำแหน่งเริ่มต้น (ตำแหน่งปัจจุบันของ HumanoidRootPart)
    local startPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    
    -- ตำแหน่งปลายทางที่ต้องการ
    local targetPos = Vector3.new(618.941467, 179.380508, 521.193848)
    
    -- คำนวณระยะทาง
    local distance = (targetPos - startPos).Magnitude
    
    -- กำหนดความเร็ว (ค่าความเร็ว 100)
    local speed = 100
    
    -- คำนวณระยะเวลาที่ต้องการโดยใช้ระยะทางหารด้วยความเร็ว
    local duration = distance / speed
    
    -- ใช้ Tween ด้วยระยะเวลาที่คำนวณ
    local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), 
    {CFrame = CFrame.new(targetPos)}):Play()
end)


local Tab = Window:NewTab("Setting")
local Section = Tab:NewSection("ON/OFF UI")
Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)
