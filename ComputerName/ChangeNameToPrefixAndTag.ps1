##https://docs.microsoft.com/nl-nl/windows/desktop/CIMWin32Prov/win32-systemenclosure
##We look at the systemenclosure to see what this device is.
$currentName = $env:computername

$laptopPrefix = "LP"
$laptopSuffix = ""

$desktopPrefix = "DT"
$desktopSuffix = ""

$assetTag = (Get-WmiObject Win32_SystemEnclosure).SMBiosAssetTag
$currentName = $Env:ComputerName
$newName = $null

If((gwmi win32_computersystem -ea 0).pcsystemtype -ne 2)
{
	echo "$currentName is a Desktop"
	$newName = "$desktopPrefix$assetTag$desktopSuffix"
}
Else
{
	echo "$currentName is a Laptop"
	$newName = "$laptopPrefix$assetTag$laptopSuffix"
}

echo "The current computer name is $currentName"
echo "The new computer name will be $newName"
Rename-Computer -newname($newName)
