local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScriptLoaderGUI"
gui.ResetOnSpawn = false

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 220)
frame.Position = UDim2.new(0.5, -200, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui
Instance.new("UICorner", frame)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "hector’s sab"
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold

-- Load Button
local loadBtn = Instance.new("TextButton", frame)
loadBtn.Size = UDim2.new(0.9, 0, 0, 50)
loadBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
loadBtn.Text = "Load Script & Teleport"
loadBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadBtn.Font = Enum.Font.Gotham
loadBtn.TextScaled = true
Instance.new("UICorner", loadBtn)

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0.9, 0, 0, 40)
closeBtn.Position = UDim2.new(0.05, 0, 0.75, 0)
closeBtn.Text = "Close Menu"
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.Gotham
closeBtn.TextScaled = true
Instance.new("UICorner", closeBtn)

-- Load + Teleport logic
loadBtn.MouseButton1Click:Connect(function()
	-- Load your GitHub script
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/rjdjjdvkbvlbcpu/hectormenu/refs/heads/main/hack.lua"))()
	end)

	-- Teleport player to their base
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:FindFirstChild("HumanoidRootPart")

	-- Try teleporting to part named "MyBase"
	local basePart = workspace:FindFirstChild("MyBase")

	if basePart and hrp then
		hrp.CFrame = basePart.CFrame + Vector3.new(0, 5, 0)
	else
		local teleportPosition = Vector3.new(0, 10, 0) -- Fallback location
		if hrp then
			hrp.CFrame = CFrame.new(teleportPosition)
		end
	end
end)

-- Close button logic
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
