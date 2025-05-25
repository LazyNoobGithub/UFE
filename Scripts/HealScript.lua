function cg(name, value) if _G[name] == nil then _G[name] = value end end

cg(ChosenCharacter, "Guest1337")
cg(ChosenSkin, "Unfunny64Bits")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CharacterRemoteEvents = ReplicatedStorage:WaitForChild("CharacterRemoteEvents", 5)

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character.Humanoid
local setCharacterAlready = false

cg(AutoHeal, true)
cg(AutoHealTaken, false)

function FireEvent(args, Event)
    Event:FireServer(unpack(args))
end

function ActivateScript()
    if Humanoid.Health < 100 then
        setCharacterAlready = true
        repeat
            FireEvent({"Shedletsky", _G.ChosenSkin}, ReplicatedStorage:WaitForChild("ChangeCharacter", 5))
            FireEvent({}, CharacterRemoteEvents:WaitForChild("Shedletsky", 5):WaitForChild("ShedletskyChickenRemote", 5))

            task.wait(5.1)
            FireEvent({_G.ChosenCharacter, _G.ChosenSkin}, ReplicatedStorage:WaitForChild("ChangeCharacter", 5))
            task.wait(14-5.1)
        until Humanoid.Health >= 100
        setCharacterAlready = true
    else
        FireEvent({_G.ChosenCharacter, _G.ChosenSkin}, ReplicatedStorage:WaitForChild("ChangeCharacter", 9e9))
        setCharacterAlready = true
    end
end

if _G.AutoHeal == true and _G.AlreadyTaken == false then
    ActivateScript()
    task.spawn(function()
        while _G.AutoHeal == true do
            _G.AlreadyTaken = true
            if Humanoid.Health >= 100 then setCharacterAlready = false end
            
            if Humanoid.Health < 100 and setCharacterAlready == false then
                ActivateScript()
            end
            task.wait(0.7)
        end
        _G.AlreadyTaken = false
    end)
else
    ActivateScript()
end
