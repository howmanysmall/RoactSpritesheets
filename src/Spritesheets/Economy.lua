local ROBUX_SIZE = Vector2.new(28, 32)

local Economy = {
	Name = "Economy",
	Sprites = {
		Premium = {
			Image = "rbxassetid://4456265931",
			ImageRectOffset = Vector2.new(5, 5),
			ImageRectSize = Vector2.new(28, 28),
		},

		RobuxDark = {
			Image = "rbxassetid://4456265931",
			ImageRectOffset = Vector2.new(43, 5),
			ImageRectSize = ROBUX_SIZE,
		},

		RobuxShadow = {
			Image = "rbxassetid://4456265931",
			ImageRectOffset = Vector2.new(81, 5),
			ImageRectSize = ROBUX_SIZE,
		},

		RobuxGold = {
			Image = "rbxassetid://4456265931",
			ImageRectOffset = Vector2.new(5, 47),
			ImageRectSize = ROBUX_SIZE,
		},

		RobuxLight = {
			Image = "rbxassetid://4456265931",
			ImageRectOffset = Vector2.new(43, 47),
			ImageRectSize = ROBUX_SIZE,
		},
	},
}

return Economy
