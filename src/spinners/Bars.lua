local RunService = game:GetService("RunService")

local Roact = require(game:GetService("ReplicatedStorage"):WaitForChild("Roact"))
-- Shorthand because writing out "Roact.createElement" makes my fingers hurt
local c = Roact.createElement

local BarsSpinner = Roact.Component:extend("BarsSpinner")

function BarsSpinner:init(props)
	self._mounted = false

	self.state = {
		AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
		BarColor3 = props.BarColor3 or Color3.new(0, 0, 0),
		BarHeight = props.BarHeight or 30,
		BarPadding = props.BarPadding or 5,
		Bars = props.Bars or 5,
		BarWidth = props.BarWidth or 5,
		Position = props.Position or UDim2.new(0, 0, 0, 0),
		Speed = props.Speed or 3,
		ZIndex = props.ZIndex or 1,
	}

	self.state.Size = self.state.Size or UDim2.new(0, self.state.Bars * self.state.BarWidth + (self.state.BarPadding * (self.state.Bars - 1)), 0, self.state.BarExpandedHeight)
end

function BarsSpinner:render()
	local bars = {}

	for i = 1, self.state.Bars do
		table.insert(bars, c("Frame", {
			BackgroundColor3 = self.state.BarColor3,
			BorderSizePixel = 0,
			LayoutOrder = i,
			Size = UDim2.new(0, self.state.BarWidth, 0, self.state.BarHeight),
			ZIndex = self.state.ZIndex
		}))
	end

	table.insert(bars, c("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, self.state.BarPadding),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	}))

	return c("Frame", {
		AnchorPoint = self.state.AnchorPoint,
		BackgroundTransparency = 1;
		BorderSizePixel = 0;
		Position = self.state.Position,
		Size = self.state.Size,
		ZIndex = self.state.ZIndex,

		[Roact.Ref] = function(rbx)
			self._root = rbx
		end;
	}, bars)
end

function BarsSpinner:didMount()
	self._connection = RunService.RenderStepped:Connect(function()
		local rbx = self._root

		for _, child in ipairs(rbx:GetChildren()) do
			if child:IsA("Frame") then
				local index = child.LayoutOrder
				local shift = (index - 1) / self.state.Bars
				local alpha = math.sin((tick() - shift) * self.state.Speed)

				child.Size = UDim2.new(0, self.state.BarWidth, 0, alpha * self.state.BarHeight)
			end
		end
	end)
end

function BarsSpinner:willUnmount()
	if self._connection then
		self._connection:Disconnect()
	end
end

return BarsSpinner
