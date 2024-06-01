$ServerName = Get-Content -path "D:\SV_server_list.txt"
$index = @()
$ping = New-Object System.Net.NetworkInformation.Ping

Foreach($Server in $ServerName)
{
    $ipaddress = $null
    $Object = $null
    $Value = $null
 
    
    $ipaddress = ($ping.Send($Server).Address)
 
    If($ipaddress)
    {
        $Value = $ipaddress.IPAddressToString
    }
    Else
    {
        $Value = "The IP Address is not found"
    }
 

    $Object = New-Object PSObject -Property ([ordered]@{ 
 
            Server                  = $Server
            IPAddress               = $Value
 
        }) 
          
    $index += $Object
 
    $Object
}
 
If($index)
{

    $index | Export-Csv -Path D:\Server_With_IP.CSV -NoTypeInformation
}