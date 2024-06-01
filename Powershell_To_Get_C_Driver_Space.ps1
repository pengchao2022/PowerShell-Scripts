$allservers =get-content -path "D:\Server_List\RG_List.txt"
foreach ($oneserver in $allservers)
{
$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $oneserver -Filter "DeviceID='C:'" | Select-Object Size,FreeSpace

}
$disk.Size
$disk.FreeSpace