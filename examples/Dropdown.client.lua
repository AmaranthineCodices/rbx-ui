local Roact = require(game.ReplicatedStorage.Roact)
local Dropdown = require(game.ReplicatedStorage.UI.Dropdown)

local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local demo = Roact.createElement("ScreenGui", {}, {
	Roact.createElement("Frame", {
		Size = UDim2.new(0, 200, 0, 100),
		Position = UDim2.new(0.5, -100, 0.5, -50),
		BackgroundColor3 = Color3.new(1, 1, 1)
	}, {
		Roact.createElement(Dropdown, {
			Items = { "Test 1", "Test 2", "Test 3", "Test 4" }
		})
	})
})

Roact.reify(demo, playerGui, "DropdownDemo")
