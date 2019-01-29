$currentName = $env:computername

$currentInfo = Get-WmiObject Win32_ComputerSystem

echo "The current computer name is $currentName"
$newName = Read-Host -Prompt "Enter the new computer name: "

if ($newName){
	Rename-Computer -newname($newName)
}
else{
	echo "You didn't input anything valid. The computer name wasn't changed"
}