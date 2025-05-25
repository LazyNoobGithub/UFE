local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local u4 = u3:WaitForChild("Humanoid")
local v5 = game:GetService("UserInputService")
local v6 = Instance.new("Animation")
v6.AnimationId = "rbxassetid://135814994052102"
local u7 = u4:LoadAnimation(v6)
local u8 = true
local u9 = true
local u10 = true
local u11 = v1.CharacterRemoteEvents.Guest1337:WaitForChild("Block")
local u12 = v1.CharacterRemoteEvents.Guest1337:WaitForChild("ChargeRemote")
local u13 = v1.CharacterRemoteEvents.Guest1337:WaitForChild("GuestAttackRemote")
local function u16(p14) --[[Anonymous function at line 27]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u8
        [4] = u11
        [5] = u9
        [6] = u12
        [7] = u10
        [8] = u7
        [9] = u13
    --]]
    local v15
    if u3:GetAttribute("Character") == "Guest1337" and (u3:GetAttribute("CanRun") ~= false and game.Workspace.Camera.CameraSubject ~= u3.Head) then
        v15 = u4.Health > 0
    else
        v15 = false
    end
    if v15 then
        if p14 == "Block" and u8 then
            u8 = false
            u11:FireServer()
            task.wait(15)
            u8 = true
            return
        elseif p14 == "Charge" and u9 then
            u9 = false
            u12:FireServer()
            task.wait(10)
            u9 = true
        elseif p14 == "Punch" and u10 then
            u10 = false
            u7:Play()
            u13:FireServer()
            task.wait(3)
            u10 = true
        end
    else
        return
    end
end

v5.InputBegan:Connect(function(p17, p18) --[[Anonymous function at line 66]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if p18 then
        return
    elseif p17.KeyCode == Enum.KeyCode.Q then
        u16("Block")
        return
    elseif p17.KeyCode == Enum.KeyCode.E then
        u16("Charge")
    elseif p17.KeyCode == Enum.KeyCode.R then
        u16("Punch")
    end
end)

local u1 = game:GetService("ReplicatedStorage").CharacterRemoteEvents.Jason:WaitForChild("JasonAttackRemote")
local u2 = game:GetService("Players").LocalPlayer
local u3 = u2.Character or u2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = game:GetService("UserInputService")
local v6 = Instance.new("Animation")
v6.AnimationId = "rbxassetid://101757043928040"
local u7 = v4:LoadAnimation(v6)
local u8 = true

local function u9() --[[Anonymous function at line 16]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u7
        [4] = u1
        [5] = u2
    --]]
    if u8 then
        if u3:GetAttribute("Character") == "Jason" then
            if u3.Humanoid.Health <= 0 then
                return
            elseif workspace.Camera.CameraSubject == u3:FindFirstChild("Head") then
                return
            elseif u3:GetAttribute("CanRun") ~= false or u3:GetAttribute("Enraged") == true then
                u8 = false
                u7:Play()
                u1:FireServer()
                if u3:GetAttribute("Enraged") == true then
                    u3:SetAttribute("Enraged", false)
                    u3:SetAttribute("CanRun", true)
                    u3.Humanoid.WalkSpeed = 16
                    u2.Character.HumanoidRootPart.AssemblyLinearVelocity = u2.Character.HumanoidRootPart.CFrame.LookVector * 140
                end
                task.wait(2.5)
                u8 = true
            end
        else
            return
        end
    else
        return
    end
end

v5.InputBegan:Connect(function(p10, p11) --[[Anonymous function at line 45]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if not p11 then
        if p10.UserInputType == Enum.UserInputType.MouseButton1 then
            u9()
        end
    end
end)

local u1 = game:GetService("ReplicatedStorage").CharacterRemoteEvents.Jason:WaitForChild("Behead")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://74733952175669"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 31]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "Jason" then
        if u3:GetAttribute("CanRun") == false then
            return
        elseif u3.Humanoid.Health == 0 then
            return
        elseif not p9 then
            if p8.KeyCode == Enum.KeyCode.Q and u7 then
                u7 = false
                u6:Play()
                u1:FireServer()
                task.wait(15)
                u7 = true
            end
        end
    else
        return
    end
end)

