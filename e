-- LocalScript to Toggle Fast Walk

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local normalWalkSpeed = 16 -- Default walking speed
local fastWalkSpeed = 99   -- Fast walking speed
local isFastWalking = false

-- Function to toggle walking speed
local function toggleWalkSpeed()
    isFastWalking = not isFastWalking
    if isFastWalking then
        humanoid.WalkSpeed = fastWalkSpeed
        print("Fast walk enabled")
    else
        humanoid.WalkSpeed = normalWalkSpeed
        print("Normal walk enabled")
    end
end

-- Bind toggle to the "F" key
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        toggleWalkSpeed()
    end
end)

-- Ensure walking speed is reset on respawn
player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = normalWalkSpeed
end)
