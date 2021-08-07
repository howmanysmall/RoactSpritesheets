local Immutable = {}

local None = newproxy(true)
getmetatable(None).__tostring = function()
	return "None"
end

Immutable.None = None

function Immutable.copy(dictionary)
	local new = {}
	for key, value in pairs(dictionary) do
		new[key] = value
	end

	return new
end

function Immutable.join(...)
	local new = {}
	for index = 1, select("#", ...) do
		local dictionary = select(index, ...)
		if dictionary then
			for key, value in pairs(dictionary) do
				if value == None then
					new[key] = nil
				else
					new[key] = value
				end
			end
		end
	end

	return new
end

return Immutable
