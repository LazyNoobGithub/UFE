-- animation changer

local db = loadstring(game:HttpGet("https://raw.githubusercontent.com/LazyNoobGithub/UFE/refs/heads/main/Scripts/AnimationDatabase.lua"))()

function cg(name, value)
    if rawget(_G, name) == nil then
        rawset(_G, name, value)
    end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local AnimateScript = Character.Animate

cg("chosen_normal", db.normalanims)
cg("chosen_injured", db.normalanims_injured)
  
_G.CustomAnimations = {
    ["idle"] = _G.chosen_normal.idle, -- non-injured idle
    ["walk"] = _G.chosen_normal.walk, -- non-injured walk
    ["run"] = _G.chosen_normal.run, -- non-injured run

    ["injuredidle"] = _G.chosen_injured.injuredidle, -- injured idle
    ["injuredwalk"] = _G.chosen_injured.injuredwalk, -- injured walk
    ["injuredrun"] = _G.chosen_injured.injuredrun, -- injured run
}

local AnimateNames = {
    "idle",
    "injuredidle",

    "walk",
    "injuredwalk",

    "run",
    "injuredrun"
}

function replaceAnimationInstance(animationinstance, animationId)
    local childanim = animationinstance:FindFirstChildWhichIsA("Animation")
    task.spawn(function()
        while (_G.CustomAnimations[animationinstance.Name] == animationId) == true do
            childanim.AnimationId = "rbxassetid://"..animationId
            task.wait(0.7)
        end
    end)
end 

for i,v in pairs(AnimateNames) do
    replaceAnimationInstance(AnimateScript[v], _G.CustomAnimations[v])
end
