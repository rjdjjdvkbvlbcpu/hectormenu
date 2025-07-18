local tool = script.Parent
local player = game:GetService("Players").LocalPlayer
local gui = tool:WaitForChild("HectorMenuGui")
local menuFrame = gui:WaitForChild("MenuFrame")
local button = menuFrame:WaitForChild("BrainrotButton")

-- Attach GUI to player's PlayerGui when tool is equipped
tool.Equipped:Connect(function()
	if not gui.Parent or gui.Parent ~= player.PlayerGui then
		gui.Parent = player:WaitForChild("PlayerGui")
	end
	menuFrame.Visible = true
end)

tool.Unequipped:Connect(function()
	menuFrame.Visible = false
end)

-- Teleport player to base when button is clicked
button.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	local basePart = workspace:FindFirstChild("PlayerBase")

	if root and basePart then
		root.CFrame = basePart.CFrame + Vector3.new(0, 3, 0)
		print("🧠 Brainrot activated! Teleported to base.")
	else
		warn("Could not teleport — missing HumanoidRootPart or PlayerBase.")
	end
end)
