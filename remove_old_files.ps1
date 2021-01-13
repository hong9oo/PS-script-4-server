# Back up files if needed before old files removal

$robocopy C:\FTP C:\FTP_backup /FFT /Z /XA:H /W:5


# Attributes
# /FFT - Assumes FAT file times
# /Z - Copies files in restartable mode
# /XA:H - Excludes hidden files
# /W:5 - Wait 5 seconds between retries

# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy


# Remove files that did not have any change in the 30 days and longer

$Get-ChildItem "C:\FTP" -Recurse -Force ea 0 | ?{!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Remove-Item -Force
