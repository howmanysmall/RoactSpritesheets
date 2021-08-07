local Immutable = require(script.Immutable)
local Types = require(script.Types)
local noYield = require(script.noYield)

local folder = script:WaitForChild("Spritesheets")

export type Sprite = Types.Sprite
export type Spritesheet = Types.Spritesheet
export type RoactSpritesheetProps = Types.RoactSpritesheetProps

local SpritesheetsMetatable = {}
function SpritesheetsMetatable:__index(spritesheetName: string)
	local spritesheet = folder:FindFirstChild(spritesheetName)
	if spritesheet then
		local spritesheetData = noYield(require, spritesheet)
		assert(Types.ISpritesheet(spritesheetData))
		self[spritesheetName] = spritesheetData
		return spritesheetData
	else
		return nil
	end
end

local Spritesheets = setmetatable({}, SpritesheetsMetatable)
local DEFAULT_PROPS = {
	ImageType = "ImageLabel",
	Scaled = true,
	Sprite = "Premium",
	Theme = "Economy",
}

--- @param roact Roact
local function RoactSpritesheet(roact, shouldValidateProps: boolean?)
	if shouldValidateProps == nil then
		shouldValidateProps = false
	end

	return function(initProps: RoactSpritesheetProps)
		local props = Immutable.join(DEFAULT_PROPS, initProps)
		if shouldValidateProps then
			assert(Types.IRoactSpritesheetProps(props))
		end

		local spritesheet = Spritesheets[props.Theme]

		if not spritesheet then
			warn(string.format("Spritesheet %q doesn't exist in the Spritesheets folder.", props.Theme))
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(1, 1),
			}, props[roact.Children])
		else
			local sprite = spritesheet.Sprites[props.Sprite]
			if not sprite then
				warn(string.format("Sprite %q doesn't exist in spritesheet %q.", props.Sprite, spritesheet.Name))
				return roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(1, 1),
				}, props[roact.Children])
			end

			local children = props[roact.Children] or {}
			local spriteSize = sprite.ImageRectSize
			local size = UDim2.fromOffset(spriteSize.X, spriteSize.Y)
			if props.Scaled then
				local yOffset = size.Y.Offset
				local xOffset = size.X.Offset
				local ratio = yOffset > xOffset and yOffset / xOffset or xOffset / yOffset

				children = Immutable.join(children, {
					UIAspectRatioConstraint = roact.createElement("UIAspectRatioConstraint", {
						AspectRatio = ratio,
						DominantAxis = Enum.DominantAxis.Height,
					}),
				})

				size = UDim2.fromScale(1, 1)
			end

			return roact.createElement(props.ImageType, Immutable.join(props, {
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(1, 1, 1),
				BorderSizePixel = 0,
				Image = sprite.Image,
				ImageRectOffset = sprite.ImageRectOffset,
				ImageRectSize = spriteSize,
				ImageType = Immutable.None,
				Scaled = Immutable.None,
				Size = size,
				Sprite = Immutable.None,
				Theme = Immutable.None,
				[roact.Children] = children,
			}))
		end
	end
end

return RoactSpritesheet
