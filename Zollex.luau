-- إعدادات GUI
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local MeleeButton = Instance.new("TextButton")
local FruitsButton = Instance.new("TextButton")
local GunButton = Instance.new("TextButton")
local AutoFarmButton = Instance.new("TextButton")

ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.Name = "AutoFarmGUI"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 250)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- إعداد الأزرار لاختيار الأسلوب
MeleeButton.Parent = Frame
MeleeButton.Size = UDim2.new(0, 180, 0, 50)
MeleeButton.Position = UDim2.new(0, 10, 0, 10)
MeleeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
MeleeButton.Text = "Melee"
MeleeButton.MouseButton1Click:Connect(function()
    SelectedMode = "Melee"
end)

FruitsButton.Parent = Frame
FruitsButton.Size = UDim2.new(0, 180, 0, 50)
FruitsButton.Position = UDim2.new(0, 10, 0, 70)
FruitsButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
FruitsButton.Text = "Blox Fruits"
FruitsButton.MouseButton1Click:Connect(function()
    SelectedMode = "Fruits"
end)

GunButton.Parent = Frame
GunButton.Size = UDim2.new(0, 180, 0, 50)
GunButton.Position = UDim2.new(0, 10, 0, 130)
GunButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
GunButton.Text = "Gun"
GunButton.MouseButton1Click:Connect(function()
    SelectedMode = "Gun"
end)

-- إعداد زر Auto Farm
AutoFarmButton.Parent = Frame
AutoFarmButton.Size = UDim2.new(0, 180, 0, 50)
AutoFarmButton.Position = UDim2.new(0, 10, 0, 190)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(255, 255, 100)
AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.MouseButton1Click:Connect(function()
    if SelectedMode == "Melee" then
        AutoFarmMelee()
    elseif SelectedMode == "Fruits" then
        AutoFarmFruits()
    elseif SelectedMode == "Gun" then
        AutoFarmGun()
    else
        warn("Please select a mode first!")
    end
end)

-- Anti-ban function
local function AntiBan()
    while true do
        wait(1)
        -- أضف التأخيرات الطبيعية
        local delay = math.random(2, 5)
        wait(delay)
    end
end

-- وظائف Auto Farm لكل نوع
function AutoFarmMelee()
    while true do
        -- مثال: تدريب على NPCs في مكان معين
        local enemy = workspace.Enemies:FindFirstChild("Pirate")
        if enemy and enemy:FindFirstChild("HumanoidRootPart") then
            -- نقل الشخصية إلى العدو
            Player.Character:MoveTo(enemy.HumanoidRootPart.Position)
            -- تنفيذ الهجوم (بافتراض أن لديك حركة Melee جاهزة)
            -- Code for attacking with Melee
            wait(2)
        end
        wait(1)
    end
end

function AutoFarmFruits()
    while true do
        -- مثال: تدريب على NPCs باستخدام Blox Fruits
        local enemy = workspace.Enemies:FindFirstChild("Pirate")
        if enemy and enemy:FindFirstChild("HumanoidRootPart") then
            -- التحرك للهجوم على العدو باستخدام Blox Fruits
            Player.Character:MoveTo(enemy.HumanoidRootPart.Position)
            -- Code for Blox Fruits attack
            wait(2)
        end
        wait(1)
    end
end

function AutoFarmGun()
    while true do
        -- مثال: تدريب باستخدام Gun على الأعداء
        local enemy = workspace.Enemies:FindFirstChild("Pirate")
        if enemy and enemy:FindFirstChild("HumanoidRootPart") then
            -- التحرك للهجوم باستخدام Gun
            Player.Character:MoveTo(enemy.HumanoidRootPart.Position)
            -- Code for Gun attack
            wait(2)
        end
        wait(1)
    end
end

-- بدء Anti-Ban مع تشغيل السكربت
spawn(AntiBan)
