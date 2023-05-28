local config = require("flutter.config")
local commands = require("flutter.commands")
local autocmd = require("flutter.autocmd")
local lsp = require("flutter.lsp")

local M = {}

--- Setup the plugin
--- @param opts flutter.Options
M.setup = function(opts)
	config.setup(opts)
	commands.setup()
	autocmd.setup()
	lsp.setup()
end

return M
