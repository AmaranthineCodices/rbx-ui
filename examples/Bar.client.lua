local Roact = require(game.ReplicatedStorage.Roact)
local Bar = require(game.ReplicatedStorage.UI.Bar)

local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Roact.DEBUG_ENABLE()

local demo = Roact.createElement("ScreenGui", {}, {
	Roact.createElement("Frame", {
		BackgroundColor3 = Color3.new(1, 1, 1),
		Position = UDim2.new(0.5, -150, 0.5, -150),
		Size = UDim2.new(0, 330, 0, 300),
	}, {
		Roact.createElement(Bar.Render, {
			Value = 0.5,
		}),
		Roact.createElement(Bar.Render, {
			Value = 0.5,
			Origin = Bar.Origin.Middle,
			Position = UDim2.new(0, 110, 0, 0),
		}),
		Roact.createElement(Bar.Render, {
			Value = 0.5,
			Origin = Bar.Origin.Right,
			Position = UDim2.new(0, 220, 0, 0),
		}),
		Roact.createElement(Bar.Render, {
			Value = 0.5,
			Direction = Bar.Direction.Vertical,
			Origin = Bar.Origin.Left,
			Position = UDim2.new(0, 0, 0, 15),
			Size = UDim2.new(0, 5, 0, 100),
		}),
		Roact.createElement(Bar.Render, {
			Value = 0.5,
			Direction = Bar.Direction.Vertical,
			Origin = Bar.Origin.Middle,
			Position = UDim2.new(0, 20, 0, 15),
			Size = UDim2.new(0, 5, 0, 100),
		}),
		Roact.createElement(Bar.Render, {
			Value = 0.5,
			Direction = Bar.Direction.Vertical,
			Origin = Bar.Origin.Right,
			Position = UDim2.new(0, 40, 0, 15),
			Size = UDim2.new(0, 5, 0, 100),
		}),
	})
})

Roact.reify(demo, playerGui, "BarDemo")
