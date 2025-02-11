hs.loadSpoon("WindowScreenLeftAndRight")
hs.loadSpoon("WinWin")
hs.loadSpoon("ArrangeDesktop")
-- hs.loadSpoon("MicMute")

local hotkey = require "hs.hotkey"
local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"

local hyper = {"shift", "cmd", "alt", "ctrl"}

window.animationDuration = 0

spoon.WindowScreenLeftAndRight:bindHotkeys({
  screen_left = { hyper, 'h' }, -- move current app to left screen (i.e. monitor)
  screen_right= { hyper, 'l' },
})

-- Enable debug logging
spoon.ArrangeDesktop.logger.setLogLevel('debug')

-- -- Create a hotkey to save the current window arrangement
-- hotkey.bind(hyper, "s", function()
--   local arrangement = spoon.ArrangeDesktop:createArrangement()
--   alert.show("Window arrangement saved to" .. arrangeDesktop.configFile)
-- end)

-- Create a hotkey to apply the last saved arrangement
hotkey.bind(hyper, "a", function()
    -- hs.alert(spoon.ArrangeDesktop.arrangements)
    spoon.ArrangeDesktop.arrangements = spoon.ArrangeDesktop:_loadConfiguration()
    -- spoon.ArrangeDesktop:arrange(spoon.ArrangeDesktop.arrangements.A) 
    spoon.ArrangeDesktop:arrange("work-with-external-monitor") 
end)

-- spoon.MicMute:bindHotkeys({ toggle = { hyper, "m" } }, 0.75