local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Jason:WaitForChild("GashingWound")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://104508004691131"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 31]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "Jason" then
        if u3:GetAttribute("CanRun") == false then
            return
        elseif u3.Humanoid.Health == 0 then
            return
        elseif not p9 then
            if p8.KeyCode == Enum.KeyCode.E and u7 then
                u7 = false
                u6:Play()
                u1:FireServer()
                task.wait(15)
                u7 = true
            end
        end
    else
        return
    end
end)

local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Jason:WaitForChild("Enraged")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://104508004691131"
v4:LoadAnimation(v5)
local u6 = true

game:GetService("UserInputService").InputBegan:Connect(function(p7, p8) --[[Anonymous function at line 30]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u1
    --]]
    if u3:GetAttribute("Character") == "Jason" then
        if u3:GetAttribute("CanRun") == false then
            return
        elseif u3.Humanoid.Health == 0 then
            return
        elseif not p8 then
            if p7.KeyCode == Enum.KeyCode.R and u6 then
                u6 = false
                u1:FireServer()
                task.wait(12)
                u6 = true
            end
        end
    else
        return
    end
end)

local u1 = game.ReplicatedStorage.CharacterRemoteEvents["1x4"]:WaitForChild("MassInfection")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://0"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 33]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "1x4" then
        if u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif u3.Humanoid.Health == 0 then
            return
        elseif not p9 then
            if p8.KeyCode == Enum.KeyCode.Q and u7 then
                u7 = false
                u6:Play()
                u1:FireServer()
                task.wait(10)
                u7 = true
            end
        end
    else
        return
    end
end)

local u1 = game.ReplicatedStorage.CharacterRemoteEvents["1x4"]:WaitForChild("1x4AttackRemote")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://95091028013279"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 33]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "1x4" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif not p9 then
            if p8.UserInputType == Enum.UserInputType.MouseButton1 and u7 then
                u7 = false
                print("test")
                u6:Play()
                u1:FireServer()
                task.wait(1.5)
                u7 = true
            end
        end
    else
        return
    end
end)

local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Chance:WaitForChild("CoinFlip")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://87783323952106"
v4:LoadAnimation(v5)
local u6 = true

game:GetService("UserInputService").InputBegan:Connect(function(p7, p8) --[[Anonymous function at line 31]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u1
    --]]
    if u3:GetAttribute("Character") == "Chance" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif not p8 then
            if p7.KeyCode == Enum.KeyCode.Q and u6 then
                u6 = false
                u1:FireServer()
                task.wait(5)
                u6 = true
            end
        end
    else
        return
    end
end)

local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Chance:WaitForChild("ChanceShoot")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://87783323952106"
v4:LoadAnimation(v5)
local u6 = true

game:GetService("UserInputService").InputBegan:Connect(function(p7, p8) --[[Anonymous function at line 32]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u1
    --]]
    if u3:GetAttribute("Character") == "Chance" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif not p8 then
            if p7.KeyCode == Enum.KeyCode.E and u6 then
                u6 = false
                u1:FireServer()
                task.wait(5.8)
                u6 = true
            end
        end
    else
        return
    end
end)

