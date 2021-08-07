-- This is meant only to prevent modules from yielding so we can cache them.
local function resultHandler(thread: thread, success: boolean, ...)
	if not success then
		local message = (...)
		error(debug.traceback(thread, message), 2)
	end

	if coroutine.status(thread) ~= "dead" then
		error(debug.traceback(thread, "Attempted to yield on load!"), 2)
	end

	return ...
end

local function noYield(callback, ...)
	local thread = coroutine.create(callback)
	return resultHandler(thread, coroutine.resume(thread, ...))
end

return noYield
