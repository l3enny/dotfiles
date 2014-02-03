-- Import the widget box library
local wibox = require("wibox")
local naughty = require("naughty")

-- Create battery widget and align right
battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")

local spacer = " "
local warn_low = 15
local bid = "BAT0"

function update_battery(adapter)
   local fcur = io.open("/sys/class/power_supply/"..adapter.."/energy_now")
   local fcap = io.open("/sys/class/power_supply/"..adapter.."/energy_full")
   local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
   local cur = fcur:read()
   local cap = fcap:read()
   local sta = fsta:read()
   fcur:close()
   fcap:close()
   fsta:close()
   local battery = math.floor(cur * 100 / cap)
   if sta:match("Charging") then
      dir = "▲"
   elseif sta:match("Discharging") then
      dir = "▾"
      if tonumber(battery) <= warn_low then
         naughty.notify({ title = "Battery Warning",
                          text = "Battery low! "..battery.."% left!",
                          timeout = 5,
                          position = "top_right",
                          fg = beautiful.fg_focus,
                          bg = beautiful.bg_focus
         })
      end
   else
      dir = "="
   end
   local display = spacer..dir..spacer..battery.."%"..spacer
   battery_widget:set_markup(display)
end

-- Force initial update of battery
update_battery(bid)

-- Setup timer to refresh battery every n seconds
battery_timer = timer({timeout = 20})
battery_timer:connect_signal("timeout", function() update_battery(bid) end)
battery_timer:start()