game:GetService("ReplicatedStorage")
local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Coolkid:WaitForChild("Walkspeed")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local u4 = u3:WaitForChild("Humanoid")
local u5 = true
local function u8() --[[Anonymous function at line 11]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v6 = Instance.new("Animation")
    local v7 = u3:GetAttribute("Skin")
    if v7 == "Mafioso" then
        v6.AnimationId = "rbxassetid://110626901283305"
    elseif v7 == "JX1DX1" then
        v6.AnimationId = "rbxassetid://79032720453691"
    else
        v6.AnimationId = "rbxassetid://109909761917183"
    end
    u4:LoadAnimation(v6):Play()
end

game:GetService("UserInputService").InputBegan:Connect(function(p9, p10) --[[Anonymous function at line 45]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u8
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "Coolkid" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif not p10 then
            if p9.KeyCode == Enum.KeyCode.E and u5 then
                u5 = false
                u8()
                u1:FireServer()
                task.wait(15)
                u5 = true
            end
        end
    else
        return
    end
end)

game:GetService("ReplicatedStorage")
local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Coolkid:WaitForChild("CoolkidAttackRemote")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local u4 = u3:WaitForChild("Humanoid")
local u5 = true
local function u8() --[[Anonymous function at line 10]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v6 = Instance.new("Animation")
    local v7 = u3:GetAttribute("Skin")
    if v7 == "Mafioso" then
        v6.AnimationId = "rbxassetid://106082692754325"
    elseif v7 == "JX1DX1" then
        v6.AnimationId = "rbxassetid://93485633278766"
    else
        v6.AnimationId = "rbxassetid://91486525775866"
    end
    u4:LoadAnimation(v6):Play()
end

game:GetService("UserInputService").InputBegan:Connect(function(p9, p10) --[[Anonymous function at line 44]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u8
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "Coolkid" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif not p10 then
            if p9.UserInputType == Enum.UserInputType.MouseButton1 and u5 then
                u5 = false
                print("test")
                u8()
                u1:FireServer()
                task.wait(2.5)
                u5 = true
            end
        end
    else
        return
    end
end)

game:GetService("ReplicatedStorage")
local u1 = game.ReplicatedStorage.CharacterRemoteEvents.JohnDoe:WaitForChild("JohnDoeAttackRemote")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://113923828536038"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 32]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "JohnDoe" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif not p9 then
            if p8.UserInputType == Enum.UserInputType.MouseButton1 and u7 then
                u7 = false
                print("test")
                u6:Play()
                u1:FireServer()
                task.wait(1.5)
                u7 = true
            end
        end
    else
        return
    end
end)

game:GetService("ReplicatedStorage")
local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Shedletsky:WaitForChild("ShedletskyChickenRemote")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://79188775702839"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 32]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "Shedletsky" then
        if u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif u3.Humanoid.Health == 0 then
            return
        elseif not p9 then
            if p8.KeyCode == Enum.KeyCode.E and u7 then
                u7 = false
                u6:Play()
                u1:FireServer()
                task.wait(15)
                u7 = true
            end
        end
    else
        return
    end
end)

local u1 = game:GetService("ReplicatedStorage").CharacterRemoteEvents.Shedletsky:WaitForChild("ShedletskyAttackRemote")
local v2 = game:GetService("Players")
local v3 = game:GetService("UserInputService")
local v4 = v2.LocalPlayer
local u5 = v4.Character or v4.CharacterAdded:Wait()
local v6 = u5:WaitForChild("Humanoid")

local v7 = Instance.new("Animation")
if u5:GetAttribute("Skin") == "Silliest" then
    v7.AnimationId = "rbxassetid://97988307922554"
else
    v7.AnimationId = "rbxassetid://122435904112909"
end
local u8 = v6:LoadAnimation(v7)
local u9 = true
local function u10() --[[Anonymous function at line 25]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u8
        [4] = u1
    --]]
    if u5:GetAttribute("Character") == "Shedletsky" then
        if u5:GetAttribute("CanRun") == false then
            return
        elseif workspace.Camera.CameraSubject == u5.Head then
            return
        elseif u5.Humanoid.Health == 0 then
            return
        elseif u9 then
            u9 = false
            u8:Play()
            u1:FireServer()
            task.wait(5)
            u9 = true
        end
    else
        return
    end
end

v3.InputBegan:Connect(function(p11, p12) --[[Anonymous function at line 42]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p11.KeyCode == Enum.KeyCode.Q and not p12 then
        u10()
    end
end)

game:GetService("ReplicatedStorage")
local v1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("UserInputService")
local v3 = game:GetService("RunService")
local u4 = v1.Character or v1.CharacterAdded:Wait()
local u5 = u4:WaitForChild("Humanoid")
local u6 = {
    ["enabled"] = false,
    ["walkSpeed"] = 9,
    ["defaultSpeed"] = 16,
    ["busy"] = false
}
local u7 = {}
local v8 = Instance.new("Animation")
v8.AnimationId = "rbxassetid://115862477523101"
v8.Parent = u5
u7.start = u5:LoadAnimation(v8)
local v9 = Instance.new("Animation")
v9.AnimationId = "rbxassetid://78101760974946"
v9.Parent = u5
u7.idle = u5:LoadAnimation(v9)
local v10 = Instance.new("Animation")
v10.AnimationId = "rbxassetid://89719119049960"
v10.Parent = u5
u7.move = u5:LoadAnimation(v10)
local v11 = Instance.new("Animation")
v11.AnimationId = "rbxassetid://138562535765161"
v11.Parent = u5
u7.stop = u5:LoadAnimation(v11)
local function u12() --[[Anonymous function at line 30]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u5
        [4] = u4
    --]]
    u6.enabled = false
    u7.start:Stop()
    u7.idle:Stop()
    u7.move:Stop()
    u7.stop:Stop()
    u5.WalkSpeed = u6.defaultSpeed
    u4:SetAttribute("CanRun", true)
end
local function u13() --[[Anonymous function at line 40]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u4
        [4] = u5
    --]]
    if not u6.busy then
        u6.busy = true
        u7.stop:Stop()
        u7.idle:Stop()
        u7.move:Stop()
        u7.start:Play()
        game.ReplicatedStorage.CharacterRemoteEvents.TwoTime.GlobalCrouchSounds:FireServer("Crouch")
        u4:SetAttribute("CanRun", false)
        u5.WalkSpeed = 0
        u7.start.Stopped:Wait()
        if u6.busy then
            u6.enabled = true
            u7.idle:Play()
            u5.WalkSpeed = u6.walkSpeed
            u4:SetAttribute("CanRun", false)
        end
        u6.busy = false
    end
