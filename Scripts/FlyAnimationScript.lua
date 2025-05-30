-- fly detection + fly script
function cg(name, value) if _G[name] == nil then _G[name] = value end end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local AnimateScript = Character.Animate

cg(AutoFly, true)

function returnAnimationInstance(animationinstance, returnID)
    local childAnim = animationinstance:FindFirstChildWhichIsA("Animation")
    if returnID == true then
        local childAnimID = childAnim.AnimationId
        local rid = string.gsub(childAnimID, "rbxassetid://", "")
        local realAnimID = tonumber(rid)

        return realAnimID
    else
        return childAnim
    end
end

local CustomAnimations = {
    ["idle"] = 93526776499226, -- non-injured idle
    ["walk"] = 89456298800839, -- non-injured walk
    
    ["injuredidle"] = 71191953251937, -- injured idle
    ["injuredwalk"] = 107455243491171, -- injured walk
}

local OldAnimations = {
    ["idle"] = returnAnimationInstance(AnimateScript["idle"], true), -- non-injured idle
    ["walk"] = returnAnimationInstance(AnimateScript["walk"], true), -- non-injured walk

    ["injuredidle"] = returnAnimationInstance(AnimateScript["injuredidle"], true), -- injured idle
    ["injuredwalk"] = returnAnimationInstance(AnimateScript["injuredwalk"], true), -- injured walk
}

local AnimateNames = {
    "idle",
    "injuredidle",

    "walk",
    "injuredwalk",
}

local FlyClassNames = {"BodyVelocity", "BodyGyro"}

function detectFlight()
    local trueClasses = 0
    for i,v in pairs(HumanoidRootPart:GetChildren()) do
        for o,k in pairs(FlyClassNames) do
            if v:IsA(k) then
                trueClasses += 1
            end
        end
    end
    if trueClasses == #FlyClassNames then
        return true
    else
        return false
    end
end

function replaceAnimationInstance(animationinstance, animationId)
    local childanim = animationinstance:FindFirstChildWhichIsA("Animation")
    childanim.AnimationId = "rbxassetid://"..animationId
end 

local setbacknormal = false
local setbackfly = false
while _G.AutoFly == true do
    if detectFlight() == true and setbackfly == false then
        setbacknormal = false
        setbackfly = true
        for i,v in pairs(AnimateNames) do
            replaceAnimationInstance(AnimateScript[v], CustomAnimations[v])
        end
    elseif detectFlight() == false and setbacknormal == false then
        setbacknormal = true
        setbackfly = false
        for i,v in pairs(AnimateNames) do
            replaceAnimationInstance(AnimateScript[v], OldAnimations[v])
        end
    end
    task.wait()
end
