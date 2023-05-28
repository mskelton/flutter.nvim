local M = {}

--- The local class instance of the merged user's configuration this includes
--- all default values.
--- @type flutter.Config
local config = {}

--- The class definition for the user configuration
--- @type flutter.Config
local Config = {}

--- Create a new instance of the Config class
--- @param opts flutter.Options
--- @param defaults flutter.Options
function Config:new(opts, defaults)
	assert(opts, "User options must be passed in")
	self.opts = vim.tbl_deep_extend("force", defaults, opts or {})
	return self
end

--- Combine user preferences with defaults preferring the user's own settings
--- @param defaults flutter.Config
--- @return flutter.Config
function Config:merge(defaults)
	assert(
		defaults and type(defaults) == "table",
		"A valid config table must be passed to merge"
	)

	return self
end

--- Get the default config options
--- @return flutter.Options
local function get_defaults()
	return {
		closing_labels = {
			highlight = "Comment",
			prefix = "// ",
			enabled = true,
		},
	}
end

--- Keep track of a users config for use throughout the plugin as well as ensuring
--- defaults are set.
--- @param opts flutter.Options?
function M.setup(opts)
	config = Config:new(opts or {}, get_defaults())
end

--- Get the current config
--- @type flutter.Options
M.opts = {} -- noop

setmetatable(M.opts, {
	__index = function(_, k)
		return config.opts[k]
	end,
})

return M
