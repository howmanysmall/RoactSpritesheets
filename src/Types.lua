local t = require(script.Parent.Vendor.t)

local Types = {}

export type Dictionary<Value> = {[string]: Value}
export type Sprite = {
	-- The image asset for the sprite.
	Image: string,

	-- The position of the sprite on the image.
	ImageRectOffset: Vector2,

	-- The size of the sprite on the image.
	ImageRectSize: Vector2,
}

export type Spritesheet = {
	-- The name of the spritesheet.
	Name: string,

	-- The list sprites in the spritesheet.
	Sprites: Dictionary<Sprite>,
}

export type RoactSpritesheetProps = {
	-- The type of image object.
	ImageType: string,

	-- The props for the image object.
	Native: Dictionary<any>,

	-- Whether or not the sprite will be scaled.
	Scaled: boolean?,

	-- The name of the sprite to use.
	Sprite: string?,

	-- The theme (the name of the spritesheet) to use.
	Theme: string?,
}

Types.ISprite = t.strictInterface({
	Image = t.string,
	ImageRectOffset = t.Vector2,
	ImageRectSize = t.Vector2,
})

Types.ISpritesheet = t.strictInterface({
	Name = t.string,
	Sprites = t.map(t.string, Types.ISprite),
})

Types.IRoactSpritesheetProps = t.interface({
	ImageType = t.literal("ImageLabel", "ImageButton"),
	Native = t.table,
	Scaled = t.optional(t.boolean),
	Sprite = t.optional(t.string),
	Theme = t.optional(t.string),
})

return Types
