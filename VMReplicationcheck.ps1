# VMReplication status 
$VMReplicationStauts3408 = Invoke-Command -ScriptBlock {Get-VMReplication} -ComputerName rnap03408hv001 | Select-Object VMName,State,Health,Mode,FrequencySec,LastReplicationTime,PrimaryServer,ReplicaServer
$VMReplicationStauts3408_1 = $VMReplicationStauts3408 | Out-String
$Check_3408 = (Invoke-Command -ScriptBlock {Get-VMReplication} -ComputerName rnap03408hv001).State


$VMReplicationStauts3439 = Invoke-Command -ScriptBlock {Get-VMReplication} -ComputerName rnap03439hv001 | Select-Object VMName,State,Health,Mode,FrequencySec,LastReplicationTime,PrimaryServer,ReplicaServer
$VMReplicationStauts3439_1 = $VMReplicationStauts3439 | Out-String
$Check_3439 = (Invoke-Command -ScriptBlock {Get-VMReplication} -ComputerName rnap03439hv001).State

$Content = "$VMReplicationStauts3408_1" + "$VMReplicationStauts3439_1"

#Send eamils to Windows team
If($Check_3408 -eq 'Suspended' -or $Check_3439 -eq 'Suspended'){
$from = "CHSWPET1TST003@Nike.com"
$MailTo = @("Lst-CDT.Retail.Windows.GCHQ@nike.com")
$sub = "Warning !!! your VM replication needs to be changed!!!"
$smtp = "mailhost.nike.com"
Send-MailMessage -To $MailTo -From $from -Subject $sub -Body $Content -SmtpServer $smtp -Priority High
}