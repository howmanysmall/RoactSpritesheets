local ReplicatedStorage = game:GetService("ReplicatedStorage")
local roact = assert(ReplicatedStorage:FindFirstChild("Roact", true))

local Immutable = require(script.Parent.Immutable)

--- @type Roact
local Roact = require(roact)
local RoactSpritesheets = require(script.Parent)(Roact)

local function createAutomatedScrollingFrame(
	scrollingFrame: ScrollingFrame,
	possibleUIGridStyleLayout: UIGridStyleLayout?
)
	--- @type UIGridStyleLayout
	local uiGridStyleLayout = possibleUIGridStyleLayout or scrollingFrame:FindFirstChildWhichIsA("UIGridStyleLayout")

	local function updateFrame()
		local absoluteContentSize = uiGridStyleLayout.AbsoluteContentSize
		scrollingFrame.CanvasSize = UDim2.fromOffset(absoluteContentSize.X, absoluteContentSize.Y)
	end

	updateFrame()
	uiGridStyleLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateFrame)
end

local AutomatedScrollingFrame = Roact.PureComponent:extend("AutomatedScrollingFrame")

function AutomatedScrollingFrame:init(props)
	self.ref = props[Roact.Ref] or Roact.createRef()
end

function AutomatedScrollingFrame:didMount()
	local layout

	if self.props.Layout then
		layout = self.props.Layout:getValue()
	end

	createAutomatedScrollingFrame(self.ref:getValue(), layout)
end

function AutomatedScrollingFrame:render()
	local props = Immutable.copy(self.props)
	props.Layout = nil
	props[Roact.Ref] = self.ref
	return Roact.createElement("ScrollingFrame", props)
end

