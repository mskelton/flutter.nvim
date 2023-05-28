local config = require("flutter.config")
local commands = require("flutter.commands")

local M = {}

local group = vim.api.nvim_create_augroup("flutter", {})

M.setup = function()
	if config.opts.hot_reload then
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = group,
			pattern = "*.dart",
			callback = commands.reload,
		})
	end
end

return M
