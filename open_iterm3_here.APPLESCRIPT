on run {input, parameters}
   tell application "Finder"
        set my_file to first item of input
        set filetype to (kind of (info for my_file))
        if filetype is "Folder" or filetype is "Volume" then
            set dir_path to quoted form of (POSIX path of my_file)
        else
            set dir_path to quoted form of (POSIX path of (container of my_file as string))
        end if
    end tell
    cd_here(dir_path)
end run

on cd_here(theDir)
    tell application "iTerm"
        activate
        tell current window
            set newTab to (create tab with default profile)
            tell current session
                write text "cd " & theDir
                write text "reset"
            end tell
        end tell
    end tell
end cd_here

