## For getting audio output via mini-displayport when surface 4 pro bugs out.


if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}


$driver = "Intel(R) Display Audio"

Get-PnpDevice | where {$_.name -like "$driver*"}
Get-PnpDevice | where {$_.name -like "$driver*"} | Disable-PnpDevice –confirm:$false
Get-PnpDevice | where {$_.name -like "$driver*"} | Enable-PnpDevice –confirm:$false
Write-Host "Restarted $driver driver"