end
local function u14() --[[Anonymous function at line 60]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u5
        [4] = u4
    --]]
    if not u6.busy then
        u6.busy = true
        u7.idle:Stop()
        u7.move:Stop()
        u7.start:Stop()
        u7.stop:Play()
        u5.WalkSpeed = 0
        game.ReplicatedStorage.CharacterRemoteEvents.TwoTime.GlobalCrouchSounds:FireServer("StopCrouch")
        u7.stop.Stopped:Wait()
        u6.enabled = false
        u5.WalkSpeed = u6.defaultSpeed
        u4:SetAttribute("CanRun", true)
        u6.busy = false
    end
end
v3.Heartbeat:Connect(function() --[[Anonymous function at line 86]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u12
        [4] = u5
        [5] = u7
    --]]
    if u6.enabled then
        if u4:GetAttribute("Character") ~= "TwoTime" then
            u12()
        end
        if u5.MoveDirection.Magnitude > 0 then
            if not u7.move.IsPlaying then
                u7.idle:Stop()
                u7.move:Play()
                return
            end
        elseif not u7.idle.IsPlaying then
            u7.move:Stop()
            u7.idle:Play()
            return
        end
    else
        if u7.move.IsPlaying then
            u7.move:Stop()
        end
        if u7.idle.IsPlaying then
            u7.idle:Stop()
        end
    end
end)

