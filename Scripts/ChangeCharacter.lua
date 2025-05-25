function cg(name, value)
    if rawget(_G, name) == nil then
        rawset(_G, name, value)
    end
end

function FireEvent(args, Event)
    Event:FireServer(unpack(args))
end

cg("CurrentCharacter", "Shedletsky")
cg("CurrentSkin", "")

FireEvent({_G.CurrentCharacter, _G.CurrentSkin}, game.ReplicatedStorage:WaitForChild("ChangeCharacter", 5))
