local config = require("flutter.config")

local M = {}

local ns = vim.api.nvim_create_namespace("flutter_closing_labels")

local function render_labels(labels, opts)
	vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
	opts = opts or {}

	local highlight = opts.highlight or "Comment"
	local prefix = opts.prefix or "// "

	for _, item in ipairs(labels) do
		local line = item.range["end"].line
		local ok, err =
			pcall(vim.api.nvim_buf_set_extmark, 0, ns, tonumber(line), -1, {
				virt_text = {
					{ prefix .. item.label, highlight },
				},
				virt_text_pos = "eol",
				hl_mode = "combine",
			})

		if not ok then
			local name = vim.api.nvim_buf_get_name(0)
			print(
				string.format(
					"Error drawing label for %s on line %d because: ",
					name,
					line,
					err
				)
			)
		end
	end
end

--- returns a function which handles rendering floating labels
function M.closing_labels(err, response, _)
	local opts = config.opts.closing_labels
	if err or not opts.enabled then
		return
	end

	-- This check is meant to prevent stray events from over-writing labels that
	-- don't match the current buffer.
	if response.uri ~= vim.uri_from_bufnr(0) then
		return
	end

	render_labels(response.labels, opts)
end

return M