v2.InputBegan:Connect(function(p15, p16) --[[Anonymous function at line 118]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u14
        [5] = u13
    --]]
    if u4:GetAttribute("Character") == "TwoTime" then
        if game.Workspace.Camera.CameraSubject == u4.Head then
            return
        elseif u5.Health ~= 0 and not p16 then
            if p15.KeyCode == Enum.KeyCode.E then
                if u6.busy then
                    return
                end
                if u6.enabled then
                    u14()
                    return
                end
                u13()
            end
        end
    else
        return
    end
end)

local v17 = Instance.new("Animation")
v17.AnimationId = "rbxassetid://73186501998283"
local u18 = u5:LoadAnimation(v17)
local u19 = true
local function u20() --[[Anonymous function at line 135]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u19
        [4] = u18
        [5] = u12
    --]]
    if u4:GetAttribute("Character") == "TwoTime" then
        if u5.Health == 0 then
            return
        elseif game.Workspace.Camera.CameraSubject == u4.Head then
            return
        elseif u19 then
            u19 = false
            u18:Play()
            u12()
            game.ReplicatedStorage.CharacterRemoteEvents.TwoTime.TwoTimeAttackRemote:FireServer()
            task.wait(5)
            u19 = true
        end
    else
        return
    end
end

v2.InputBegan:Connect(function(p21, p22) --[[Anonymous function at line 153]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    if p21.KeyCode == Enum.KeyCode.Q and not p22 then
        u20()
    end
end)

game:GetService("ReplicatedStorage")
local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Dusekkar:WaitForChild("DusekkarSpell")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
local v4 = u3:WaitForChild("Humanoid")
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://109105742564174"
local u6 = v4:LoadAnimation(v5)
local u7 = true

game:GetService("UserInputService").InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 32]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u1
    --]]
    if u3:GetAttribute("Character") == "Dusekkar" then
        if u3.Humanoid.Health == 0 then
            return
        elseif u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif not p9 then
            if p8.KeyCode == Enum.KeyCode.E and u7 then
                u7 = false
                u6:Play()
                u1:FireServer()
                task.wait(9.5)
                u7 = true
            end
        end
    else
        return
    end
end)

game:GetService("ReplicatedStorage")
local u1 = game.ReplicatedStorage.CharacterRemoteEvents.Elliot:WaitForChild("ThrowPizza")
local v2 = game:GetService("Players").LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
u3:WaitForChild("Humanoid")
local u4 = true

game:GetService("UserInputService").InputBegan:Connect(function(p5, p6) --[[Anonymous function at line 27]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u1
    --]]
    if u3:GetAttribute("Character") == "Elliot" then
        if u3:GetAttribute("CanRun") == false then
            return
        elseif game.Workspace.Camera.CameraSubject == u3.Head then
            return
        elseif u3.Humanoid.Health == 0 then
            return
        elseif not p6 then
            if p5.KeyCode == Enum.KeyCode.Q and u4 then
                u4 = false
                u1:FireServer()
                task.wait(10)
                u4 = true
            end
        end
    else
        return
    end
end)

local u1 = game:GetService("ReplicatedStorage").CharacterRemoteEvents.Elliot:WaitForChild("RushHour")
local v2 = game:GetService("Players")
local v3 = game:GetService("UserInputService")
local v4 = v2.LocalPlayer
local u5 = v4.Character or v4.CharacterAdded:Wait()
u5:WaitForChild("Humanoid")

local u6 = true
local function u7() --[[Anonymous function at line 15]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u1
    --]]
    if u5:GetAttribute("Character") == "Elliot" then
        if u5:GetAttribute("CanRun") == false then
            return
        elseif workspace.Camera.CameraSubject == u5.Head then
            return
        elseif u5.Humanoid.Health == 0 then
            return
        elseif u6 then
            u6 = false
            u1:FireServer()
            task.wait(25)
            u6 = true
        end
    else
        return
    end
end

v3.InputBegan:Connect(function(p8, p9) --[[Anonymous function at line 31]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if p8.KeyCode == Enum.KeyCode.E and not p9 then
        u7()
    end
end)