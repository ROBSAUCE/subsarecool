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
$outfilename = Read-Host -Prompt "enter name of file EX: google.csv"
$testifpathvalid = Test-Path -Type Leaf $subdomainfile
$testifpathvalid2 = Test-Path -Type Leaf .\$outfilename
#remove csv if exists
if ($testifpathvalid2 -eq $True){

Write-Host -ForegroundColor Red "Removing current csv"
Remove-Item .\$outfilename
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

$blankspace = "New Record"

foreach($sub in $subs)
{
  Write-Host -ForegroundColor Magenta "Working on "$sub.subs   
# $resolve = Resolve-DnsName -Type ALL -Name $sub.subs -ErrorAction SilentlyContinue 
 #$hashtable.Add($sub , $resolve)
 Resolve-DnsName -Type ALL -Name $sub.subs -ErrorAction SilentlyContinue |select Name,IP4Address,NameHost,QueryType,TTL,Section,NameExchange,Preference| export-csv -Append -Path .\$outfilename -Force -ErrorAction SilentlyContinue
 echo $blankspace |Export-Csv -Path .\$outfilename -Append -Force
}



Write-Host -ForegroundColor Green - "file written to relative path .\subsarecool.csv"
