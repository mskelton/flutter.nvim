local config = require("flutter.config")
local closing_labels = require("flutter.closing_labels")

local M = {}

M.make_capabilities = function()
	if type(config.opts.lsp.capabilities) == "table" then
		return config.opts.lsp.capabilities
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities.workspace.configuration = true

	-- This setting allows document changes to be made via the lsp e.g. renaming
	-- a file when the containing class is renamed also.
	-- @see: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#workspaceEdit
	capabilities.workspace.workspaceEdit.documentChanges = true

	if config.opts.lsp.capabilities then
		return config.opts.lsp.capabilities(capabilities)
	else
		return capabilities
	end
end

--- Setup the LSP for Dart
M.setup = function()
	require("lspconfig").dartls.setup({
		capabilities = M.make_capabilities(),
		init_options = {
			closingLabels = config.opts.closing_labels.enabled,
		},
		handlers = {
			["dart/textDocument/publishClosingLabels"] = closing_labels.closing_labels,
			["workspace/applyEdit"] = function(_, result, ctx)
				-- The label is not necessary and just creates noise
				result.label = nil

				return vim.lsp.handlers["workspace/applyEdit"](_, result, ctx)
			end,
		},
	})
end

return M
