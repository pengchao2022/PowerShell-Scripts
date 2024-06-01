$Shenzhen_Stage_servers = Get-Content -Path D:\Shenzhen_Stage_ServerList.txt
foreach ($oneserver in $Shenzhen_Stage_servers)
{
    Write-Host "Currently, we are trying to shutdown the server" $oneserver
    Stop-Computer -ComputerName $oneserver -Force

}

