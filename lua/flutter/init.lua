local config = require("flutter.config")
local commands = require("flutter.commands")
local lsp = require("flutter.lsp")

local M = {}

--- Setup the plugin
--- @param opts flutter.Options
M.setup = function(opts)
	config.setup(opts)
	commands.setup()
	lsp.setup()
end

return M
