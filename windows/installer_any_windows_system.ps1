# Install software for any Windows system

# Utilities
& "$PSScriptRoot\apps\install_notepadpp.ps1"
& "$PSScriptRoot\apps\install_7zip.ps1"
& "$PSScriptRoot\apps\install_ccleaner.ps1"
& "$PSScriptRoot\apps\install_windirstat.ps1"
& "$PSScriptRoot\apps\install_greenshot.ps1"
& "$PSScriptRoot\apps\install_foxit_reader.ps1"

# Browsers
& "$PSScriptRoot\apps\install_firefox.ps1"
& "$PSScriptRoot\apps\install_brave.ps1"

# Communication
& "$PSScriptRoot\apps\install_discord.ps1"
& "$PSScriptRoot\apps\install_teamviewer.ps1"
& "$PSScriptRoot\apps\install_zoom.ps1"

# Media
& "$PSScriptRoot\apps\install_vlc.ps1"
& "$PSScriptRoot\apps\install_picard.ps1"

# Security
& "$PSScriptRoot\apps\install_pia.ps1"
& "$PSScriptRoot\apps\install_malwarebytes.ps1"

# Microsoft tools
& "$PSScriptRoot\apps\install_windows_terminal.ps1"
& "$PSScriptRoot\apps\install_pc_health_check.ps1"
& "$PSScriptRoot\apps\install_update_assistant.ps1"
& "$PSScriptRoot\apps\install_powertoys.ps1"

# Development
& "$PSScriptRoot\apps\install_vscode.ps1"

# Copy ll.bat to System32
copy "$PSScriptRoot\ll.bat" C:\Windows\System32\
