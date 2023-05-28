--- @meta _

--- @class flutter.Options
--- @field public closing_labels flutter.ClosingLabels
--- @field public hot_reload boolean
--- @field public lsp flutter.LspOptions

--- @class flutter.ClosingLabels
--- @field public highlight string
--- @field public prefix string
--- @field public enabled boolean

--- @class flutter.LspOptions
--- @field public capabilities any

--- @class flutter.Config
--- @field public opts flutter.Options
--- @field merge fun(self: flutter.Config, defaults: flutter.Config): flutter.Config
