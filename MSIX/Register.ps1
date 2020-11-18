#MSIX app attach registration sample

#region variables
$packageName = "notepad_1.0.0.0_x64__78b8wv0dmcrmj"
$path = "C:\Program Files\WindowsApps\" + $packageName + "\AppxManifest.xml"
#endregion

#region register
Add-AppxPackage -Path $path -DisableDevelopmentMode -Register
#endregion