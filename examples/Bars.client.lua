local Roact = require(game.ReplicatedStorage.Roact)
local Bars = require(game.ReplicatedStorage.UI.spinners.Bars)

local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local demo = Roact.createElement("ScreenGui", {}, {
    Roact.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 100),
        Position = UDim2.new(0.5, -100, 0.5, -50),
        BackgroundColor3 = Color3.new(1, 1, 1)
    }, {
        Roact.createElement(Bars, {
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5)
        })
    })
})

Roact.reify(demo, playerGui, "BarsDemo")