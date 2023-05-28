local M = {}

local command = vim.api.nvim_create_user_command

--- Send a signal to the flutter tool to perform an action
--- @param signal string
M.send_signal = function(signal)
	local dollar = "$"
	if os.getenv("SHELL") == "fish" then
		dollar = ""
	end

	local cmd = string.format(
		'!kill -%s %s(pgrep -f "[f]lutter_tool.*run")',
		signal,
		dollar
	)
	vim.cmd("silent execute '" .. cmd .. "'")
end

M.reload = function()
	M.send_signal("SIGUSR1")
end

M.restart = function()
	M.send_signal("SIGUSR2")
end

M.setup = function()
	command("FlutterReload", M.reload, {})
	command("FlutterRestart", M.restart, {})
end

return M
