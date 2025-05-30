function cg(name, value) if _G[name] == nil then _G[name] = value end end

cg(ImmortalToggle, true)
cg(UltraInstinct, true)
cg(DeleteDuration, 0.5)
local Players = game:GetService("Players")
local HitboxesFolder = workspace:FindFirstChild("Hitboxes")

pcall(function()
    workspace.fakeHitboxes:Destroy()
end)

local FakeHitboxes = Instance.new("Folder", workspace)
FakeHitboxes.Name = "fakeHitboxes"

function isPlayerNearHitbox(hitbox, player, maxStuds)
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    return (character.HumanoidRootPart.Position - hitbox.Position).Magnitude <= maxStuds
end

function handleHitbox(instance, newParent)
    if _G.ImmortalToggle == false then return end

    local fakeInstance
    local named = false

    if instance.Name == "MassInfection" then
        named = true
        fakeInstance = Instance.new("Part")
        fakeInstance.Material = Enum.Material.Neon
        fakeInstance.Transparency = 0.017
        fakeInstance.Name = "FakeMassInfection"
        fakeInstance.Size = Vector3.new(10, 1, 3)
        fakeInstance.CanCollide = false
        fakeInstance:PivotTo(instance:GetPivot())

        local fakeBV = Instance.new("BodyVelocity", fakeInstance)
        local maxForce = 100000
        fakeBV.MaxForce = Vector3.new(maxForce, maxForce, maxForce)
        fakeBV.P = 1250
        fakeBV.Velocity = Vector3.new(0, 1, 0)
        for i = 1,100 do
            pcall(function()
                fakeBV.Velocity = instance:FindFirstChildWhichIsA("BodyVelocity").Velocity
            end)
        end

        if fakeBV.Velocity == Vector3.new(0, 2, 0) then
            fakeInstance:Remove()
        end
    else
        fakeInstance = instance:Clone()
    end

    --for i = 1,900 do
    instance.Parent = game:GetService("ReplicatedFirst")
    --end

    if fakeInstance.Name == "FakeMassInfection" then
        fakeInstance.CanTouch = false
        pcall(function()
            fakeInstance:FindFirstChildWhichIsA("TouchTransmitter"):Destroy()
        end)
    end

    local interactedPlayers = {}
    local hitLocalPlayer = false
    
    if not(fakeInstance.Name == "FakeMassInfection") then
        fakeInstance.Touched:Connect(function(op)
            if op.Parent:FindFirstChildWhichIsA("Humanoid") then
                local plr = game:GetService("Players"):GetPlayerFromCharacter(op.Parent)
                if plr and not table.find(interactedPlayers, plr) then
                    table.insert(interactedPlayers, plr)
                    if plr == game.Players.LocalPlayer then
                        hitLocalPlayer = true
                    end
                end
            end
        end)
    end
    
    local proximityCheck = game:GetService("RunService").Heartbeat:Connect(function()
        if isPlayerNearHitbox(fakeInstance, Players.LocalPlayer, 45) and _G.UltraInstinct == true then
            if named == true then
                Players.LocalPlayer.Character:PivotTo(Players.LocalPlayer.Character:GetPivot() + Vector3.new(0, 1.5, 0)) 
            end
        end

        for _, plr in ipairs(game.Players:GetPlayers()) do
            if isPlayerNearHitbox(fakeInstance, plr, 6) and not table.find(interactedPlayers, plr) then
                table.insert(interactedPlayers, plr)
                if plr == game.Players.LocalPlayer then
                    hitLocalPlayer = true
                end
            end
        end
    end)

    task.delay(0.05, function()
        proximityCheck:Disconnect()
        if hitLocalPlayer and #interactedPlayers == 1 then
            fakeInstance.Color = Color3.fromRGB(139, 69, 19)
        elseif hitLocalPlayer then
            fakeInstance.Color = Color3.fromRGB(57, 255, 20)
        else
            fakeInstance.Color = Color3.fromRGB(255, 0, 0)
        end
        fakeInstance.Parent = newParent
    end)
    
    task.delay(_G.DeleteDuration, function()
        fakeInstance:Destroy()
    end)
end

function handlePlayer(instance, newParent)
    if instance:IsA("Player") then
        local char = instance.Character
        
        local function handleCharacter(char)
            local DebrisFolder = char:WaitForChild("Debris", 15)

            DebrisFolder.ChildAdded:Connect(function(child)
                handleHitbox(child, FakeHitboxes)
            end)
        end

        handleCharacter(char)
        instance.CharacterAdded:Connect(function(char)
            handleCharacter(char)
        end)
    end
end

function handleGroup(instance, desiredClass, callback)
    for i,v in pairs(instance:GetChildren()) do
        if v:IsA(desiredClass) or v.Name == desiredClass then
            callback(v)
        end
    end

    instance.ChildAdded:Connect(function(v)
        if v:IsA(desiredClass) or v.Name == desiredClass then
            callback(v)
        end
    end)
end

handleGroup(Players, "Player", function(instance)
    handlePlayer(instance, FakeHitboxes)
end)

HitboxesFolder.ChildAdded:Connect(function(instance)
    handleHitbox(instance, FakeHitboxes)
end)

workspace.ChildAdded:Connect(function(instance)
    if instance.Name == "MassInfection" then
        for i = 1,5 do
            handleHitbox(instance, FakeHitboxes)
        end
    end
end)
