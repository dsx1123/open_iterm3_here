--Author: shdu
on run {input, parameters}
   tell application "Finder"
end run

on legacy_cd_here(theDir)
    try
        set t to the last terminal
    on error
        set t to (make new terminal)
    end try
    tell t
        launch session "Default Session"
        tell the last session
            write text "cd " & theDir & ";clear;"
        end tell
    end tell
end tell
end legacy_cd_here


on cd_here(theDir)
    tell application "iTerm"
        activate
        if my IsModernVersion(version) then
            tell current window
                set newTab to (create tab with default profile)
                tell current session
                    write text "cd " & theDir
                    write text "reset"
                end tell
            end tell
        else
        legacy_cd_here(theDir)
        end if
    end tell
end cd_here

