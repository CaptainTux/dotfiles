local settings = require "settings"
settings.window.home_page = "https://duckduckgo.com/"

local engines = settings.window.search_engines
engines.duckduckgo = "https://duckduckgo.com/"
engines.default = engines.duckduckgo
