-- Instances


local KillerDisplayModule = {}
KillerDisplayModule.BaseTransparencies = {
	BackgroundTransparency = {
		KillerDisplayBackground = 0.15000000596046448,
	},
	TextTransparency = {
		Title = 0,
		KillerName = 0,
		PlayerName = 0.6
	}
}
function KillerDisplayModule.TweenTransparency(instance, property, dur)
	local TweenService = game:GetService("TweenService")
	local TweenSpeed = dur
	local TweenFunction = TweenInfo.new(TweenSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(instance, TweenFunction, {[property] = 1}):Play()
end

local KillerDisplayGUI = Instance.new("ScreenGui", game.CoreGUI)
local KillerDisplayBackground = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local Displays = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Display = Instance.new("Frame")
local PlayerName = Instance.new("TextLabel")
local KillerName = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

-- Properties

KillerDisplayBackground.Name = "KillerDisplayBackground"
KillerDisplayBackground.Parent = KillerDisplayGUI
KillerDisplayBackground.AnchorPoint = Vector2.new(0.5, 1)
KillerDisplayBackground.BackgroundColor3 = Color3.new(1, 1, 1)
KillerDisplayBackground.BackgroundTransparency = 1
KillerDisplayBackground.BorderColor3 = Color3.new(0, 0, 0)
KillerDisplayBackground.BorderSizePixel = 0
KillerDisplayBackground.Position = UDim2.new(0.5, 0, 0.975000024, -25)
KillerDisplayBackground.Size = UDim2.new(0.75, 0, 0.25, 0)
KillerDisplayBackground.Image = "rbxassetid://110985273977389"
KillerDisplayBackground.ImageTransparency = 1

Title.Name = "Title"
Title.Parent = KillerDisplayBackground
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0.100000001, 0)
Title.Size = UDim2.new(1, 0, 0.25, 0)
Title.Font = Enum.Font.Bodoni
Title.Text = "This round's killers are..."
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.TextSize = 14
Title.TextWrapped = true

Displays.Name = "Displays"
Displays.Parent = KillerDisplayBackground
Displays.AnchorPoint = Vector2.new(0.5, 1)
Displays.BackgroundColor3 = Color3.new(1, 1, 1)
Displays.BackgroundTransparency = 1
Displays.BorderColor3 = Color3.new(0, 0, 0)
Displays.BorderSizePixel = 0
Displays.Position = UDim2.new(0.5, 0, 0.899999976, 0)
Displays.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)

UIListLayout.Parent = Displays
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Display.Name = "Display"
Display.Parent = Displays
Display.BackgroundColor3 = Color3.new(1, 1, 1)
Display.BackgroundTransparency = 1
Display.BorderColor3 = Color3.new(0, 0, 0)
Display.BorderSizePixel = 0
Display.Size = UDim2.new(0.5, 0, 1, 0)

PlayerName.Name = "PlayerName"
PlayerName.Parent = Display
PlayerName.AnchorPoint = Vector2.new(0.5, 0.5)
PlayerName.BackgroundColor3 = Color3.new(1, 1, 1)
PlayerName.BackgroundTransparency = 1
PlayerName.BorderColor3 = Color3.new(0, 0, 0)
PlayerName.BorderSizePixel = 0
PlayerName.Position = UDim2.new(0.5, 0, 0.768950582, 0)
PlayerName.Size = UDim2.new(1, 0, 0.200000003, 0)
PlayerName.Font = Enum.Font.Bodoni
PlayerName.Text = "(@souldrivenlove)"
PlayerName.TextColor3 = Color3.new(1, 1, 1)
PlayerName.TextScaled = true
PlayerName.TextSize = 14
PlayerName.TextTransparency = 0.6000000238418579
PlayerName.TextWrapped = true

KillerName.Name = "KillerName"
KillerName.Parent = Display
KillerName.AnchorPoint = Vector2.new(0.5, 0.5)
KillerName.BackgroundColor3 = Color3.new(1, 1, 1)
KillerName.BackgroundTransparency = 1
KillerName.BorderColor3 = Color3.new(0, 0, 0)
KillerName.BorderSizePixel = 0
KillerName.Position = UDim2.new(0.5, 0, 0.448719889, 0)
KillerName.Size = UDim2.new(1, 0, 0.649999976, 0)
KillerName.Font = Enum.Font.Bodoni
KillerName.Text = "c00lkidd"
KillerName.TextColor3 = Color3.new(1, 0, 0)
KillerName.TextScaled = true
KillerName.TextSize = 14
KillerName.TextWrapped = true

UIAspectRatioConstraint.Parent = KillerDisplayBackground
UIAspectRatioConstraint.AspectRatio = 5.75

function KillerDisplayModule:Intro(killername, playername)
	KillerDisplayBackground.ImageTransparency = 1
	Title.TextTransparency = 1
	KillerName.TextTransparency = 1
	PlayerName.TextTransparency = 1

	KillerName.Text = killername
	PlayerName.Text = playername

	local TweenService = game:GetService("TweenService")

	local bgTween = TweenService:Create(
		KillerDisplayBackground,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ImageTransparency = KillerDisplayModule.BaseTransparencies.BackgroundTransparency.KillerDisplayBackground}
	)
	bgTween:Play()

	task.delay(0.3, function()
		local titleTween = TweenService:Create(
			Title,
			TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = KillerDisplayModule.BaseTransparencies.TextTransparency.Title}
		)
		titleTween:Play()
	end)

	task.delay(0.6, function()
		local killerTween = TweenService:Create(
			KillerName,
			TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = KillerDisplayModule.BaseTransparencies.TextTransparency.KillerName}
		)
		killerTween:Play()

		local playerTween = TweenService:Create(
			PlayerName,
			TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = KillerDisplayModule.BaseTransparencies.TextTransparency.PlayerName}
		)
		playerTween:Play()
	end)
end

return KillerDisplayModule
