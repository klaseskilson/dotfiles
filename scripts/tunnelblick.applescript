if application "Tunnelblick" is running then
  tell application "Tunnelblick"
    get state of configurations
  end tell
else
  return "NOT_RUNNING"
end if
