
-- Zollex GUI Script: Multi-Feature UI (Speed, Skins, Abilities, Teleport, Shop, etc.)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "ZollexGUI"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- UI Animation
mainFrame:TweenPosition(UDim2.new(0.5, -150, 0.5, -200), "Out", "Bounce", 1)
mainFrame.Visible = true

-- UIListLayout
local layout = Instance.new("UIListLayout", mainFrame)
layout.Padding = UDim.new(0, 5)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Create Button Function
local function createButton(text, callback)
    local btn = Instance.new("TextButton", mainFrame)
    btn.Size = UDim2.new(0, 250, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(callback)
end

-- Speed Boost Button
local isBoosted = false
createButton("Toggle Speed Boost", function()
    if isBoosted then
        humanoid.WalkSpeed = 16
    else
        humanoid.WalkSpeed = 50
    end
    isBoosted = not isBoosted
end)

-- Skin Changer
local skins = {"Really red", "Bright blue", "Bright yellow"}
local currentSkin = 1
createButton("Change Skin", function()
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new(skins[currentSkin])
        end
    end
    currentSkin = currentSkin % #skins + 1
end)

-- Ability Trigger
createButton("Activate Dash Ability", function()
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = root.CFrame.lookVector * 100
    end
end)

-- Teleport Buttons
createButton("Teleport to Spawn", function()
    char:MoveTo(Vector3.new(0, 10, 0))
end)
createButton("Teleport to Arena", function()
    char:MoveTo(Vector3.new(100, 10, 100))
end)
createButton("Teleport to Training", function()
    char:MoveTo(Vector3.new(-100, 10, -100))
end)

-- Dummy Spawner
createButton("Spawn Dummy", function()
    local dummy = Instance.new("Part", workspace)
    dummy.Size = Vector3.new(2, 5, 2)
    dummy.Position = char.HumanoidRootPart.Position + Vector3.new(5, 0, 0)
    dummy.Anchored = true
    dummy.BrickColor = BrickColor.new("Medium stone grey")
end)

-- Stat GUI Popup
createButton("Show Stats", function()
    local statsGui = Instance.new("TextLabel", screenGui)
    statsGui.Size = UDim2.new(0, 200, 0, 100)
    statsGui.Position = UDim2.new(0.5, -100, 0.1, 0)
    statsGui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    statsGui.BackgroundTransparency = 0.3
    statsGui.TextColor3 = Color3.new(1,1,1)
    statsGui.TextSize = 16
    statsGui.Font = Enum.Font.Gotham
    statsGui.Text = "Speed: " .. humanoid.WalkSpeed .. "\nHealth: " .. humanoid.Health
    wait(3)
    statsGui:Destroy()
end)

-- Daily Reward System (one-time for demo)
local received = false
createButton("Claim Daily Gift", function()
    if not received then
        received = true
        print("Gift claimed! +500 Coins")
        local msg = Instance.new("TextLabel", screenGui)
        msg.Size = UDim2.new(0, 250, 0, 50)
        msg.Position = UDim2.new(0.5, -125, 0.9, 0)
        msg.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        msg.Text = "You received +500 Coins!"
        msg.TextColor3 = Color3.new(1,1,1)
        msg.TextSize = 18
        msg.Font = Enum.Font.Gotham
        wait(3)
        msg:Destroy()
    end
end)
