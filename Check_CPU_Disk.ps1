$CPUavg = Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average
$mem = Get-WmiObject win32_operatingsystem | Foreach {"{0:N2}" -f ((($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)*100)/ $_.TotalVisibleMemorySize)}
$free = Get-WmiObject Win32_Volume -Filter "DriveLetter = 'C:'" | Foreach {"{0:N2}" -f (($_.FreeSpace / $_.Capacity)*100)}
new-object psobject -prop @{
            ServerName = $env:computername
            AvgCpu = "$CPUavg%"
            MemoryUsage = "$mem%"
            OSDriveUsage = "$free%"
        }