local SPRITESHEETS = {
	{
		Name = "Economy",
		Entries = {"Premium", "RobuxDark", "RobuxShadow", "RobuxGold", "RobuxLight"},
	},

	{
		Name = "Gestures",
		Entries = {
			"DoubleRotate",
			"DoubleTap",
			"FingerFront",
			"FingerSide",
			"FullCircle",
			"HalfCircle",
			"Hold",
			"QuarterCircle",
			"ScrollDown",
			"ScrollLeft",
			"ScrollRight",
			"ScrollUp",
			"SwipeBottom",
			"SwipeBottomLeft",
			"SwipeBottomRight",
			"SwipeLeft",
			"SwipeRight",
			"SwipeTopLeft",
			"SwipeTopRight",
			"SwipeUp",
			"Tap",
			"ZoomIn",
			"ZoomOut",
		},
	},

	{
		Name = "KeyboardDark",
		Entries = {
			"BackspaceAlt",
			"Command",
			"Eleven",
			"Return",
			"EnterAlt",
			"EnterTall",
			"MarkLeft",
			"MarkRight",
			"MouseButton1",
			"MouseButton3",
			"MouseWheel",
			"MouseButton2",
			"MouseMovement",
			"PlusTall",
			"Shift",
			"ShiftAlt",
			"Ten",
			"Tilda",
			"Twelve",
			"Win",
			"A",
			"Asterisk",
			"B",
			"Backspace",
			"C",
			"CapsLock",
			"D",
			"Delete",
			"Down",
			"E",
			"Eight",
			"End",
			"Escape",
			"F",
			"F1",
			"F10",
			"F11",
			"F12",
			"F2",
			"F3",
			"F4",
			"F5",
			"F6",
			"F7",
			"F8",
			"F9",
			"Five",
			"Four",
			"G",
			"H",
			"Home",
			"I",
			"Insert",
			"J",
			"K",
			"L",
			"Left",
			"LeftAlt",
			"LeftBracket",
			"LeftControl",
			"M",
			"Minus",
			"N",
			"Nine",
			"NumLock",
			"O",
			"One",
			"P",
			"PageDown",
			"PageUp",
			"Plus",
			"Print",
			"Q",
			"Question",
			"Quote",
			"R",
			"Right",
			"RightBracket",
			"S",
			"Semicolon",
			"Seven",
			"Six",
			"Slash",
			"Space",
			"T",
			"Tab",
			"Three",
			"Two",
			"U",
			"Up",
			"V",
			"W",
			"X",
			"Y",
			"Z",
			"Zero",
		},
	},

	{
		Name = "KeyboardLight",
		Entries = {
			"BackspaceAlt",
			"Command",
			"Eleven",
			"Return",
			"EnterAlt",
			"EnterTall",
			"MarkLeft",
			"MarkRight",
			"MouseButton1",
			"MouseButton3",
			"MouseWheel",
			"MouseButton2",
			"MouseMovement",
			"PlusTall",
			"Shift",
			"ShiftAlt",
			"Ten",
			"Tilda",
			"Twelve",
			"Win",
			"A",
			"Asterisk",
			"B",
			"Backspace",
			"C",
			"CapsLock",
			"D",
			"Delete",
			"Down",
			"E",
			"Eight",
			"End",
			"Escape",
			"F",
			"F1",
			"F10",
			"F11",
			"F12",
			"F2",
			"F3",
			"F4",
			"F5",
			"F6",
			"F7",
			"F8",
			"F9",
			"Five",
			"Four",
			"G",
			"H",
			"Home",
			"I",
			"Insert",
			"J",
			"K",
			"L",
			"Left",
			"LeftAlt",
			"LeftBracket",
			"LeftControl",
			"M",
			"Minus",
			"N",
			"Nine",
			"NumLock",
			"O",
			"One",
			"P",
			"PageDown",
			"PageUp",
			"Plus",
			"Print",
			"Q",
			"Question",
			"Quote",
			"R",
			"Right",
			"RightBracket",
			"S",
			"Semicolon",
			"Seven",
			"Six",
			"Slash",
			"Space",
			"T",
			"Tab",
			"Three",
			"Two",
			"U",
			"Up",
			"V",
			"W",
			"X",
			"Y",
			"Z",
			"Zero",
		},
	},

	{
		Name = "XboxDark",
		Entries = {
			"ButtonX",
			"ButtonY",
			"ButtonA",
			"ButtonB",
			"ButtonR1",
			"ButtonL1",
			"ButtonR2",
			"ButtonL2",
			"ButtonR3",
			"ButtonL3",
			"ButtonSelect",
			"DPadLeft",
			"DPadRight",
			"DPadUp",
			"DPadDown",
			"Thumbstick1",
			"Thumbstick2",
			"DPad",
			"Controller",
			"RotateThumbstick1",
			"RotateThumbstick2",
		},
	},

	{
		Name = "XboxLight",
		Entries = {
			"ButtonX",
			"ButtonY",
			"ButtonA",
			"ButtonB",
			"ButtonR1",
			"ButtonL1",
			"ButtonR2",
			"ButtonL2",
			"ButtonR3",
			"ButtonL3",
			"ButtonSelect",
			"DPadLeft",
			"DPadRight",
			"DPadUp",
			"DPadDown",
			"Thumbstick1",
			"Thumbstick2",
			"DPad",
			"Controller",
			"RotateThumbstick1",
			"RotateThumbstick2",
		},
	},
}

local function UICorner(props)
	return Roact.createElement("UICorner", {
		CornerRadius = UDim.new(0, props.Offset),
	})
end

local function UIPadding(props)
	local value = props.Value
	return Roact.createElement("UIPadding", {
		PaddingBottom = value,
		PaddingTop = value,
		PaddingLeft = value,
		PaddingRight = value,
	})
end

