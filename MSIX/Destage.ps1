#MSIX app attach de staging sample

$vhdSrc="\\stor1111.file.core.windows.net\app\notepad.vhd"

#region variables
$packageName = "notepad_1.0.0.0_x64__78b8wv0dmcrmj"
$msixJunction = "C:\temp\AppAttach"
#endregion

#region deregister
Remove-AppxPackage -AllUsers -Package $packageName
Remove-Item "$msixJunction\$packageName" -Recurse -Force -Verbose
#endregion

#region Detach VHD
Dismount-DiskImage -ImagePath $vhdSrc -Confirm:$false
#endregion