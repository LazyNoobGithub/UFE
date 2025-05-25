-- animation changer

-- here is the normal anims:
--[[
["idle"] = 101187934796631, -- non-injured idle
["walk"] = 129809765506966, -- non-injured walk
["run"] = 97917754365808, -- non-injured run

["injuredidle"] = 98730629040334, -- injured idle
["injuredwalk"] = 127979673249525, -- injured walk
["injuredrun"] = 127840952753111, -- injured run
]]

-- here is the normal/survivor retro anims:
--[[
["idle"] = 139560382291834, -- non-injured idle
["walk"] = 90226466808163, -- non-injured walk
["run"] = 112590720308155, -- non-injured run

["injuredidle"] = 107300560268453, -- injured idle
["injuredwalk"] = 94040560496474, -- injured walk
["injuredrun"] = 112306901762051, -- injured run
]]

-- here is the mafioso/killer retro anims:
--[[
["idle"] = 139560382291834, -- non-injured idle
["walk"] = 92663427701874, -- non-injured walk
["run"] = 135281552445815, -- non-injured run

["injuredidle"] = 107300560268453, -- injured idle
["injuredwalk"] = 94040560496474, -- injured walk
["injuredrun"] = 112306901762051, -- injured run
]]

-- here is the jx1dx1/killer v2 retro anims:
--[[
["idle"] = 78122935129128, -- non-injured idle
["walk"] = 120987312636269, -- non-injured walk
["run"] = 112900634840840, -- non-injured run
]]

-- here is 1x4 retro anims:
--[[
["idle"] = 129771962815458, -- non-injured idle
]]

-- here is 1x4 anims:
--[[
["idle"] = 133739857114827, -- non-injured idle
["walk"] = 117831271457685, -- non-injured walk
["run"] = 71250499967998, -- non-injured run
]]

-- here is silliest/quit retro anims:
--[[
["idle"] = 91461448848225, -- non-injured idle
["walk"] = 72916466099135, -- non-injured walk
]]

-- here is the dusekkar anims:
--[[
["idle"] = 93526776499226, -- non-injured idle
["walk"] = 89456298800839, -- non-injured walk
["run"] = 99828872947674, -- non-injured run

["injuredidle"] = 71191953251937, -- injured idle
["injuredwalk"] = 107455243491171, -- injured walk
["injuredrun"] = 77082387056092, -- injured run
]]

-- here is nolie retro anims:
--[[
["idle"] = 102173676568142, -- non-injured idle
]]

-- here is guest 666 retro anims:
--[[
["idle"] = 90067909645454, -- non-injured idle
["walk"] = 123434257971107, -- non-injured walk
]]

-- here is john toes retro anims:
--[[
["idle"] = 73047007139858, -- non-injured idle
["walk"] = 78937523156917, -- non-injured walk
]]

-- here is jason anims:
--[[
["idle"] = 79847722809411, -- non-injured idle
["walk"] = 100715036105609, -- non-injured walk
["run"] = 130266370655318, -- non-injured run
]]

-- here is jason raging pace anims:
--[[
["idle"] = 113587955333779, -- non-injured idle
["walk"] = 101132996950958, -- non-injured walk
["run"] = 101132996950958, -- non-injured run
]]

-- here is retro Jason anims:
--[[
["walk"] = 85232789717460, -- non-injured walk
["run"] = 138292275822759, -- non-injured run
]]

-- here is retro Jason idles: (1st one: Hello Jason, 2nd: Retro Jason)
--[[
["idle"] = 78234295119267, -- non-injured idle
["idle"] = 102603372558115, -- non-injured idle
]]

-- here is c00lkidd anims:
--[[
["idle"] = 97086986086474, -- non-injured idle
["walk"] = 81402633950862, -- non-injured walk
["run"] = 77684753344012, -- non-injured run
]]

-- here is bluudud/redsmiley anims:
--[[
["idle"] = 90252404548170, -- non-injured idle
["walk"] = 71619463415012, -- non-injured walk
["run"] = 110734129697512, -- non-injured run
]]

-- here is john doe anims:
--[[
["idle"] = 90286804566558, -- non-injured idle
["walk"] = 106992556035804, -- non-injured walk
["run"] = 138421545751238, -- non-injured run
]]

function cg(name, value) if _G[name] == nil then _G[name] = value end end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local AnimateScript = Character.Animate

cg(CustomAnimations, {
    ["idle"] = 101187934796631, -- non-injured idle
    ["walk"] = 129809765506966, -- non-injured walk
    ["run"] = 97917754365808, -- non-injured run

    ["injuredidle"] = 98730629040334, -- injured idle
    ["injuredwalk"] = 127979673249525, -- injured walk
    ["injuredrun"] = 127840952753111, -- injured run
})

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
