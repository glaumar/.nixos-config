mp.register_event("file-loaded", function()
    local pos = mp.get_property_number("percent-pos", 0)

    if pos > 99 then
        mp.set_property_bool("pause", true)
        mp.commandv("script-message-to", "uosc", "decide-pause-indicator")
    else
        mp.set_property_bool("pause", false)
    end
end)
