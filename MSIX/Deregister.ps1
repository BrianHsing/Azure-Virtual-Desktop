#MSIX app attach deregistration sample

#region variables
$packageName = "notepad_1.0.0.0_x64__78b8wv0dmcrmj"
#endregion

#region deregister
Remove-AppxPackage -PreserveRoamableApplicationData $packageName
#endregion