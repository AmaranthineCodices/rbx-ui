-- A progress bar. Simple functional component, nothing to see here.

local Roact = require(game:GetService("ReplicatedStorage"):WaitForChild("Roact"))
local c = Roact.createElement

local Bar = {}
Bar.Direction = {
	Horizontal = 0;
	Vertical = 1;
}

Bar.Origin = {
	Left = 0;
	Middle = 1;
	Right = 2;
	Top = 0;
	Bottom = 2;
}

function Bar.Render(props)
	local origin = props.Origin or Bar.Origin.Left
	local direction = props.Direction or Bar.Direction.Horizontal

	local sizeFraction = props.Value or 0
	local anchor, size, position
	if direction == Bar.Direction.Horizontal then
		size = UDim2.new(sizeFraction, 0, 1, 0)

		if origin == Bar.Origin.Left then
			anchor = Vector2.new(0, 0)
			position = UDim2.new(0, 0, 0, 0)
		elseif origin == Bar.Origin.Middle then
			anchor = Vector2.new(0.5, 0)
			position = UDim2.new(0.5, 0, 0, 0)
		elseif origin == Bar.Origin.Right then
			anchor = Vector2.new(1, 0)
			position = UDim2.new(1, 0, 0, 0)
		end
	elseif direction == Bar.Direction.Vertical then
		size = UDim2.new(1, 0, sizeFraction, 0)

		if origin == Bar.Origin.Top then
			anchor = Vector2.new(0, 0)
			position = UDim2.new(0, 0, 0, 0)
		elseif origin == Bar.Origin.Middle then
			anchor = Vector2.new(0, 0.5)
			position = UDim2.new(0, 0, 0.5, 0)
		elseif origin == Bar.Origin.Bottom then
			anchor = Vector2.new(0, 1)
			position = UDim2.new(0, 0, 1, 0)
		end
	end

	return c("Frame", {
		AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
		BackgroundColor3 = props.BackgroundColor3 or Color3.fromRGB(200, 200, 200),
		BorderColor3 = props.BorderColor3 or Color3.new(0, 0, 0),
		BorderSizePixel = props.BorderSizePixel or 0,
		ClipsDescendants = true,
		LayoutOrder = props.LayoutOrder or 1,
		Position = props.Position or UDim2.new(0, 0, 0, 0),
		Size = props.Size or UDim2.new(0, 100, 0, 5),
		ZIndex = props.ZIndex or 1,
	}, {
		RealBar = c("Frame", {
			AnchorPoint = anchor,
			BackgroundColor3 = props.BarColor3 or Color3.new(0, 0, 0),
			BorderSizePixel = 0,
			Position = position,
			Size = size,
		})
	})
end

setmetatable(Bar, { __call = function(_, ...) return Bar.Render(...) end })

return Bar