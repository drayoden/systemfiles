#!/bin/bash

# For some reason, the nightly brave browser does not display
# it's icon(s) correctly after launch from the dock in ubuntu.
# Found this fix and automated it here with 'sed'.
# Not optimized, only ran once after brave is updated.

# StartupWMClass=brave-browser
# Terminal=false

if grep -q "ShartupWMClass" /usr/share/applications/brave-browser-nightly.desktop
then
    echo "StarupWMClass already exists..."
else
    echo "inserting StarupWMClass..."/usr/share/applications/
    sed '/Terminal=false/a StartupWMClass=brave-browser' /usr/share/applications/brave-browser-nightly.desktop > /usr/share/applications/brave-browser-nightlyNEW.desktop 
    cp /usr/share/applications/brave-browser-nightlyNEW.desktop /usr/share/applications/brave-browser-nightly.desktop
fi
