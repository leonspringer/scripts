
$url = "http://192.168.1.2/sd/20170615/record000/"
$user = "admin"
$pass = "password"

$CMD = 'vlc.exe'
$playerpath = 'C:\Program Files (x86)\VideoLAN\VLC'
$m3ufile = 'C:\Users\MyName\Documents\Scripts\VideoDownload.m3u'


$secPass = convertTo-secureString $pass -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($user,$secPass)

$hsg = Invoke-WebRequest -Uri $url -Credential $cred

#$hsg.Links
$vidlinks = $hsg.Links | select -ExpandProperty innerText

write-host $url
$output = foreach ($href in $vidlinks) {
            "$($url)$($href)" 
           }
$output| Out-File -Encoding UTF8 $m3ufile 

& $playerpath\$CMD $m3ufile