tell application "Audio MIDI Setup"
    activate
end tell

delay 1

tell application "System Events"
    tell process "Audio MIDI Setup"
        click menu item "Open Audio MIDI Setup" of menu "Window" of menu bar 1
        delay 1
        keystroke "M" using {command down, option down}  -- Open Multi-Output Device
        delay 1
        keystroke return
        delay 1
        click button "Add" of UI element 1 of scroll area 1 of window "Audio Devices"
        delay 1
        keystroke return
        delay 1
        click checkbox "BlackHole 16ch" of group 1 of window "Audio Devices"
        delay 1
        click checkbox "Built-in Output" of group 1 of window "Audio Devices"
        delay 1
        set driftCorrectCheckbox to (checkbox "Drift Correction" of group 1 of window "Audio Devices")
        if value of driftCorrectCheckbox is 0 then click driftCorrectCheckbox
        delay 1
    end tell
end tell
