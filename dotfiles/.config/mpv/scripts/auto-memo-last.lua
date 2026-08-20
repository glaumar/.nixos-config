-- Opens the last non-deleted file 
mp.observe_property("idle-active", "bool", function(name, idel)
    if idel then
        mp.commandv("script-binding", "memo-last")
    end
end)