local function RemovePrefix(String, Prefix)
	return string.sub(String, 1, #Prefix) == Prefix and string.sub(String, #Prefix + 1) or String
end

local function SpritesheetEntry(props)
	local keyCode = props.KeyCode

	return Roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
	}, {
		UICorner = Roact.createElement(UICorner, {
			Offset = 8,
		}),

		UIPadding = Roact.createElement(UIPadding, {
			Value = UDim.new(0, 5),
		}),

		UIListLayout = Roact.createElement("UIListLayout"),

		PhaseTextLabel = Roact.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			Font = Enum.Font.Roboto,
			LayoutOrder = 2,
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, 0, 0, 30),
			Text = RemovePrefix(keyCode, "Mouse"),
			TextColor3 = Color3.new(0.1, 0.1, 0.1),
			TextSize = 20,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextWrapped = false,
		}),

		Spritesheet = Roact.createElement(RoactSpritesheets, {
			ImageType = "ImageLabel",
			Scaled = true,
			Sprite = keyCode,
			Theme = props.Theme,
		}),
	})
end

local function SpritesheetTitle(props)
	return Roact.createElement("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.Roboto,
		LayoutOrder = props.LayoutOrder,
		Position = UDim2.fromScale(0.5, 0),
		Size = UDim2.new(1, -10, 0, 40),
		Text = props.Text,
		TextColor3 = Color3.new(0.1, 0.1, 0.1),
		TextSize = 24,
		TextWrapped = true,
	})
end

local SpritesheetSection = Roact.PureComponent:extend("SpritesheetSection")

function SpritesheetSection:init()
	self:setState({
		size = UDim2.fromScale(1, 0),
	})

	self.ref = Roact.createRef()
end

function SpritesheetSection:didMount()
	local current = self.ref:getValue()
	if current then
		task.delay(0.1, function()
			self:setState({
				size = UDim2.new(1, 0, 0, current.AbsoluteContentSize.Y),
			})
		end)
	end
end

function SpritesheetSection:render()
	local children = {
		UIGridLayout = Roact.createElement("UIGridLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			CellSize = UDim2.fromOffset(100, 130),
			[Roact.Ref] = self.ref,
		}),
	}

	local props = self.props
	local theme = props.Theme
	for _, keyCode in ipairs(props.KeyCodes) do
		children[keyCode] = Roact.createElement(SpritesheetEntry, {
			KeyCode = keyCode,
			Theme = theme,
		})
	end

	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = props.LayoutOrder,
		Size = self.state.size,
	}, children)
end

type TitleSectionProps = {
	--
	Entries: Array<string>,
	Name: string,
	SectionOrder: number,
	TitleOrder: number,
}

local function TitleSection(props)
	local name = props.Name

	return Roact.createFragment({
		[string.format("%sTitle", name)] = Roact.createElement(SpritesheetTitle, {
			LayoutOrder = props.TitleOrder,
			Text = name,
		}),

		[string.format("%sSection", name)] = Roact.createElement(SpritesheetSection, {
			KeyCodes = props.Entries,
			LayoutOrder = props.SectionOrder,
			Theme = name,
		}),
	})
end

local function RoactSpritesheetsStory()
	local children = {
		UIListLayout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	}

	local layoutOrder = -1
	local function Add(props)
		layoutOrder += 2
		return Immutable.join(props, {
			SectionOrder = layoutOrder,
			TitleOrder = layoutOrder - 1,
		})
	end

	for index, spritesheet in ipairs(SPRITESHEETS) do
		children[index] = Roact.createElement(TitleSection, Add({
			Entries = spritesheet.Entries,
			Name = spritesheet.Name,
		}))
	end

	return Roact.createElement(AutomatedScrollingFrame, {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
	}, children)
end

Roact.setGlobalConfig({
	elementTracing = true,
	internalTypeChecks = false,
	propValidation = false,
	typeChecks = false,
})

return function(Target)
	local Tree = Roact.mount(Roact.createElement(RoactSpritesheetsStory), Target, "RoactSpritesheetsStory")

	return function()
		Roact.unmount(Tree)
	end
end
