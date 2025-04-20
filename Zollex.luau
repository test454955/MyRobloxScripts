-- LocalScript داخل StarterPlayerScripts أو أي مكان مناسب

-- Get player and character
local player = game.Players.LocalPlayer
local originalSpeed = 16 -- السرعة الأصلية
local fastSpeed = 50
local isFast = false

-- Create the GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 1, 200)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
mainFrame:TweenPosition(UDim2.new(0.5, -100, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1, true)

-- UICorner for smooth rounded edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Speed Button
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0.8, 0, 0.5, 0)
speedButton.Position = UDim2.new(0.1, 0, 0.25, 0)
speedButton.Text = "Speed"
speedButton.Font = Enum.Font.GothamBold
speedButton.TextSize = 24
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
speedButton.Parent = mainFrame

-- Rounded button
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = speedButton

-- Button animation effect
local UIS = game:GetService("UserInputService")

speedButton.MouseEnter:Connect(function()
	speedButton:TweenSize(UDim2.new(0.85, 0, 0.55, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)

speedButton.MouseLeave:Connect(function()
	speedButton:TweenSize(UDim2.new(0.8, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)

-- Button functionality
speedButton.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")

	if isFast then
		humanoid.WalkSpeed = originalSpeed
	else
		humanoid.WalkSpeed = fastSpeed
	end
	isFast = not isFast
end)
