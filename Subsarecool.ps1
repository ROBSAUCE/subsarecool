#obligitory ascii art

Write-Host -ForegroundColor Blue -BackgroundColor Black "


 _____       _           ___           _____             _ 
/  ___|     | |         / _ \         /  __ \           | |
\ `--. _   _| |__  ___ / /_\ \_ __ ___| /  \/ ___   ___ | |
 `--. \ | | | '_ \/ __||  _  | '__/ _ \ |    / _ \ / _ \| |
/\__/ / |_| | |_) \__ \| | | | | |  __/ \__/\ (_) | (_) | |
\____/ \__,_|_.__/|___/\_| |_/_|  \___|\____/\___/ \___/|_|

Super cool subdomain outputter thing!

"


$subdomainfile =  read-host -Prompt "path to the subdomains file "
$testifpathvalid = Test-Path -Type Leaf $subdomainfile
$testifpathvalid2 = Test-Path -Type Leaf .\subsarecool.csv
#remove csv if exists
if ($testifpathvalid2 -eq $True){

Write-Host -ForegroundColor Red "Removing current csv"
Remove-Item .\subsarecool.csv
}
else{write-host -ForegroundColor Green "No csv yet"
}

#testpath exists
if ($testifpathvalid -eq $True){
$subs = Import-Csv -Path $subdomainfile
$subdomain = $subs.subs 
Write-Host -ForegroundColor Green "Path is valid $subdomainfile"
}
else{write-host -ForegroundColor Red "FileNotFound"
Exit
}

sleep 2

foreach($sub in $subs)
{
  Write-Host -ForegroundColor Magenta "Working on "$sub.subs   
  Resolve-DnsName -Type ALL -Name $sub.subs -ErrorAction SilentlyContinue |export-csv -Append -Path .\subsarecool.csv -Force -ErrorAction SilentlyContinue
}

Write-Host -ForegroundColor Green - "file written to relative path .\subsarecool.csv"